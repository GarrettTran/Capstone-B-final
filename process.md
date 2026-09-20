# NTG-agent-vnext: Report Writing Process

Updated: 20 September 2026. This document records the writing workflow, user-confirmed context, and remaining validation work. It is not the final report.

## 1. Submission and writing constraints

- Course: **OENG1185 - Capstone Project B**.
- Project: **NTG-agent-vnext**; team: **QUOTA**; industry partner: **NashTech**.
- Repository: https://github.com/nashtech-garage/ntg-agent.
- Write in academic English, using Typst and IEEE references. Retain the required template structure while improving readability and consistency.
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

Use the completion plan as the planned baseline, not as proof of delivery. Review original GitHub PRs/commits before making detailed contribution or date claims. Do not equate commit counts with individual effort. No GitHub verification has been completed as part of this update.

## 3. Member responsibilities

The user confirmed the following primary areas. Supporting roles, exact dates, and PR-level attribution remain to be validated.

| Member | GitHub identity supplied | Primary contribution area |
| --- | --- | --- |
| Vu Gia An | `PepeDaFrog`; `An Vu Gia` | LightRAG, document isolation, and access control, jointly with Chau |
| Tran Nguyen Quy Khang | `GarrettTran` | Agents-as-tools architecture, multiple-provider integration, and available-model discovery |
| Nguyen Dinh Minh Chau | `Annie-Chau` | LightRAG, document isolation, and access control, jointly with An |
| Nguyen Tien | `TienNgen` | AG-UI and agent skills defined through `SKILL.md` |

Treat `An Vu Gia` as a supplied identity/display-name alias until its relationship to GitHub commits is confirmed. Do not invent a split between An and Chau or assign historical supporting work solely from these broad roles. Use `Requirements/info.md` for student IDs and supervisor names.

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

The user confirms that formal benchmarking and AI-output evaluation remain incomplete because the team lacked time to research and establish the evaluation properly. **Defer benchmark execution and detailed experiment planning for the current writing pass.** Do not block design/documentation work on it and do not claim that the planned evaluation has been completed.

Retain the completion plan's six metric groups as original commitments: retrieval quality, ingestion latency, TTFT/full-response latency, availability, conversation cost, and quality gates. Their targets remain targets. This update supplies no measured results; CI evidence may be checked separately, but do not infer it from the presence of workflow files.

Write Results around verified deliverables, documented functional examples, deviations from the plan, and limitations of the available evidence. Include a clear statement that formal answer-quality comparison has not been completed. Discuss resulting uncertainty and future evaluation without fabricating scores, latency percentiles, uptime, cost savings, or pass/fail outcomes. Do not call the product production-ready merely because that milestone date has passed.

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

## 9. Review checklist and open items

- Confirm the twelve-week calendar and each meeting's actual existence, attendance, timing, and action outcomes.
- Verify the confirmed outer-to-inner delegation flow and client permission enforcement in code. Separately check the planned many-to-many storage mapping; do not equate it with agents-as-tools delegation.
- Verify broad contribution areas against original GitHub history; clarify individual versus shared responsibility and local setup ownership.
- Confirm remaining feature/deployment status, actual sponsor comments, and any additional reflection episodes.
- Verify provider deployment names and resource support wording; confirm exact submission time and programme metadata.
- Treat formal evaluation as incomplete unless new measured evidence is supplied.
- Compile a week with `typst compile report/meeting-minutes/week-01.typ output/pdf/meeting-minutes/week-01.pdf` (substitute 01-12). For the optional combined PDF, use `typst compile report/meeting-minutes.typ output/pdf/meeting-minutes.pdf`. Render and check clipping, row wrapping, footer placement, numbering, and provisional labels.
- Final report acceptance requires the fewer-than-20-page rule, traceable factual claims, consistent results across sections, and reviewed meeting records. Working drafts may contain clearly labelled unresolved items.
