#!/bin/sh
set -eu

repo_url=${FACT_LAB_SKILLS_REPO:-https://github.com/brandon-lee-bo/FACT-Lab-skills.git}
catalog_dir=${FACT_LAB_SKILLS_HOME:-"$HOME/.local/share/fact-lab-skills"}
omp_skills_dir=${OMP_SKILLS_DIR:-"$HOME/.omp/agent/skills"}

if [ -d "$catalog_dir/.git" ]; then
    git -C "$catalog_dir" pull --ff-only
elif [ -e "$catalog_dir" ]; then
    echo "Cannot install: $catalog_dir already exists and is not this catalog." >&2
    exit 1
else
    mkdir -p "$(dirname "$catalog_dir")"
    git clone --depth 1 "$repo_url" "$catalog_dir"
fi

mkdir -p "$omp_skills_dir"
installed=0

for category_dir in "$catalog_dir"/skills/*; do
    [ -d "$category_dir" ] || continue
    for skill_dir in "$category_dir"/*; do
        [ -f "$skill_dir/SKILL.md" ] || continue
        skill_name=$(basename "$skill_dir")
        target="$omp_skills_dir/$skill_name"

        if [ -e "$target" ] && [ ! -L "$target" ]; then
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

echo "Installed $installed FACT-Lab skills for OMP. Restart OMP to load them."
