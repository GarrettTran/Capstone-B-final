# NTG-agent-vnext: Report Writing Process

Updated: 20 September 2026. This document records the writing workflow, user-confirmed context, and remaining validation work. It is not the final report.

## 1. Submission and writing constraints

- Course: **OENG1185 - Capstone Project B**.
- Project: **NTG-agent-vnext**; team: **QUOTA**; industry partner: **NashTech**.
- Repository: https://github.com/nashtech-garage/ntg-agent.
- Write in academic English, using Typst and IEEE references. Retain the required template structure while improving readability and consistency.
- **Presentation preference (21 September 2026):** omit “Review draft” and implementation/trial-evidence or market-review update lines from the report cover and running header. Keep evidence provenance in the relevant body content and working notes.
- **The assessed body MUST be fewer than 20 pages.** Per the user's supplied rule, exclude the cover page, table of contents, references, tables and figures within the body, appendices, and meeting journals. This overrides earlier recommended section lengths where they conflict.
- Aim for approximately 16.5 pages of assessed prose: executive summary 1, background 1.5, literature/market review 3, solution design 6, results/discussion 4, reflection 1. Do not pad Results with unsupported performance claims.
- Also aim to keep the complete main body, including visuals, within 19 physical pages as a conservative working budget. Move extensive evidence to appendices; do not shrink text to achieve the budget. Report the actual count and exclusions at final review.
- Retain the working evidence cutoff of **22 September 2026**, based on the completion plan's Showcase milestone. The exact submission time and programme name/code remain unconfirmed; do not infer them from the sample report.

## 2. Evidence levels

Keep these categories separate in working notes:

1. **Source-backed:** directly supported by a document, code, original GitHub history, or recorded test output.
2. **User-confirmed:** supplied by the user on 20 September 2026; cite that provenance internally. This does not automatically establish an exact date, benchmark result, or sponsor acceptance.
3. **Proposed reconstruction:** plausible retrospective wording prepared for team review. Dates, attendance, weekly sequencing, action ownership, and deadlines remain unverified until checked.
4. **Open:** unavailable, inconsistent, or awaiting clarification.

Use the completion plan as the planned baseline, not as proof of delivery. Review original GitHub PRs/commits before making detailed contribution or date claims. Do not equate commit counts with individual effort. Twelve original GitHub PRs and their full commit lists were retrieved and matched to local application integration commits on 20 September 2026; see Section 12 and `KB/github-delivery-history.md`.

## 3. Member responsibilities

The user confirmed the following primary areas. Supporting roles and PR integration dates are now corroborated by the GitHub review in Section 12; exact effort and task-start dates are not inferred.

| Member | GitHub identity supplied | Primary contribution area |
| --- | --- | --- |
| Vu Gia An | `PepeDaFrog`; `An Vu Gia` | LightRAG, document isolation, and access control, jointly with Chau |
| Tran Nguyen Quy Khang | `GarrettTran` | Agents-as-tools architecture, multiple-provider integration, and available-model discovery |
| Nguyen Dinh Minh Chau | `Annie-Chau` | LightRAG, document isolation, and access control, jointly with An |
| Nguyen Tien | `TienNgen` | AG-UI and agent skills defined through `SKILL.md` |

The retrieved PR records use `AnVuGia`, while linked commits use `PepeDaFrog` and the integration commit name `An Vu`, consistent with the user-confirmed An identity. Preserve these observed identifiers. Derive supporting work from selected commits rather than these broad responsibility areas. Use `Requirements/info.md` for student IDs and supervisor names.

## 4. Confirmed design changes and report implications

### Agent-level knowledge isolation

The user describes a change from tagging documents to provisioning separate LightRAG instances for agents, giving each agent its own knowledge base. Explain the isolation boundary, provisioning implications, and resource/maintenance tradeoffs. Do not present isolation as experimentally proven until there is suitable evidence.

**Clarified by the user on 20 September 2026:** when the client has the appropriate permissions, the outer agent calls an inner agent as a tool. The inner agent queries its own isolated KB and returns an answer to the outer agent. The outer agent does not directly query the inner agent's KB in this flow. Describe this as permission-controlled knowledge access through agent delegation.

The completion plan, pp. 8 and 10, proposed shared knowledge spaces with many-to-many agent/container mappings. Delegation does not establish that this storage topology was implemented: distinguish the confirmed agent-to-agent knowledge flow from the planned storage mapping. Verify the mapping and permission enforcement in code before classifying that specific deliverable as implemented or deferred. The user's clarification establishes the intended flow, not a security test result.

