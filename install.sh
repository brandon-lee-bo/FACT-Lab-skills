#!/bin/sh
set -eu

harness=${1:-}
archive_url=${FACT_LAB_SKILLS_ARCHIVE_URL:-https://codeload.github.com/brandon-lee-bo/FACT-Lab-skills/tar.gz/refs/heads/main}
catalog_dir=${FACT_LAB_SKILLS_HOME:-"$HOME/.local/share/fact-lab-skills"}

case "$harness" in
    codex)
        skills_dir=${CODEX_SKILLS_DIR:-"${CODEX_HOME:-$HOME/.codex}/skills"}
        ;;
    claude-code)
        skills_dir=${CLAUDE_SKILLS_DIR:-"${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills"}
        ;;
    pi)
        skills_dir=${PI_SKILLS_DIR:-"$HOME/.pi/agent/skills"}
        ;;
    omp)
        skills_dir=${OMP_SKILLS_DIR:-"$HOME/.omp/agent/skills"}
        ;;
    *)
        echo "Usage: install.sh {codex|claude-code|pi|omp}" >&2
        exit 2
        ;;
esac

for command_name in curl tar; do
    if ! command -v "$command_name" >/dev/null 2>&1; then
        echo "Cannot install: $command_name is required." >&2
        exit 1
    fi
done

tmp_dir=$(mktemp -d "${TMPDIR:-/tmp}/fact-lab-skills.XXXXXX")
previous_catalog=
cleanup() {
    if [ -n "$previous_catalog" ] && \
       [ ! -e "$catalog_dir" ] && [ -e "$previous_catalog" ]; then
        mv "$previous_catalog" "$catalog_dir"
    fi
    rm -rf "$tmp_dir"
}
trap cleanup 0 1 2 15

archive="$tmp_dir/catalog.tar.gz"
curl -fsSL --retry 3 --connect-timeout 15 "$archive_url" -o "$archive"
tar -xzf "$archive" -C "$tmp_dir"
downloaded_catalog="$tmp_dir/FACT-Lab-skills-main"

if [ ! -d "$downloaded_catalog/skills" ]; then
    echo "Cannot install: downloaded catalog has an unexpected layout." >&2
    exit 1
fi

if [ -e "$catalog_dir" ] || [ -L "$catalog_dir" ]; then
    if [ ! -d "$catalog_dir" ]; then
        echo "Cannot install: $catalog_dir is not a directory." >&2
        exit 1
    fi
    if [ ! -d "$catalog_dir/.git" ] && \
       [ ! -f "$catalog_dir/.fact-lab-skills-catalog" ] && \
       [ -n "$(ls -A "$catalog_dir" 2>/dev/null)" ]; then
        echo "Cannot install: $catalog_dir is not managed by this installer." >&2
        exit 1
    fi
    previous_catalog="$tmp_dir/previous-catalog"
    mv "$catalog_dir" "$previous_catalog"
fi

mkdir -p "$(dirname "$catalog_dir")"
if ! mv "$downloaded_catalog" "$catalog_dir"; then
    if [ -n "$previous_catalog" ] && [ -e "$previous_catalog" ]; then
        mv "$previous_catalog" "$catalog_dir"
        previous_catalog=
    fi
    exit 1
fi
previous_catalog=
: > "$catalog_dir/.fact-lab-skills-catalog"

mkdir -p "$skills_dir"
installed=0

for category_dir in "$catalog_dir"/skills/*; do
    [ -d "$category_dir" ] || continue
    for skill_dir in "$category_dir"/*; do
        [ -f "$skill_dir/SKILL.md" ] || continue
        skill_name=$(basename "$skill_dir")
        target="$skills_dir/$skill_name"

        if [ -L "$target" ]; then
            current_target=$(readlink "$target")
            case "$current_target" in
                "$catalog_dir"/*) ;;
                *)
                    echo "Cannot install $skill_name: $target links to another source." >&2
                    exit 1
                    ;;
            esac
        elif [ -e "$target" ]; then
            echo "Cannot install $skill_name: $target already exists." >&2
            exit 1
        fi

        ln -sfn "$skill_dir" "$target"
        installed=$((installed + 1))
    done
done

if [ "$installed" -eq 0 ]; then
    echo "No valid skills found in $catalog_dir/skills." >&2
    exit 1
fi

echo "Installed $installed FACT-Lab skills for $harness in $skills_dir."
