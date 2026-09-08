---
name: architecture-paper-writing
description: Construct and revise computer-architecture papers by aligning problem, mechanism, evidence, and claims through cold-reader, senior-architect, and skeptical-reviewer passes. Use for sections, figures, rebuttals, or full manuscripts.
---

# Architecture Paper Writing

Present the final intellectual structure, not the research diary. Preserve intent
while making the contribution evidence-bounded and clear without project history.

## Build the Argument

Before drafting prose, freeze the **problem**, **missing decision**, **insight**,
**mechanism**, and strongest valid **evidence**. Repair this chain before line
editing. A feature combination, metric, formula, or implementation substrate is
not itself the contribution.

Give each section and paragraph a contract: its question, permitted conclusion,
evidence, and boundary. Introduction frames the gap. Background defines necessary
concepts and closest work. Motivation establishes the problem or requirements.
Design explains mechanism and cost. Evaluation tests benefit and cause. Conclusion
summarizes validated findings. Fix this progression before polishing language.

Before an important section, read its counterparts in the closest top-venue papers
for argument, evidence, and figure choices. Do not copy wording or structure.

## Write Precisely

Give each paragraph one job, normally `claim or question -> evidence or mechanism
-> reason -> implication`. Every sentence must serve the paragraph, connect to its
neighbors, and define, claim, support, or explain. Delete repetition, empty
transitions, and detached defensive caveats.

Define unfamiliar terms, metrics, granularities, and windows at first use. Name
only genuinely new objects or decisions. Never replace explanation with a name.

Credit capabilities prior work already has. Compare closest mechanisms by
`object | information | decision | action | timing | feedback | cost`. State a
bounded difference instead of saying prior work “ignores” a topic. Cite the exact
fact, capability, or limitation being discussed.

Explain mechanisms through observed information, resulting decision, executed
hardware or software action, and timing.

Separate measurements, architecture-informed interpretations, and hypotheses.
Do not infer performance from a proxy, causality from correlation, generality
from a selected cohort, or full-system cost from partial synthesis. Recheck
baselines, normalization, workload counts, and headline numbers.

Make each figure answer a declared question. Preserve negative results and needed
conditions. Keep typography, color, scale, and legends consistent, and inspect
the rendered figure at its actual column width.

Write direct English with standard terms and short sentences. Avoid ornate
phrasing and semicolons when ordinary sentences are clearer.

## Review and Iterate

Run at least two cycles after a substantial revision:

1. **Cold reader:** undefined terms, hidden assumptions, and logical jumps.
2. **Senior architect:** bottleneck, causal path, hardware feasibility,
   alternatives, scalability, and closest-work distinction.
3. **Skeptical evidence reviewer:** novelty, evidence scope, fairness,
   reproducibility, negative results, and overclaiming.

Record concrete failures, repair the highest-impact one with the smallest coherent
change, then reread the surrounding context. Stop when no reject-level or material
comprehension issue remains. Return the revision first, then a concise rationale
and any evidence blocker that prose cannot repair.