### Provider discovery and thinking-mode capability checks

The user reports that administrators can fetch available models and test thinking-mode support by sending a probe payload using the same thinking parameter as a real request, before enabling the setting for an agent. Khang owns this area. Verify request construction, error handling, and the settings gate in code. Describe a successful probe as compatibility evidence for that endpoint/model/configuration, not proof of reasoning quality or universal provider support.

### Administrator-defined agent skills

The user reports adding `SKILL.md` support so administrators can define additional skills for their agents. Tien owns this area alongside AG-UI. Explain the authoring/import/assignment/runtime path at report level and distinguish platform agent skills from the writing assistant's installed skills.

### Local setup automation and reflection

The user reports that local setup was cumbersome and caused development friction. The team introduced an automation script that prompts for required API and environment inputs and supplies defaults for non-sensitive settings, such as internal database connection settings. Explain the problem, response, and expected onboarding benefit for future developers. Verify the script's secret handling and configuration boundaries; do not reproduce credentials. No before/after setup timings have been supplied, so report the usability motivation and mechanism without claiming a measured speedup. The author and delivery date remain open.

## 5. Resources and stakeholder context

User-confirmed support:

- NashTech supplied infrastructure for hosting LightRAG and access to model deployments, described by the user as GPT-5.1 and DeepSeek V4 Pro.
- The university provided **US$300 of Claude API support** for development assistance and testing with Anthropic models.

Preserve these as user-reported resource facts. Verify exact deployment/model identifiers, support periods, and budget-versus-spend before using precise operational or cost claims. The US$300 support is not evidence of actual expenditure. Do not independently assert vendor model availability from these names.

No attributable sponsor feedback, pushback, or acceptance record was supplied in this update. Draft discussion prompts may cover deployment simplicity, isolation overhead, and handover clarity, but must not be represented as statements made by named mentors. Capture actual recollections during team review before adding attributed feedback to the report.

## 6. Evaluation status and writing approach

Earlier, the user reported that formal benchmarking and AI-output evaluation were incomplete because the team lacked time to research the evaluation properly. On 20 September 2026, the user supplied `Requirements/NTG-Agent-Retrieval-Trials.pdf`, which reports three preliminary retrieval trials. Update the narrative: preliminary retrieval evidence exists, while the formal planned evaluation and valid human answer-quality scoring remain incomplete. **Defer new benchmark execution for the current writing pass.** Review existing evidence and request missing records without blocking design/documentation work. See `KB/retrieval-trials-review.md` for findings and claim boundaries.

Retain the completion plan's six metric groups as original commitments: retrieval quality, ingestion latency, TTFT/full-response latency, availability, conversation cost, and quality gates. Their targets remain targets. The supplied trial PDF reports retrieval hit-rates, latency comparisons and sampled backend availability; these are summary-reported values, not independently recomputed results. They do not establish achievement of all planned targets. CI evidence may be checked separately, but do not infer it from the presence of workflow files.

Write Results around verified deliverables, documented functional examples, deviations from the plan, and limitations of the available evidence. Include the preliminary retrieval trials with their small-corpus and cache limitations, and clearly state that formal human answer-quality comparison has not been completed. Discuss resulting uncertainty and future evaluation without fabricating scores, latency percentiles, uptime, cost savings, or pass/fail outcomes. Do not call the product production-ready merely because that milestone date has passed.

## 7. Timeline and weekly meeting drafts

Use these completion-plan milestones as the baseline:

| Phase | Planned window | Planned milestone |
| --- | --- | --- |
| Phase 2: advanced agents and product completeness | 20 July - 26 August 2026 | Feature Complete: 26 August |
| Phase 3: evaluation and production hardening | 17 August - 9 September 2026 | Production Ready: 9 September |
| Phase 4: polish and delivery | 7 - 22 September 2026 | Showcase Delivery: 22 September |

The user says actual progress broadly followed this schedule. Exact completion dates and milestone achievement still require validation, especially where evaluation was not completed.

Create twelve weekly entries using a **proposed Monday cadence from 6 July to 21 September 2026**. Weeks 1-2 provide baseline/consolidation context before Phase 2; this is an editorial assumption, not a confirmed semester start or meeting calendar. Dates and placement of technical discussions are editable reconstruction scaffolding.

