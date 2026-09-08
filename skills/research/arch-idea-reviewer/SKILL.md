---
name: arch-idea-reviewer
description: Discover and review computer-architecture research ideas through primary-literature mapping, mechanism analysis, cheap falsification, and skeptical reviewer checks. Use before committing substantial implementation or experiment resources to a new direction.
---

# Architecture Idea Reviewer

Find a defensible research direction, not merely a plausible mechanism. Connect
every surviving idea to an important architectural problem, measurable outcome,
concrete action, fair baseline, falsification test, and credible cost story.

## Workflow

1. **Anchor the project.** Identify the research question, target system,
   strongest valid evidence, closest baseline, available artifact, primary
   metric, excluded directions, resource budget, and stop conditions. Separate
   measured facts, architecture-informed interpretations, and hypotheses.

2. **Map prior work by mechanism.** Search primary papers and official artifacts.
   For the closest work, extract:
   `problem | object | information | timing | action | feedback | cost | evidence`.
   Use ISCA, MICRO, HPCA, and ASPLOS as the core venue set; add systems, EDA, or
   AI venues only when the mechanism crosses those boundaries.

3. **Locate the opportunity.** Trace the proposed bottleneck through
   `event -> resource pressure -> exposed execution effect -> outcome`. A proxy
   such as misses, accuracy, utilization, or stalls is not itself a performance
   problem. Prefer gaps in decision scope, action location, observable state,
   timescale, or implementation cost over renamed feature combinations.

4. **Generate competing candidates.** Produce structurally different ideas and
   include the strongest simple non-ML alternative. For each idea, state its
   one-sentence contribution, closest-work difference, state/action/timing,
   primary metric, mandatory baseline, cheapest falsification, hardware path,
   and likely failure mode.

5. **Review before commitment.** Challenge the strongest version from four
   perspectives: novelty, architectural causality, experimental soundness, and
   simplicity. If an LLM is proposed, identify the capability unavailable from
   counters, profiling, rules, compilers, or lightweight learning.

6. **Gate the next experiment.** First prove action headroom, then observable
   selector quality, and finally the complete implementable mechanism. Keep the
   action and information contracts fixed across attribution experiments.

## Decision

Return one verdict with supporting evidence:

- `admit-cheap-gate`: credible and cheaply falsifiable;
- `revise-once`: one concrete repair could change the verdict;
- `reject-or-pivot`: occupied, unmeasurable, unnecessary, or lacking headroom.

Preserve rejected directions and their reasons. Pivot when repeated iterations
add no mechanism evidence, proxies diverge from the primary outcome, or a
simpler baseline captures the proposed value.
