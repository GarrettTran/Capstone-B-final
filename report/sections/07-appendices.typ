#import "../style.typ": tab
#heading(numbering: none)[Appendices]
#heading(level: 2, numbering: none)[Appendix A. Implementation evidence map]

Paths below are relative to #raw("ntg-agent/"). The abbreviation #raw("Orch/") denotes #raw("NTG.Agent.Orchestrator/"). They identify the basis for implementation claims, not proof of a passing runtime test or individual authorship. Team responsibility areas and resource support are user-confirmed statements recorded in the report workspace's #raw("process.md"). GitHub commit attribution and PR integration dates are now recorded in Appendix D; exact task-start dates, effort and deployment acceptance are not inferred from that history.

#tab((1fr, 2.4fr), ([Claim or workflow], [Source location]), (
  [Access decisions], [#raw("Orch/Services/Agents/AgentAccessService.cs")],
  [Agent construction and tool exposure], [#raw("Orch/Services/Agents/AgentFactory.cs")],
  [Authorised child invocation and scoped retrieval], [#raw("Orch/Plugins/AgentToolPlugin.cs")],
  [Knowledge routing and readiness], [#raw("NTG.Agent.LightRag/LightRagClientFactory.cs")],
  [Container and workspace configuration], [#raw("NTG.Agent.LightRag/LightRagContainerManager.cs")],
  [Document ingestion], [#raw("NTG.Agent.LightRag/LightRagKnowledge.cs")],
  [Thinking compatibility probe], [#raw("Orch/Services/Agents/ThinkingSupportProbe.cs")],
  [Provider model discovery], [#raw("Orch/Services/Agents/ProviderModelService.cs"); #raw("Orch/Controllers/ProviderProbeController.cs")],
  [Interactive interface and skills], [#raw("docs/A2UI-and-AG-UI.md"); #raw("Orch/Services/Skills/") (SkillPrompt, SkillPackageImporter, SurfaceValidator)],
  [Telemetry and health configuration], [#raw("NTG.Agent.ServiceDefaults/Extensions.cs"); #raw("docs/monitoring-setup.md")],
  [Local setup and CI configuration], [#raw("install-local.sh"); #raw("Orch/Services/Agents/DefaultAgentProviderSeeder.cs"); #raw(".github/workflows/ntg-agent-ci.yml")],
), [Source map for the implementation discussion.])

Documentation is used to explain intended workflows; selected code paths substantiate their implementation. The report preparation did not execute the application, run access-control tests, validate a deployed service or reproduce the benchmark. The report's compilation checks concern document integrity and do not change these implementation-evidence limits.

#pagebreak()
#heading(level: 2, numbering: none)[Appendix B. Retrieval data and reproducibility]

The figure data are transcribed into #raw("report/data/retrieval-summary.json"). The accompanying generation script recreates the plots without estimating values from unlabelled bars. @table-aggregates retains the aggregate values used in the discussion. Mode order is naive, local, global and hybrid throughout.

#tab((0.9fr, 0.7fr, 1.1fr, 1.2fr, 1.25fr), ([Trial], [Queries], [Hit\@1], [Hit\@5], [Median latency ratios]), (
  [Validation (cold)], [6], [0.833 for all], [1.000 for all], [1.0 / 3.7 / 3.5 / 4.0],
  [Pilot (cold)], [12], [0.583 / 0.500 / 0.500 / 0.500], [0.917 for all], [1.0 / 3.4 / 3.3 / 3.9],
  [Rerun (warm LLM cache)], [Same 12], [0.583 / 0.500 / 0.500 / 0.500], [0.917 for all], [1.0 / 1.3 / 1.3 / 1.8],
), [Transcribed aggregate retrieval results. Each latency row is normalised to its own naive baseline. Source: retrieval trials, pp. 2–7.]) <table-aggregates>

The raw call logs, health samples, relevance labels, checksums and benchmark harness referenced by the supplied summary are not included in the current evidence package. Their absence prevents independent recomputation of the aggregates and attribution of latency changes to particular stages. The supplied PDF also uses both document and chunk terminology for hits. A reproducible extension should define the scored unit, preserve retrieved identifiers and ranks, and identify the answer-bearing evidence for each question.

The rerun reuses the pilot questions and should not be counted as twelve new questions. No uncertainty interval or statistical significance claim is added because the summary is not sufficient to establish the sampling design. The withdrawn non-human answer scores are not used as evidence of correctness. A future human assessment should retain its rubric, judge instructions and per-answer decisions.

#heading(level: 2, numbering: none)[Appendix C. Report production and final review]

The report is authored in Typst. Architecture, delegation, schedule and retrieval figures are generated as vector graphics with Matplotlib from the source map, planned dates and transcribed trial values. The Gantt figures distinguish planned phases, recorded feature-change dates and PR integration dates. Figure-generation guidance was informed by the Scientific Agent Skills library. @scientificskills This tooling acknowledgement concerns report preparation, not a dependency of NTG-agent-vnext.

The source package includes independently editable weekly journal files. Proposed dates, attendance variations and actions must be confirmed before those drafts can serve as final meeting records. Other final-review items are exact submission metadata, the actual completion status at the final milestone, any further contribution or deployment evidence, and any additional evaluation artefacts supplied after the 20 September snapshot.

#pagebreak()
#heading(level: 2, numbering: none)[Appendix D. GitHub history and timeline method]

#import "github-register.typ": pr-rows
The register below identifies the twelve PRs inspected on 20 September 2026. Dates use UTC+7 and the format month–day within 2026. Each PR number links to the original record. Merge SHAs match the local application's integration history. @githubhistory

#tab((0.6fr, 1.2fr, 0.7fr, 0.7fr, 0.85fr), ([PR], [Author], [Opened], [Merged], [Merge SHA]), pr-rows, [GitHub PR register for the feature timeline and contribution analysis.]) <table-pr-register>

The source data are preserved in #raw("report/data/github-history.json"), with a compact #raw("github-pr-register.csv") alongside them. The feature mapping in #raw("delivery-timeline.json") identifies the selected commit SHAs for each of F01–F22. The generator retains commit-author dates as recorded and separately stores committer timestamps, because rebasing and cherry-picking can change the latter. The ranges describe the selected evidence, not the duration of all work on a feature.

PR commit lists can include inherited changes. For example, the role-access and installer branches contain earlier LightRAG work. The mapping selects changes relevant to each row rather than assigning every ancestor to the later feature. Multiple rows can share a PR integration date; their ranges must not be added together as person-days. Likewise, the duplicated macOS/demo-plan changes in PR 285 are not interpreted as two independent deliverables.

The local application's reviewed head is #raw("7789ed0"), dated 13 September. PR bodies are useful decision records but may become stale: PR 287's description retains catalogue-based thinking gating, whereas its 26 August commit #raw("7af467b") removes that catalogue and adds the live probe. The final code and specific commit take precedence for that implementation claim.

The completion plan's Phase 3 graphic and explicit textual milestone disagree. The Gantt uses the prose/table interval of 17 August–9 September and flags the conflict in Section 4.7. Task names and planned assignees are taken from the plan, but precise subtask dates are not fabricated from the inconsistent graphic. Benchmark execution dates, deployment acceptance and work without a GitHub record remain separate evidence requirements.
