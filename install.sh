#!/bin/sh
set -eu

harness=${1:-}
repo_url=${FACT_LAB_SKILLS_REPO:-https://github.com/brandon-lee-bo/FACT-Lab-skills.git}
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

if ! command -v git >/dev/null 2>&1; then
    echo "Cannot install: git is required." >&2
    exit 1
fi

if [ -d "$catalog_dir/.git" ]; then
    git -C "$catalog_dir" pull --ff-only
elif [ -e "$catalog_dir" ]; then
    echo "Cannot install: $catalog_dir already exists and is not this catalog." >&2
    exit 1
else
    mkdir -p "$(dirname "$catalog_dir")"
    git clone --depth 1 "$repo_url" "$catalog_dir"
fi

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