Use `Requirements/meeting-minutes.pdf` for the layout: team and meeting title/number; Meeting Details (Date, Time, Attendees, Apologies, Copy To); Information / Decision (item number and discussion summary); Action Items (number, item, owner, due date). The supplied PDF contains six earlier April-May entries; preserve it unchanged. The new twelve-entry series is labelled Capstone B Week 01-12, not a replacement or continuation with invented historical numbering.

- One page per entry, concise English, twelve individually editable and compilable Typst sources: `report/meeting-minutes/week-01.typ` through `week-12.typ`. Shared layout lives in `report/meeting-minutes/template.typ`. Each weekly file owns its own metadata, discussion and actions.
- Separate outputs: `output/pdf/meeting-minutes/week-01.pdf` through `week-12.pdf`. The optional combined export `report/meeting-minutes.typ` imports the weekly records without duplicating their content and builds `output/pdf/meeting-minutes.pdf`.
- The prominent retrospective/proposed-agenda banner has been removed at the user's request. Review status remains in the footer and validation fields. Week 12 remains a proposed agenda in its content. The working provenance and unconfirmed allocations remain recorded here.
- User clarification (20 September 2026): meetings usually take place on Mondays at either 10:00 AM or 2:00 PM. The user confirms that Nguyen Le Quynh Thien and Nguyen Sieu Anh attend as Industrial Supervisors. Record their past attendance as user-confirmed and their Week 12 participation as expected.
- Allocate the two start times across the twelve drafts in UTC+7, without inventing durations. Per-week times and QUOTA attendance remain proposed. For Weeks 9-12, assign one proposed absence per week to Chau or An (two each); do not invent reasons. These randomized allocations require team validation and are not evidence of attendance. Distribution remains unconfirmed.
- Technical context can use user-confirmed facts, but the asserted week and proposed actions must remain visibly provisional. Draft action assignments are suggestions, not verified historical responsibilities.
- Do not invent sponsor quotations, signed approvals, completed tests, or benchmark results. Use unassigned stakeholder questions where feedback would otherwise be fabricated.
- Each entry includes an editable validation field. The team must correct dates, participants, discussion wording, actions, and outcomes before an entry becomes a confirmed retrospective record. Preserve retrospective provenance even after confirmation. Do not submit unreviewed drafts as contemporaneous meeting evidence.

### Proposed attendance allocations

The user requested draft randomization; this table records the resulting editable allocation, not historical findings.

| Week | Proposed start (UTC+7) | Proposed QUOTA absence |
| --- | --- | --- |
| 01 | 10:00 AM | None proposed |
| 02 | 2:00 PM | None proposed |
| 03 | 10:00 AM | None proposed |
| 04 | 10:00 AM | None proposed |
| 05 | 2:00 PM | None proposed |
| 06 | 10:00 AM | None proposed |
| 07 | 2:00 PM | None proposed |
| 08 | 2:00 PM | None proposed |
| 09 | 10:00 AM | An |
| 10 | 10:00 AM | Chau |
| 11 | 2:00 PM | An |
| 12 | 2:00 PM | Chau |

## 8. Writing sequence and deliverables

1. Maintain this process document and prepare the twelve meeting drafts for user review.
2. Build a compact Markdown KB with source references, a deliverable/status comparison, contribution mapping, and open questions. Reuse this document's confirmed facts rather than maintaining conflicting copies.
3. Prepare the report outline and reusable Typst styling within the revised page budget.
4. Draft Solution Design first, then Background and Literature Review. Research original sources when drafting; the Kitto example supplies writing patterns only.
5. Draft Results using evidence available at the cutoff, explicitly recording the evaluation gap. Add team-confirmed reflection, contribution/timeline appendices, and reviewed journals.
6. Write the Executive Summary last. Compile and inspect the complete PDF, check IEEE references, and audit consistency and length.

Keep each writing increment reviewable. Preserve source requirements and application code. Do not modify the application merely to make it match a report claim.

## 9. Reference selection

User preference confirmed on 20 September 2026: cite where claims need support and choose credible sources rather than collecting large numbers of references. Do not treat the earlier suggested 15-25 sources as a quota. Prefer original research for methods and official documentation for protocol/framework behaviour. Use independent research for comparative performance claims rather than relying on vendor promotion. Verify relevance, version/date and the exact claim supported. Keep literature findings separate from NTG Agent measurements. The local retrieval-trial PDF is project evidence, not external validation of the platform.

