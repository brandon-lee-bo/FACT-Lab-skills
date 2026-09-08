<div align="center">

# 🔬 FACT-Lab Skills

**Reusable research workflows for AI coding agents**

[![Agent Skills](https://img.shields.io/badge/Agent%20Skills-open%20standard-4f46e5)](https://agentskills.io)
[![Catalog](https://img.shields.io/badge/catalog-curated-0f766e)](#-skill-catalog)
[![Last commit](https://img.shields.io/github/last-commit/brandon-lee-bo/FACT-Lab-skills?label=updated&color=475569)](https://github.com/brandon-lee-bo/FACT-Lab-skills/commits/main)

[Browse](#-skill-catalog) · [Install](#-use-a-skill) · [Contribute](#-add-a-skill)

</div>

FACT-Lab Skills turns repeatable research experience into concise, reusable
workflows. Each skill defines when a procedure applies, how to execute it, and
how to validate the result.

## 📚 Skill Catalog

Skills are grouped by research role rather than contributor:

| Category | Focus |
|---|---|
| [🔬 **Researcher**](skills/researcher) | Literature, research questions, hypotheses, and mechanism exploration |
| [🛠️ **Engineer**](skills/engineer) | Implementation, experiments, simulation, and hardware evaluation |
| [🔍 **Review**](skills/review) | Cold reading, expert critique, evidence audits, and sign-off |
| [✍️ **Writing**](skills/writing) | Paper structure, drafting, figure narratives, rebuttals, and polishing |

> The catalog is intentionally empty until the first skills complete review.

## 🚀 Use a Skill

The same `SKILL.md` works across supported harnesses, but installation and
refresh commands differ.

[OpenAI Codex](#openai-codex) · [Claude Code](#claude-code) · [Pi](#pi)

### OpenAI Codex

Pass the skill directory to the installer:

```text
$skill-installer install https://github.com/brandon-lee-bo/FACT-Lab-skills/tree/main/skills/<category>/<skill-name>
```

Codex detects new skills automatically; restart only if the skill does not
appear. Invoke it with:

```text
$<skill-name> Describe the research task you want the skill to perform.
```

For example:

```text
$skill-installer install https://github.com/brandon-lee-bo/brandon-lee-bo.github.io/tree/source/skills/arch-idea-reviewer

$arch-idea-reviewer Generate ideas based on this repo and review them in a skeptical reviewer style.
```

### Claude Code

Clone this repository and copy the selected skill into Claude Code's personal
skill directory:

```bash
git clone --depth 1 https://github.com/brandon-lee-bo/FACT-Lab-skills.git
mkdir -p ~/.claude/skills
cp -R FACT-Lab-skills/skills/<category>/<skill-name> ~/.claude/skills/
```

Claude Code normally detects the new skill without restarting. If
`~/.claude/skills` did not exist when the current session started, restart
Claude Code once. Invoke it with `/skill-name`.

### Pi

Copy the selected skill from the cloned repository into Pi's personal skill
directory:

```bash
mkdir -p ~/.pi/agent/skills
cp -R FACT-Lab-skills/skills/<category>/<skill-name> ~/.pi/agent/skills/
```

Run `/reload` in Pi, then invoke the skill with `/skill:skill-name`; no restart
is required.

See the official skill documentation for
[Codex](https://developers.openai.com/codex/skills/),
[Claude Code](https://code.claude.com/docs/en/skills), and
[Pi](https://github.com/badlogic/pi-mono/blob/main/packages/coding-agent/docs/skills.md).

## ➕ Add a Skill

Each skill is a directory with a required `SKILL.md` entry point:

```text
skills/<category>/<skill-name>/
├── SKILL.md        # Required
├── references/     # Optional
├── scripts/        # Optional
└── assets/         # Optional
```

Begin `SKILL.md` with discoverable metadata:

```yaml
---
name: paper-writing-review-loop
description: Review and revise research-paper prose through cold-reader, domain-expert, and evidence-audit passes. Use when polishing a paper section, figure narrative, or rebuttal.
---
```

Before pushing a skill:

- place the skill in its primary category;
- use a lowercase, hyphenated directory name matching `name`;
- state both what the skill does and when it should trigger;
- capture a reusable workflow, its checks, and meaningful failure conditions;
- add supporting files only when they improve execution;
- exclude credentials, private data, unpublished results, and temporary paths;
- test the skill on a realistic task.

Anyone may contribute without asking first. Push the skill to a branch or fork
and submit the change when it is ready.

See the [Agent Skills specification](https://agentskills.io/specification) for
the underlying format.
