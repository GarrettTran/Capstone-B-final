# Capstone Final Report Workspace

## Purpose

This repository supports the QUOTA team's capstone final report for the NTG Agent project. The primary deliverable is an English academic report authored in Typst. The application codebase and Markdown knowledge base (KB) provide context and evidence for that report.

Prioritize clear arguments, accurate reporting, and a coherent narrative. Inspect implementation details only as deeply as needed to explain or substantiate the report. Application development is outside the default scope unless explicitly requested.

## Sources and Requirements

Read the relevant material in `Requirements/` before drafting or revising report content:

- `Capstone Final Report Template.docx`: report structure and presentation guidance.
- `AssessmentDetails.md`: required content and recommended section lengths.
- `rubric.md`: assessment criteria and relative priorities.
- `info.md`: team members, student IDs, supervisors, company, and project identity.
- `Capstone-Project-Completion-Plan-Report-TeamQuota.pdf`: baseline scope, reported progress, planned deliverables, schedule, and evaluation targets.
- `Kitto-Final-Report-1.docx`: prior-team report identified by the user as a high-scoring example; use selectively for writing and analytical patterns, not as an assessment requirement or evidence about NTG Agent.

Use each source for its intended purpose. The completion plan records claims and intentions at its publication time; it is not automatic proof of the final outcome. Follow explicit user instructions when adapting the report. Flag substantive conflicts between source documents rather than silently choosing or merging incompatible facts. Treat stale instructional wording in the template in the context of the final-report assessment requirements.

Use `ntg-agent/` as implementation evidence. Read relevant documentation and entry points first, then inspect specific code and tests when necessary. Documentation may describe intended behavior, and the presence of a test does not establish that it passes. Observe any applicable nested `AGENTS.md` when working within that directory.

## Evidence, Contributions, and Timeline

Compare the completion plan with the team's actual work at the deliverable or feature level. Maintain enough detail to distinguish each member's contributions and the project timeline without performing an exhaustive code audit.

When recording a comparison, capture:

- Deliverable or feature and its planned scope.
- Planned assignee or team responsibility and planned dates or milestone.
- Actual contribution, contributor, and dates, when supported by evidence.
- Current status, supporting source references, and deviations from the plan.
- Missing evidence or questions that require confirmation.

Keep planned assignments separate from verified contributions, and planned dates separate from actual dates. Distinguish implemented functionality from tested, evaluated, or deployed functionality. Preserve scope changes and their documented rationale.

Do not infer authorship, completion dates, or successful delivery from code presence, file timestamps, or migration names. At workspace initialization, the local Git history contains one import commit; it does not establish the original development history or individual contributions. Reassess if additional history becomes available. Use attributable records, meeting minutes, original commits or pull requests, and explicit user confirmations when available; identify their evidentiary limits.

Never invent measurements, experiment outcomes, citations, meeting minutes, sponsor feedback, or personal contributions. Label unsupported statements as unverified and identify what evidence is needed. Keep evaluation targets distinct from measured results, and record the setup and source for any reported measurement.

## Markdown Knowledge Base

Use Markdown KB notes as durable context for subsequent report work. Reuse an existing KB structure when available; do not create a large speculative documentation hierarchy during initialization.

Write KB notes in English and retain:

- Verified project facts with traceable file paths, document sections or page numbers, or external source links.
- User-confirmed decisions, including their context and confirmation date where available.
- Deliverable comparisons, member contributions, and timeline evidence.
- Open questions, conflicting evidence, and known limitations.

Distinguish source-backed facts, user confirmations, and interpretations. Update notes when evidence changes, preserving meaningful scope or timeline changes. Do not promote a draft statement into a verified fact merely because it appears in the KB. Exclude credentials and other secrets from notes and report artifacts.

## Report Structure and Writing

Follow the supplied template, including front matter, contents, lists of figures and tables, and these main sections:

1. Executive summary.
2. Project background and problem statement.
3. Literature review and market research.
4. Solution design.
5. Result analyses and discussions.
6. Summary and reflection.
7. References.
8. Appendices.
9. Meeting journals.

Use the assessment's recommended section lengths as guidance rather than inventing a fixed total page limit. Allocate appropriate analytical depth to Solution Design and Results, which account for 40% and 30% of the rubric respectively.

Write the report in academic English with precise, readable sentences and logical transitions. Develop a connected argument from the problem and research gap through design decisions, implementation, evaluation, and limitations. Explain technical choices and tradeoffs at the level needed by an academic reader; avoid unnecessary implementation detail and unsupported promotional claims.

Use IEEE citations and references. Verify that each cited source supports the associated claim. Clearly separate prior research, the team's work, and proposed future work. Present results against the agreed deliverables and success criteria, including unmet goals and limitations.

Write reflection from the team's collective perspective, objectively and constructively. Keep factual individual-contribution tracking distinct from reflection; do not use reflection to blame or criticize individuals. Include authentic meeting journals when supplied and flag missing records rather than fabricating them.

## Writing Patterns Adapted from the Kitto Example

The following rules adapt useful patterns from `Requirements/Kitto-Final-Report-1.docx`. The section names below identify their source. They support the current rubric; they do not replace the required template or establish why the example received its grade. Transfer the reasoning structure, not the example's prose, project facts, references, metrics, or claims of novelty.

