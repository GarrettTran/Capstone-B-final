# Presentation and report alignment review

Reviewed: 21 September 2026.

## Provenance and scope

The user confirmed that `presentation-flow.md` was the flow used for the team's presentation and requested comparison with the report and proposed revisions. This confirms its narrative relevance, not that every scripted measurement, screenshot or checklist action was completed. The file still contains `N / 27`, `X s`, prospective measurement instructions and unchecked tasks.

This review compares that file with the current `report/sections/` sources, `Requirements/AssessmentDetails.md`, `Requirements/rubric.md`, and existing evidence reviews. It does not independently re-audit application code, verify current vendor offerings, inspect the final presentation video, or reproduce measurements. Proposed editorial changes below are interpretations, not newly confirmed project facts. The initial comparison did not change report sources; the subsequent approved revision is recorded below.

## Central finding

The presentation centres on administrator-configured enterprise assistants, agent-scoped knowledge and permissions enforced during delegation. The report frames a broader integration project covering retrieval, delegation, model administration, interactive skills and reproducibility. These are compatible scopes, but the report could explain their shared user purpose more clearly. Its quantitative evidence primarily evaluates retrieval, not the access-control claim foregrounded by the presentation.

Recommended thesis:

> NTG-agent-vnext extends an existing .NET platform to support administrator-configured, document-grounded assistants with agent-scoped knowledge and caller-aware specialist delegation. Configurable model providers and reusable interactive skills support these workflows. The implementation and integration history substantiate the engineering contribution, while the supplied retrieval trials provide preliminary coverage and latency evidence; end-to-end permission enforcement and answer quality require further evaluation.

## Mismatch register

| Topic | Presentation | Current report | Proposed treatment |
| --- | --- | --- | --- |
| Central argument | Slides 1, 4, 10 and 16 foreground configurable assistants and permission boundaries. | Background and executive summary distribute emphasis across five objectives. | Use the permission-aware document workflow as the narrative spine; explain providers, UI and setup as enabling capabilities. Retain their technical contributions and design questions. |
| User need | Slides 3–4 assert company interviews, sponsor requirements and governance as the reason pilots fail. | Background explicitly labels scenarios requirement-derived and illustrative. | Add a concrete user journey, but retain its illustrative status. Do not import interview claims or a categorical prohibition on external processing without attributable records. |
| Market research | Slide 6 compares managed products and self-hosted deployment. | Literature compares Dify, Microsoft Agent Framework and LangGraph, acknowledging their different layers. | Add a concise product/adoption comparison before the framework comparison. Use consistent dimensions: hosting responsibility, knowledge/access configuration, extensibility, external model processing and operational effort. Verify primary sources before drafting vendor-specific entries; do not copy the flow's binary claims. |
| Research rationale | Slide 7 says shared document pools leak and assistants decline rather than guess. | Literature discusses topology alternatives and evaluation limits. | Present shared-storage access filtering and per-agent contexts as alternatives with tradeoffs. Treat refusal as behaviour to assess, not a guaranteed property or proof of isolation. |
| Isolation and delegation | Slides 10/16 and Q&A say documents cannot be reached across assistants, including if the application layer is wrong. | Design distinguishes dedicated containers, shared PostgreSQL workspace scoping and authorised information return. | Keep the report's narrower claim. Distinguish knowledge ownership, caller authorisation, and authorised answer transfer. Inner-agent exclusion from direct chat is not a complete document authorisation policy. |
| Empirical results | Section 2 and Slide 13 prescribe 27 policy questions, 24 probes, restricted-document attempts and prefetch timing, but contain placeholders. | Results use six-query validation, twelve-query pilot and a repeated twelve-query warm run from the supplied retrieval PDF. | Keep these as distinct evidence sets. Do not treat the presentation script as a completed experiment. Only add its results when actual outputs and conditions are supplied. Hit@5 = 0.917 is not 91.7% answer correctness. |
| Interactive UI | Slide 11 and demo Step 5 say nobody wrote the screen. | Runtime describes both generated catalogue surfaces and pre-authored skill templates populated at runtime. | Retain both paths and add a before/after explanation: no bespoke frontend component is required for each supported task variation, but templates and the component catalogue are authored. Confirm which path the recorded demo used before describing that screen. |
| Memory | Contribution list credits long-term memory; Slide 15 calls for finishing it. | Scope and delivery sections document removal of the legacy memory/search stack and reduced retained scope. | Distinguish historical work from final retained functionality. Treat reintroducing long-term memory as a possible future scope decision, not automatically unfinished committed work. |
| Contributions | Slide 14 groups the work into four member/capability boxes. | Delivery section records primary work, cross-support and integration dates. | Use the four capabilities as a concise opening overview, then preserve the detailed attribution. Per-agent knowledge work includes PR 265 as well as VM/gateway PR 282. Do not infer exclusive ownership from slide boxes. |
| Operational claims | Slides/Q&A invoke 607 tests, deployed operation and cost tracking as support for quality and scalability. | Report distinguishes implementation, author-reported checks and measured outcomes. | Preserve this distinction. Test definitions do not establish passing tests or scalability; usage tracking does not establish monetary cost when pricing is missing. A demonstration establishes the observed session, not production readiness. |
| Future work | Slide 15 prioritises faithfulness, persistent delegation records and memory. | Results/reflection prioritise evidence preservation, human assessment, permissions and operational targets. | Prioritise evaluation of the central access/delegation claim alongside answer quality, then observability and operational validation. Treat new memory work separately from closing existing evidence gaps. |

