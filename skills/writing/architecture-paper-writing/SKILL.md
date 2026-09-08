---
name: architecture-paper-writing
description: Construct and revise computer-architecture papers by aligning problem, mechanism, evidence, and claims through cold-reader, senior-architect, and skeptical-reviewer passes. Use for sections, figures, rebuttals, or full manuscripts.
---

# Architecture Paper Writing

Present the final intellectual structure, not the research diary. Preserve the
author's intent while making the contribution evidence-bounded and understandable
without project history.

## Build the Argument

Before polishing sentences, freeze five statements:

1. **Problem:** What important system behavior limits the target outcome?
2. **Missing decision:** What can the closest work not represent or control?
3. **Insight:** What principle enables a different organization?
4. **Mechanism:** What state, decision, action, and timing implement it?
5. **Evidence:** What strongest valid result supports the bounded claim?

Repair this chain before line editing. Do not present a feature combination, a
new metric, or an implementation substrate as the contribution.

Give sections distinct jobs: Introduction frames the gap; Background defines
required concepts and closest work; Motivation establishes requirements; Design
explains mechanism and cost; Evaluation tests claims; Conclusion summarizes
validated findings.

## Write Precisely

Give each paragraph one argumentative job:

`claim or question -> evidence or mechanism -> reason -> implication`

Define unfamiliar terms, metrics, variables, granularities, and time windows at
first use. Introduce a term only for a genuinely new object, decision, or
mechanism. Keep terminology stable across prose, equations, figures, and captions.

Credit capabilities prior work already has. Compare closest mechanisms by
`object | information | decision | action | timing | feedback | cost`; state a
bounded difference rather than claiming prior work “ignores” a topic.

Separate measured results, architecture-informed interpretations, and untested
hypotheses. Do not infer performance from a proxy, causality from correlation,
generality from a selected cohort, or full-system cost from partial synthesis.
Recheck baselines, units, normalization, workload counts, and headline numbers.

Make figures part of the argument. A reader scanning the title, abstract,
introduction, figures, and captions should recover the problem, mechanism, and
main result. Inspect the rendered paper, not only its source.

## Review and Iterate

Run four passes after each substantial revision:

1. **Cold reader:** undefined terms, hidden assumptions, and logical jumps.
2. **Senior architect:** bottleneck, causal path, hardware feasibility,
   alternatives, scalability, and closest-work distinction.
3. **Skeptical reviewer:** novelty, evidence, fairness, reproducibility,
   simplicity, and overclaiming.
4. **Revision:** repair the highest-impact problem with the smallest coherent
   change, then reread the surrounding section.

Repeat only while a reject-level issue or material comprehension failure remains.
Return the revised artifact first, followed by a concise rationale and any
evidence blocker that prose cannot repair.
