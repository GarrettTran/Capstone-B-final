#import "../style.typ": fig, tab
== Delivery schedule and team responsibilities

=== Reconstructing the feature timeline

The delivery timeline is reconstructed from twelve GitHub pull requests (PRs), their commit lists and the corresponding integration commits in the local repository. The records cover all four student contributors and selected industrial-supervisor maintenance. The feature mapping identifies twenty-two workstreams rather than treating each large PR as a single feature. Dates are converted to Vietnam time (UTC+7). @githubhistory

@fig-foundations shows the foundations of the final solution. A coloured span connects the first and last selected commit-author dates for a feature; points identify the recorded change dates. The dotted segment leads to the PR's merge into main. These intervals describe the available development record, not continuous labour, exact task start dates or deployment acceptance. Shared commits inherited by stacked PRs are excluded from unrelated feature rows.

#fig("assets/delivery-gantt-foundations.svg", [Feature-level Gantt: retrieval, orchestration and interface foundations. Each row identifies contributors, its parent PR and the integration date. Source: GitHub commit and PR records; the selected SHA mapping is retained with the report.]) <fig-foundations>

The sequence clarifies how the architecture emerged. Chau's LightRAG and PostgreSQL changes preceded per-agent containers and document-status handling; An added idle-container shutdown. Khang's agents-as-tools work reached main on 19 June, followed by Tien's AG-UI and generative-interface integration on 7 July. The combined knowledge branch merged on 17 July after additional cleanup, including the removal of the legacy memory and search services. Role-based access and an initial model-discovery implementation followed on 23 July. These are integration milestones, not claims that every associated requirement was fully evaluated.

#pagebreak()
=== Product completion and integration

@fig-delivery places subsequent work against the completion plan's phase windows. It separates provisioning, VM migration and gateway routing, and distinguishes provider catalogue management from the later live thinking probe. This exposes dependencies and supporting work that a phase-only chart would conceal. @completion @githubhistory

#fig("assets/delivery-gantt.svg", [Feature-level Gantt: product completion and hardening. Hatched rows show planned phases; coloured rows show selected change-date spans; filled diamonds mark merges into main. Planned dates use the completion plan's prose and milestone table.]) <fig-delivery>

The live probe was introduced in commit #link("https://github.com/nashtech-garage/ntg-agent/commit/7af467b82ee264c167dd7b5fff1dd88ff1460d8f")[7af467b] on 26 August and integrated with PR 287 on 3 September. The commit replaced a curated thinking-capability list with a test request. This is a meaningful refinement beyond the PR's earlier summary, which still describes catalogue-based gating. The final implementation and commit record therefore provide the more precise account of this feature.

#pagebreak()
=== Delivery against the completion plan

@table-delivery compares planned commitments with observed integration. Phase 2's explicit milestone is 26 August, Phase 3's is 9 September, and Phase 4's is 22 September. The completion plan's embedded Phase 3 Gantt depicts a later endpoint than its prose and milestone table. This report uses the explicit textual dates as its comparison baseline and preserves that discrepancy; it does not infer exact task-level due dates from the conflicting diagram. @completion