## Proposed edits by report section

1. **Executive summary — `report/sections/01-executive.typ`:** lead with the administrator/user problem and permission-aware workflow. Condense the dense list of merge dates into a contribution overview, leaving full chronology in delivery. Retain the bounded retrieval finding and unresolved evaluation status. Rewrite this section last.
2. **Background — `report/sections/02-background.typ`:** develop the existing specialist scenario into a short sequence: configure documents and access; user selects a published assistant; assistant answers locally or delegates; runtime checks caller permission; user receives an answer or supported interface. State the intended value without claiming measured productivity or documented interviews.
3. **Literature — `report/sections/03-literature.typ`:** distinguish enterprise adoption alternatives from implementation frameworks. Connect the resulting criteria to the existing five design questions rather than replacing them with unsupported claims of uniqueness.
4. **Design — `report/sections/04-design.typ` and `04-runtime.typ`:** connect the overview to the same user journey. Explain deployment/data-processing boundaries and the distinction between agent ownership and authorised delegation. Add the generated-versus-templated UI contrast. Keep scope evolution and the original success criteria visible.
5. **Delivery — `report/sections/04-delivery.typ`:** introduce four headline contribution areas, followed by the existing primary/supporting attribution and schedule comparison. Providers and setup remain substantive supporting work.
6. **Results — `report/sections/05-accomplishments.typ` and `05-results.typ`:** add a compact claim-to-evidence matrix covering configuration, retrieval, permission-aware delegation and interactive workflows. Explicitly separate implementation evidence, recorded demonstration evidence if supplied, quantitative trials and unverified acceptance criteria. Keep the existing retrieval analysis and original targets; do not substitute a staged demo for them.
7. **Reflection — `report/sections/06-reflection.typ`:** connect the current lessons to the central narrative: delegation requires authorisation and observability; reusable UI requires interaction validation; evaluation should accompany implementation. Retain only source-backed incidents and user-confirmed experience.

The prescribed assessment structure remains unchanged. Solution Design and Results retain analytical depth in line with their 40% and 30% rubric weights. The presentation's timing and demonstration emphasis are not report allocation requirements.

## Evidence needed for stronger alignment

- Final deck/video or actual run records to establish which planned presentation elements were shown and measured.
- Per-question answers and scoring for the 27-question scenario, if completed; keep its corpus separate from the retrieval PDF's development corpus.
- For permission probes: caller identity/role, target agent and document, expected allowed/denied outcome, direct or delegated route, observed output, configuration and revision. A foreign-document question is not automatically an unauthorised request when delegation is permitted.
- Timing traces and controlled settings for any prefetch claim. Comparing an original query with a reformulated follow-up changes more than cache-hit status and does not isolate prefetch benefit.
- Confirmation of the UI tool/template used in the presented trip-planning flow.
- Attributable sponsor material for any prohibition on external document processing. Hosting storage locally does not itself prevent document text from being sent to configured inference or embedding services.

Until these are available, retain the existing report's measured results and evidence boundaries while improving its narrative emphasis.

## Approved revision implemented — 21 September 2026

The user approved the proposed direction and requested report edits. Updated Sections 1–6, the cover revision metadata and bibliography. The prescribed section structure and original success criteria remain intact.

- Background now follows a requirement-derived helpdesk journey; no interviews or sponsor statements were inferred.
- Literature now separates enterprise adoption from implementation foundations. Added a compact comparison of Copilot Studio, self-hosted Dify and extension of NTG Agent. Product-fit judgments are labelled analytical interpretations.
- Verified primary sources on 21 September: [Copilot Studio overview](https://learn.microsoft.com/en-us/microsoft-copilot-studio/fundamentals-what-is-copilot-studio), [knowledge-source authentication](https://learn.microsoft.com/en-us/microsoft-copilot-studio/knowledge-copilot-studio), and [Dify's official repository](https://github.com/langgenius/dify). Sources support graphical authoring, supported authenticated knowledge access, and self-hosted workflows/model/RAG capabilities respectively. The report does not claim that Dify lacks all governance, or that all managed-service documents must be copied into a vendor-owned index.
- Design distinguishes knowledge ownership, invocation permission and authorised answer transfer. Storage control is separated from external model processing; the supplied trial configuration and `ntg-agent/NTG.Agent.AppHost/Program.cs` establish the Azure OpenAI generation/embedding configuration. No air-gap capability or provider data-retention promise was added.
- Runtime explains authored templates versus generated surfaces and what frontend work is actually reused.
- Delivery introduces four headline contribution areas while preserving detailed cross-support and dates.
- Results adds a workflow claim-to-evidence matrix. Presentation scenarios remain candidate acceptance tasks, not execution records. No new accuracy, containment, latency, cost, test-pass or deployment result was introduced.
- Reflection links future permission checks, answer assessment and observability to the central workflow. Reintroducing long-term memory remains a separate scope decision.
- Executive summary was rewritten after the body changes, with the pilot hit@5 of 0.917 and the same empirical limits.

Validation: Typst compilation succeeded without warnings. The revised PDF has 27 main-body pages and 48 total pages, six figures and fifteen tables. Rendered review covered the front matter, revised body, diagrams, tables, references and appendices; the timeline's initial one-line spill page was removed. Text/source checks confirmed unchanged trial values, resolved citations and cross-references, and clean source diffs. The expanded-draft page-limit deferral remains in effect. No application tests or benchmark reruns were performed.