- **Build the background toward a specific gap.** Following the example's “Project background and Problem Statement,” move from supported context to affected users, their concrete difficulty, shortcomings of existing approaches, and the project's intended contribution. Distinguish practical value from any research contribution; claim theoretical novelty only when substantiated. For NTG Agent, connect verified enterprise workflows and user needs to the capabilities the team actually delivered.
- **Synthesize the review into design criteria.** The example's “Financial Platforms and Market Tools” groups alternatives and ends with a gap synthesis. Compare relevant products and techniques along consistent dimensions that matter to NTG Agent, then explain how the findings inform requirements or design choices. Use a compact comparison table when useful. Avoid a catalogue of tools or paper summaries with no connection to the solution, and verify original sources before citing them.
- **Explain scope evolution before detailed design.** Adapt “Project Refinement” and “Performance Metrics Refinement”: state the original commitment, the change, the evidenced constraint or finding behind it, and the effect on deliverables and evaluation. Use the QUOTA completion plan as the baseline. Preserve original and revised targets with their rationale; do not silently redefine success after seeing results.
- **Describe architecture from the whole system to meaningful workflows.** Following “Detailed System Design,” introduce a system overview, then explain relevant subsystems through their purpose, inputs, processing, outputs, and integration points. For NTG Agent, select workflows supported by code, such as document ingestion and retrieval or an agent request involving tools and UI updates. Include state, access boundaries, and failure handling where needed to understand the design; avoid class-by-class walkthroughs.
- **Explain choices through constraints and tradeoffs.** The example's “Core Web System,” deployment discussion, and agent section connect technologies to implementation needs. For each consequential NTG Agent choice, explain the requirement, relevant alternative, selection rationale, and resulting tradeoff. Separate a documented team decision from a rationale inferred during report preparation. Attribute reused frameworks and distinguish their capabilities from the team's own integration work.
- **Make evaluation conditions visible.** Adapt the performance and configuration tables: identify the target, measurement method, input or task set, relevant system configuration, observed result, and evidence. Put concise conditions near the result and extensive details in an appendix. Compare alternatives only under comparable conditions or disclose differences. Use NTG Agent's agreed metrics; do not import the example's ML metrics or manufacture experiments.
- **Separate accomplishments from analysis.** The example first groups “Key results & accomplishments” by component, then provides “Results analysis.” Keep a concise deliverable/status overview before deeper evaluation, using consistent feature names across scope, design, and results. In analysis, move from an observed result to its interpretation, implications for users or requirements, and limits. Connect contribution and timeline records to this overview where useful without repeating the full project history.
- **Discuss failures and variation, not only headline results.** The example's sentiment error breakdown and stock prediction analysis inspect weaker cases and comparison conditions. For NTG Agent, analyze available evidence for failed tasks, retrieval gaps, tool failures, latency variation, or other relevant limitations alongside successful cases. Distinguish observations from possible explanations; a screenshot demonstrates the depicted behavior, not general reliability or usability.
- **Connect limitations to concrete future work.** Adapt “Discussion of Project Issues & Limitations” and “Recommendations for Future Work”: explain each observed limitation, its user or operational impact, and a corresponding feasible improvement with a way to evaluate it. Treat expected benefits as hypotheses until tested. Prioritize recommendations by evidenced impact and resource constraints rather than adding an unrelated feature wish list.
- **Ground reflection in episodes and lessons.** Following “Effective Strategies and Successes” and “Challenges and Lessons Learned,” connect an actual team practice or incident to its outcome, the lesson, and a specific adjustment for future work. Support claims about collaboration with available records; avoid generic praise of Agile or teamwork.
- **Use figures and tables to advance the argument.** The example uses overview and pipeline diagrams, result plots, configuration tables, and appendix screenshots. Choose each visual to answer a concrete reader question, refer to it in the prose, and explain its takeaway. Keep essential design and evaluation evidence in the main text and supporting detail in appendices. Recreate visuals from NTG Agent evidence with readable labels and consistent Typst numbering; do not copy the sample's visuals or screenshot volume.

Before finalizing a draft, check consistency across the executive summary, scope, design, results, tables, and conclusion: feature status, model or provider names, configuration, dataset or task counts, metric values, and evaluation conditions must agree or explain their differences. The Kitto example attributes roughly 63% accuracy to different models in its accomplishments and detailed analysis; do not reproduce that inconsistency. Write or revise the executive summary after the results are stable, covering the problem, solution, verified headline outcomes, contribution, and a brief guide to the report within the recommended length. Prefer concise academic prose over the example's repeated summaries or promotional adjectives.

## Typst and Validation

Author report sources in Typst. Preserve the template's required structure and presentation intent when translating it to Typst. Reuse existing report organization, styling, bibliography, and build commands if present; establish and document them when report authoring begins.

After changing Typst sources, compile the report to PDF and inspect the output for layout problems, overflow, headings, page numbering, figure and table captions, cross-references, and bibliography consistency. Verify that required sections are present and substantive claims remain traceable to evidence. If compilation or visual inspection cannot be performed, state the limitation explicitly.

For Markdown-only guidance changes, check accuracy, referenced paths, and the diff; an application build or test run is unnecessary. Run application checks only when needed to support a specific report claim or an explicitly requested code change, and report exactly what was verified.

Preserve supplied requirement documents and application sources during ordinary report work. Do not modify them merely to resolve a reporting discrepancy. Initial workspace setup creates this root guidance file only; report drafting and KB population follow the user's subsequent tasks.