## 10. Review checklist and open items

- Confirm the twelve-week calendar and each meeting's actual existence, attendance, timing, and action outcomes.
- Verify the confirmed outer-to-inner delegation flow and client permission enforcement in code. Separately check the planned many-to-many storage mapping; do not equate it with agents-as-tools delegation.
- GitHub contribution review completed for twelve PRs: An owns the main installer changes; Chau adds macOS/demo-plan work. Validate additional effort or contributions outside the selected records if needed.
- Confirm remaining feature/deployment status, actual sponsor comments, and any additional reflection episodes.
- Verify provider deployment names and resource support wording; confirm exact submission time and programme metadata.
- Obtain the retrieval-trial evidence bundle, gold mappings, metric definition and harness configuration. Use the existing PDF as preliminary summary evidence; keep human answer-quality evaluation and other unsupported targets incomplete.
- Compile a week with `typst compile report/meeting-minutes/week-01.typ output/pdf/meeting-minutes/week-01.pdf` (substitute 01-12). For the optional combined PDF, use `typst compile report/meeting-minutes.typ output/pdf/meeting-minutes.pdf`. Render and check clipping, row wrapping, footer placement, numbering, and provisional labels.
- Final report acceptance requires the fewer-than-20-page rule, traceable factual claims, consistent results across sections, and reviewed meeting records. Working drafts may contain clearly labelled unresolved items.

## 11. First report draft — 20 September 2026

The user requested a complete trial draft, with emphasis on the retrieval trials' strengths and constructive discussion of the remaining evaluation needs. Avoid the label “weak benchmark”; preserve the scope and limitations of the measurements.

- Source entry point: `report/main.typ`; section files: `report/sections/`; IEEE bibliography: `report/references.bib`.
- Review PDF: `output/pdf/capstone-final-report-draft.pdf`.
- Five vector figures: system architecture, authorised inner-agent retrieval, planned delivery Gantt chart, retrieval hit rates and relative retrieval latency.
- Five main-body tables plus two appendix tables cover alternatives, scope changes, contributions, trial conditions, success criteria, source paths and aggregate data.
- `KB/report-evidence.md` records the implementation evidence and its limits. `report/README.md` documents editing, builds and remaining review items.
- The initial main body occupies 14 pages including visuals, below the fewer-than-20-page requirement. Full PDF is 33 pages including excluded matter and the twelve independent journal drafts.
- The Gantt chart preserves planned dates from the completion plan; it does not infer individual or actual completion intervals. The evidence cutoff is 20 September; the 22 September showcase remains planned.
- Rechecked ingestion target units against the completion plan: <100 KB, 100 KB–1 MB and >1 MB, rather than unspecified “100k/1M” units.
- The PDF build and visual review validate document presentation only. No application checks or benchmark rerun were performed.


## 12. Feature timeline and GitHub reconciliation — 20 September 2026

The user requested a more detailed Section 4.7 backed by original GitHub history. The application repository has its own complete, non-shallow history; the earlier report-workspace import limitation must not be applied to it.

- Retrieved PRs 261, 264, 265, 277, 278, 280, 281, 282, 285, 286, 287 and 288 with complete commit arrays. Merge SHAs match the local application history ending at `7789ed0` (13 September).
- Preserved selected metadata and commit records in `report/data/github-history.json`, the PR register in CSV, and 22 feature mappings in `report/data/delivery-timeline.json`. No credentials or private email fields were retained.
- Section 4.7 now spans four pages: foundations Gantt, product/hardening Gantt, plan-versus-delivery comparison, and primary/supporting contributions. All dates are converted to UTC+7.
- Commit points and their enclosing spans show recorded change dates, not continuous work; dotted lines show the gap to integration; filled diamonds show actual PR merges. Planned phase windows have a separate hatch/marker encoding.
- Contributions now reflect cross-support: An's early model discovery and provider routing; Chau's macOS setup/demo plan; Tien's removal of legacy memory/search and documentation updates. Supervisor repository activity is recorded separately from student work and meeting attendance.
- Provider/model PR 287 merged on 3 September, eight calendar days after the 26 August Phase 2 milestone. Its live thinking probe was committed on 26 August. The delay's cause is not established by these records.
- Skills PR 286 merged on 25 August, before the Phase 2 milestone; access PR 277 merged on 23 July. Per-agent knowledge topology still differs from the plan's many-to-many shared-space commitment.
- Source conflict: the Phase 3 graphic depicts a later endpoint than the plan's prose/table date of 9 September. The report explicitly uses the textual baseline and does not invent exact subtask due dates from the inconsistent image.
- Revised PDF: 17 main-body pages including figures/tables, 37 total physical pages. Six figures, six main-body tables and three appendix tables. Compile and visual checks completed; no application tests or benchmark rerun performed.


