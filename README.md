<div align="center">

# FACT-Lab Skills

**Reusable research workflows for AI coding agents**

A small, curated collection of Agent Skills created and reviewed by FACT-Lab.

[Browse Manager Skills](skills/manager) · [Planner](skills/planner) · [Engineer](skills/engineer) · [Reviewer](skills/reviewer)

</div>

---

## Repository and Structure

FACT-Lab Skills turns repeatable research experience into reusable workflows.
A skill should tell an agent when a research procedure applies, how to execute
it, and how to judge whether its output is valid. It is more than a one-off
prompt or a collection of general suggestions.

Skills are organized by their primary role in the research process, not by
author:

```text
FACT-Lab-skills/
├── README.md
└── skills/
    ├── manager/       # Project state, coordination, and evidence promotion
    ├── planner/       # Literature, hypotheses, mechanisms, and experiment plans
    ├── engineer/      # Implementation, simulation, instrumentation, and hardware
    └── reviewer/      # Claims, baselines, papers, figures, and sign-off
```

| Category | Typical use |
|---|---|
| **Manager** | Maintain project state, coordinate resources, record decisions, and promote evidence between research stages |
| **Planner** | Frame research questions, position related work, form hypotheses, decompose mechanisms, and design experiments |
| **Engineer** | Implement mechanisms, run simulations, validate systems, generate artifacts, and evaluate hardware cost |
| **Reviewer** | Audit novelty, evidence, baselines, manuscript logic, figures, rebuttals, and final claims |

The repository starts with an empty catalog. Skills will be added after their
content and scope have been reviewed.

---

## Using a Skill

Every published skill has its own GitHub directory. For example:

```text
https://github.com/brandon-lee-bo/brandon-lee-bo.github.io/tree/source/skills/arch-idea-reviewer
```

To install it, enter the following command in a Codex conversation:

```text
$skill-installer install https://github.com/brandon-lee-bo/brandon-lee-bo.github.io/tree/source/skills/arch-idea-reviewer
```

Restart Codex after installation. You can then invoke the skill explicitly:

```text
$arch-idea-reviewer Generate ideas based on this repo and review them in a skeptical reviewer style.
```

For a skill published in this repository, use its complete directory URL:

```text
$skill-installer install https://github.com/brandon-lee-bo/FACT-Lab-skills/tree/main/skills/<role>/<skill-name>
```

Then restart Codex and use:

```text
$<skill-name> Describe the research task you want the skill to perform.
```

This repository is currently private, so the environment running Codex must
have permission to access it.

---

## Adding a Skill

A skill is a directory containing an entry file named exactly `SKILL.md`:

```text
skills/<role>/<skill-name>/
├── SKILL.md           # Required: metadata and instructions
├── references/        # Optional: focused documentation
├── scripts/           # Optional: executable helpers or checks
└── assets/            # Optional: reusable templates or resources
```

Every `SKILL.md` must begin with YAML frontmatter containing `name` and
`description`:

```markdown
---
name: paper-writing-review-loop
description: Review and revise research-paper prose through cold-reader, domain-expert, and evidence-audit passes. Use when polishing a paper section, figure narrative, or rebuttal.
---

# Paper Writing Review Loop

Instructions for the agent begin here.
```

Contribution rules:

1. Place the skill under `manager`, `planner`, `engineer`, or `reviewer` based
   on its primary role.
2. Use lowercase letters, numbers, and hyphens for `<skill-name>`.
3. Make the frontmatter `name` exactly match the skill directory name.
4. Write a `description` that explains both what the skill does and when it
   should be used; agents rely on this field for discovery.
5. Encode a repeated, non-obvious research workflow rather than a one-off
   prompt or generic advice.
6. State the expected outcome, important checks, evidence boundaries, and
   meaningful failure conditions.
7. Keep `SKILL.md` focused. Add `references/`, `scripts/`, or `assets/` only
   when they materially improve the workflow.
8. Do not include credentials, private data, unpublished results, temporary
   machine paths, or project-specific secrets.
9. Test the skill on a realistic research task before proposing it for shared
   use.

Open a pull request containing the skill directory and briefly explain the
problem it captures, when it should trigger, and how it was tested.