#tab((1.05fr, 1.3fr, 1.85fr), ([Commitment / planned owner], [Baseline], [Observed record and interpretation]), (
  [Agent access control / team], [Finalise and merge in Phase 2, ending 26 Aug.], [PR 277 merged 23 Jul. An's role and delegated-access changes were integrated before the phase milestone.],
  [Skills / team], [Finalise and merge in Phase 2.], [PR 286 merged 25 Aug. Tien's skill import, binding, runtime and surface validation reached main one day before the milestone.],
  [Provider model fetch / Khang], [Phase 2, ending 26 Aug.], [PR 287 merged 3 Sep: eight calendar days after the phase milestone. Earlier model discovery was present in An's PR 277; global model management and live probing were later additions.],
  [Knowledge spaces / Chau], [Many-to-many shared knowledge spaces in Phase 2.], [PRs 265 and 282 establish per-agent knowledge services, followed by VM/gateway work merged 20 Aug. This differs from the planned shared-space topology.],
  [AG-UI parity / Tien; knowledge admin UX / Tien], [Further interface work in Phase 2.], [PR 264 merged 7 Jul; PR 286 added skills and client-specific rendering on 25 Aug. These records do not establish complete Blazor parity or every planned knowledge-admin improvement.],
  [TTFT / An; performance / Khang; benchmark / Tien], [Instrumentation in Phase 2; evaluation in Phase 3.], [Retrieval summaries are available with a 14 Sep corpus freeze. No dated run log or equivalent TTFT, cost and human-scoring results establishes full Phase 3 attainment.],
  [VM/runbook / Chau; monitoring/restore / An], [Operational hardening in Phase 3.], [VM and gateway changes merged 20 Aug; documentation updates are present. No recovery or backup-restore exercise was verified.],
  [Polish, documentation and showcase / team], [Phase 4, ending 22 Sep.], [Installer and macOS/demo-plan work merged 13 Sep. The 20 Sep report snapshot precedes final showcase acceptance.],
), [Planned responsibilities and milestones compared with GitHub integration evidence. A merge verifies integration, not every acceptance criterion.]) <table-delivery>

The record supports a mixed delivery assessment. Access control and skills were integrated before the Phase 2 milestone, while the expanded provider workflow entered main afterwards. The history records continued endpoint, model-selection and thinking-path changes through 26 August, but does not establish why integration occurred on 3 September. A delivery delay can therefore be reported without inventing its cause. Similarly, the 14 September corpus freeze dates an evaluation condition; it is not a benchmark execution date.

#pagebreak()
=== Individual contributions and cross-support

Commit-level attribution adds detail to the responsibility areas confirmed by the team. PR authorship alone would understate shared work: PR 265 was opened by An but contains substantial LightRAG work by Chau, while PR 285 includes Chau's macOS and demonstration-plan changes alongside An's installer. @table-contributions separates primary responsibility from evidenced support. It does not use commit totals as a proxy for effort. @githubhistory

#tab((0.85fr, 1.15fr, 1.65fr, 1.65fr), ([Member], [Recorded identity], [Primary work and integration], [Evidenced supporting work]), (
  [Vu Gia An], [AnVuGia; PepeDaFrog; commit name An Vu.], [Role/delegated access, 23 Jul (277); gateway routing within 282, 20 Aug; installer within 285, 13 Sep.], [Idle shutdown in 265; early model discovery in 277; provider routing in 281; secret scanning and scanner repair in 278/280.],
  [Nguyen Dinh Minh Chau], [Annie-Chau], [LightRAG, per-agent containers and document lifecycle in 265, 17 Jul; provisioning and VM migration in 282, 20 Aug.], [Legacy-stack cleanup with Tien; macOS installer and showcase demo plan in 285, 13 Sep.],
  [Nguyen Tien], [TienNgen], [AG-UI, conversational client and generative surfaces in 264, 7 Jul; skills and surface validation in 286, 25 Aug.], [Legacy memory/search removal in 265; client capability and access-denial handling; monitoring and architecture documentation in 286.],
  [Tran Nguyen Quy Khang], [GarrettTran], [Agents-as-tools and inner-agent bindings in 261, 19 Jun; global provider/model management and thinking probes in 287, 3 Sep.], [Provider endpoint corrections, model-selection integration and provider discovery error reporting within 287.],
), [Primary contribution areas and supporting changes corroborated by selected GitHub commits. Dates identify parent-PR integration into main.]) <table-contributions>

The industrial supervisors also contributed to integration. Nguyen Le Quynh Thien (#raw("thiennn")) is recorded as the merger of all twelve reviewed PRs. Nguyen Sieu Anh (#raw("sieunhantanbao")) contributed LightRAG restructuring within PR 282 and package/integration maintenance in PR 288. These are repository activities; they do not establish meeting attendance or sponsor acceptance of the complete project.

The installer work illustrates collaboration across feature boundaries. PR 285 explicitly depended on the VM branch, and a 7 September integration change adapted default-agent setup to the new provider entity. This links infrastructure, provider configuration and developer onboarding rather than treating installation as an isolated final task. The PR also reports setup checks, but those author-reported checks are not represented here as independently reproduced test results.

NashTech supported LightRAG hosting and access to deployed models. The university provided a US\$300 Claude API allocation for development and testing. These remain team-confirmed resource statements, not expenditure or service-level measurements. Together with the GitHub record, they explain how work was divided and integrated while leaving operational acceptance and remaining evaluation targets explicit.