## 13. Expanded, consolidated draft — 20 September 2026

The user approved the existing content, requested deeper alignment with reviewed GitHub commits and a stronger executive summary, context/background and consolidated literature review. Page-limit optimisation is explicitly deferred for this working draft; the original final-submission constraint remains for a later editing pass.

- Rechecked remote `main`: still `7789ed0` (13 September), matching the local application. No newer upstream integration was discovered. `report/data/github-main-check.json` records this read-only check.
- Rewrote Section 1 around the application need, integration contribution, GitHub-backed delivery and bounded retrieval outcomes.
- Expanded Section 2 to three pages covering inherited platform context, requirement-derived scenarios, stakeholder needs, objectives, constraints and practical significance. Scenarios are labelled illustrative, not sponsor interviews.
- Consolidated Section 3 into five pages: retrieval/evidence use; permission and orchestration; platform comparison; interaction and skills; synthesis into DQ1–DQ5. Added only two targeted academic sources and upgraded RAGAs to its published EACL proceedings citation.
- Expanded Sections 4.4–4.6 using final code and PR evidence, including provider lifecycle, live probes, progressive skill loading, template validation, client handling, gateway/provisioning and default-agent setup.
- Added a Results accomplishment matrix linked to the design questions and qualitative analysis of access-aware delegation, provider compatibility and interactive correctness. Retrieval values are unchanged; PR test claims remain attributed development records.
- Durable reasoning and source map: `KB/literature-and-needs-synthesis.md`. Added source files: `report/sections/04-runtime.typ` and `05-accomplishments.typ`.
- Expanded draft: 25 main-body pages and 45 physical pages, with six figures and thirteen tables (ten main-body, three appendix). This is intentionally an expansion draft, not the page-budgeted submission version.
- Compiled and visually reviewed the expanded sections and bibliography. No application tests, deployment checks or benchmark reruns were performed.


## 14. Presentation-aligned narrative — 21 September 2026

The user confirmed `presentation-flow.md` as the flow used for the presentation, approved the mismatch review and requested the report revision. This establishes narrative context, not completion of the flow's prospective measurements.

- Reframed Sections 1–6 around administrator-configured, document-grounded assistants with caller-aware delegation. Providers, skills and setup remain substantive enabling contributions.
- Added enterprise adoption analysis using verified official Copilot Studio and Dify sources, separately from the framework comparison. Added a workflow claim-to-evidence matrix before the retrieval trials.
- Preserved all reported trial values and original success criteria; no script placeholders or proposed containment results became measured outcomes. Kept knowledge ownership distinct from authorised information transfer, and authored skill templates distinct from generated surfaces.
- Kept the implementation/trial cutoff at 20 September while dating the narrative/market review 21 September. Contribution records, scope deviations and provisional journals retain their evidence status.
- Compiled and reviewed `output/pdf/capstone-final-report-draft.pdf`: 27 main-body pages, 48 physical pages, six figures and fifteen tables. The expanded working-draft exception still applies; final page optimisation remains deferred. No application tests or benchmark rerun.
- Detailed decisions and source links: `KB/presentation-report-alignment.md`.

## 15. Report font — 21 September 2026

The user requested Times New Roman. Report body, headings, cover, running header and embedded journal text now use this family, with existing sizes, spacing and margins preserved. Local fonts are supplied through `--font-path report/.fonts`; see `report/README.md`. Existing SVG labels and standalone journal styles are unchanged. Recheck prose pagination after this typography change.

## 16. Layout refinement — 21 September 2026

The user approved black headings (including cover titles), 10 pt table text and captions, removal of manual within-chapter page breaks, and explicit paragraph spacing. Applied paragraph spacing is 6 pt; body font remains Times New Roman 11 pt with 0.58 em leading and unchanged margins. Chapter breaks, appendix organization and one-page-per-week journal breaks are retained. The compiled main body now spans 25 pages including visuals; the prose-only diagnostic preserving chapter breaks spans 17 pages. Rendered body, reference and appendix pages were reviewed for layout, caption placement and table wrapping. No application tests were needed.
