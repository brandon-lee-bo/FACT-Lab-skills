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
| [🔬 **Research**](skills/research) | Literature, research questions, hypotheses, and mechanism exploration |
| [🧪 **Experiment**](skills/experiment) | Experiment design, implementation, simulation, and hardware evaluation |
| [🔍 **Review**](skills/review) | Cold reading, expert critique, evidence audits, and sign-off |
| [✍️ **Writing**](skills/writing) | Paper structure, drafting, figure narratives, rebuttals, and polishing |

> The catalog is intentionally empty until the first skills complete review.

## 🚀 Use a Skill

Install every skill in this repository into the harness you use. Each command
targets only the selected harness.

[OpenAI Codex](#openai-codex) · [Claude Code](#claude-code) · [Pi](#pi)

### OpenAI Codex

```bash
npx -y skills@latest add brandon-lee-bo/FACT-Lab-skills --skill '*' --global --agent codex --yes
```

Codex detects the installed skills automatically; restart only if they do not
appear. Invoke a skill with:

```text
$<skill-name> Describe the research task.
```

### Claude Code

```bash
npx -y skills@latest add brandon-lee-bo/FACT-Lab-skills --skill '*' --global --agent claude-code --yes
```

Claude Code normally detects the installed skills without restarting. If its
top-level skill directory did not exist when the current session started,
restart once. Invoke a skill with:

```text
/<skill-name> Describe the research task.
```

### Pi

```bash
npx -y skills@latest add brandon-lee-bo/FACT-Lab-skills --skill '*' --global --agent pi --yes
```

Run `/reload` in Pi; no restart is required. Invoke a skill with:

```text
/skill:<skill-name> Describe the research task.
```

These commands use the open-source
[`skills` CLI](https://github.com/vercel-labs/skills) and require `npx`. See
the harness documentation for
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

See the [Agent Skills specification](https://agentskills.io/specification) for
the underlying format.
