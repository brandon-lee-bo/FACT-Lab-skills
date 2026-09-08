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

Install a skill by passing its GitHub directory to Codex:

```text
$skill-installer install https://github.com/brandon-lee-bo/FACT-Lab-skills/tree/main/skills/<category>/<skill-name>
```

Restart Codex, then invoke it explicitly:

```text
$<skill-name> Describe the research task you want the skill to perform.
```

Example using an existing public skill:

```text
$skill-installer install https://github.com/brandon-lee-bo/brandon-lee-bo.github.io/tree/source/skills/arch-idea-reviewer

$arch-idea-reviewer Generate ideas based on this repo and review them in a skeptical reviewer style.
```

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

Before opening a pull request:

- place the skill in its primary category;
- use a lowercase, hyphenated directory name matching `name`;
- state both what the skill does and when it should trigger;
- capture a reusable workflow, its checks, and meaningful failure conditions;
- add supporting files only when they improve execution;
- exclude credentials, private data, unpublished results, and temporary paths;
- test the skill on a realistic task and summarize that test in the pull request.

See the [Agent Skills specification](https://agentskills.io/specification) for
the underlying format.
