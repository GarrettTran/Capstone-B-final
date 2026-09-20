# First report draft: evidence map

Snapshot: 20 September 2026. Deliverable: `report/main.typ`; compiled artifact: `output/pdf/capstone-final-report-draft.pdf`.

## Evidence categories

- **Implementation:** selected paths in the supplied local `ntg-agent/` snapshot; no application run or test result inferred.
- **Measured summaries:** `Requirements/NTG-Agent-Retrieval-Trials.pdf`, transcribed rather than independently recomputed. See `KB/retrieval-trials-review.md` and `report/data/retrieval-summary.json`.
- **Plan:** `Requirements/Capstone-Project-Completion-Plan-Report-TeamQuota.pdf`; intended dates and targets, not final delivery proof.
- **User confirmation:** responsibility areas, delegated KB flow, setup-friction episode and resource support recorded in `process.md`; cross-checked with original GitHub records as described below.
- **GitHub history:** twelve PRs and their full commit lists retrieved on 20 September; merge SHAs match local application history. See `KB/github-delivery-history.md` for feature mappings and attribution limits.
- **Research:** original papers and official documentation in `report/references.bib`; do not transfer published performance to NTG Agent.

## Implementation paths

All paths below are relative to `ntg-agent/`.

| Report claim | Source | Evidentiary limit |
| --- | --- | --- |
| Published-agent and role/owner/admin access decisions | `NTG.Agent.Orchestrator/Services/Agents/AgentAccessService.cs` | Code-path evidence; no permission test run |
| Filter enabled inner agents before tool exposure | `NTG.Agent.Orchestrator/Services/Agents/AgentFactory.cs` | Does not prove every route is covered |
| Recheck permission and attach child's scoped knowledge plugin before returning child's answer | `NTG.Agent.Orchestrator/Plugins/AgentToolPlugin.cs` | Matches user-confirmed inner-agent retrieval contract |
| Agent-ID gateway routing and knowledge readiness | `NTG.Agent.LightRag/LightRagClientFactory.cs` | No uptime/recovery measurement |
| Per-agent container, workspace ID, shared PostgreSQL storage | `NTG.Agent.LightRag/LightRagContainerManager.cs` | Not physically independent databases or security certification |
| Agent/document upload storage and asynchronous indexing tracking | `NTG.Agent.LightRag/LightRagKnowledge.cs` | Upload acceptance differs from indexing completion |
| Thinking probe through runtime client-construction path | `NTG.Agent.Orchestrator/Services/Agents/ThinkingSupportProbe.cs` | Request acceptance, not reasoning quality; failure can reflect timeout/configuration |
| Provider model catalogue/deployment discovery | `NTG.Agent.Orchestrator/Services/Agents/ProviderModelService.cs`; `NTG.Agent.Orchestrator/Controllers/ProviderProbeController.cs` | External endpoint availability can vary |
| AG-UI transport, A2UI rendering and skill surfaces | `docs/A2UI-and-AG-UI.md`; `docs/skill-import-security.md` | Documentation explains intended workflows, not universal rendering reliability |
| Telemetry and development health endpoints | `NTG.Agent.ServiceDefaults/Extensions.cs`; `docs/monitoring-setup.md` | Development-only endpoint mapping does not establish production monitoring |
| Setup automation | `install-local.sh` | User-reported friction; no timed onboarding comparison |
| Build/test/coverage/analysis workflow | `.github/workflows/ntg-agent-ci.yml` | Workflow presence is not a passing run or every-merge compliance |

## Schedule and targets

Completion plan pp. 8–10: Phase 2, 20 July–26 August; Phase 3, 17 August–9 September; Phase 4, 7–22 September 2026. The chart preserves these overlaps and distinguishes milestones from the September 14 corpus freeze and September 20 drafting cutoff.

Completion plan pp. 11–13: retain the original targets. Ingestion bands are **<100 KB**, **100 KB–1 MB**, **>1 MB**, with P95 targets 20 s, 90 s and 5 min. Human answer correctness calls for two independent blind raters and a mean >=4/5. Relative retrieval latency does not establish TTFT or full-response percentiles.

## Draft interpretation

Lead with implementation accomplishments and observed retrieval coverage, then explain their scope. Reported pilot hit@5 is 0.917 for all four modes; same-query warm rerun is consistency evidence, not independent sample expansion. Neither hybrid superiority nor human correctness is established. The missing p04 case is a diagnostic follow-up, with no invented cause.

The expanded main body has 25 pages including six figures and ten main-body tables. Three further tables appear in the appendices. Full expanded PDF: 45 pages. The user deferred page optimisation for this working draft. Meeting drafts remain excluded from factual delivery evidence until confirmed.

The Phase 3 schedule graphic conflicts with the completion plan prose and milestone table. The revised timeline uses the explicit 9 September textual milestone and records the discrepancy in Section 4.7 and Appendix D.

The strengthened needs and literature argument, DQ1–DQ5 mapping and additional skill/provider/setup evidence are recorded in `KB/literature-and-needs-synthesis.md`. Remote main was rechecked at the same `7789ed0` head; benchmark results are unchanged.
