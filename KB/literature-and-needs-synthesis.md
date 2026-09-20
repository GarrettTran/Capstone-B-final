# Literature and application-needs synthesis

Updated 20 September 2026 for the expanded report draft. The user prioritised depth in Sections 1–3 and alignment with the reviewed commits; page optimisation is deferred for this working version.

## Project needs and provenance

- The repository is an existing NashTech C# agent application, extended by the capstone team. Baseline identity: `ntg-agent/README.md`; contribution boundaries: the twelve reviewed PRs in `report/data/github-history.json`.
- The completion plan pp. 4–6 describes the original ambitions and retained scope. Its later shared-space commitment is additional to the per-agent isolation it already described; these are separate scope events.
- The specialist-question, provider-administration and structured-task scenarios in Section 2 are illustrative workflows derived from requirements and implementation, not invented interviews or actual sponsor transactions.
- Stakeholder categories are analytical roles: end user, agent administrator, skill author/administrator and developer/maintainer. Expected value is not a measured productivity claim.
- Remote main was rechecked and still matches `7789ed0`; see `report/data/github-main-check.json`.

## Source-to-argument map

| Source | Use in synthesis | Limit |
| --- | --- | --- |
| [Lewis et al., RAG](https://arxiv.org/abs/2005.11401) | External retrieval as an explicit grounding stage | No transfer of paper metrics to NTG |
| [Liu et al., Lost in the Middle](https://aclanthology.org/2024.tacl-1.9/) | Context capacity does not by itself establish evidence use; evaluate placement and selection | Historical experimental result, not an observed GPT-5.1 failure |
| [Edge et al., GraphRAG](https://arxiv.org/abs/2404.16130) | Global/corpus-level questions differ from passage lookup | No blanket graph superiority |
| [Guo et al., LightRAG](https://arxiv.org/abs/2410.05779) | Graph/vector and dual-level retrieval motivate mode comparison | The team integrates the engine; it did not invent it |
| [Ferraiolo and Kuhn, RBAC](https://www.nist.gov/publications/role-based-access-controls) | Role-oriented permissions are distinct from retrieval relevance | Does not certify NTG access control |
| [Yao et al., ReAct](https://arxiv.org/abs/2210.03629) | Explicit actions obtain external information | Supports the invocation pattern, not a measured NTG orchestration ranking |
| [Dify](https://github.com/langgenius/dify), [Microsoft Agent Framework](https://learn.microsoft.com/en-us/agent-framework/overview/), [LangGraph](https://docs.langchain.com/oss/python/langgraph/overview) | Compare adoption unit, workflow emphasis, repository fit and remaining integration work | Different abstraction levels; official capabilities, not a scored competition |
| [AG-UI](https://docs.ag-ui.com/introduction), [A2UI](https://a2ui.org/), [MCP](https://modelcontextprotocol.io/docs/2026-07-28/learn/architecture) | Distinguish backend tools, client events and declarative presentation | Do not ascribe every upstream feature to the local implementation |
| [Agent Skills](https://agentskills.io/home) | Instructions/assets as reusable expertise | Local package format is intentionally constrained |
| [Es et al., RAGAs, EACL 2024](https://aclanthology.org/2024.eacl-demo.16/) | Separate retrieval relevance, faithfulness and generated-answer assessment | Not executed in NTG trials; bibliography upgraded to published proceedings |

Sources were rechecked through original papers, publisher records and official documentation on 20 September. Two targeted academic sources were added (long-context evidence use and RBAC), rather than increasing references indiscriminately.

## Consolidated design questions

- DQ1: appropriate document evidence → agent-scoped retrieval and document lifecycle → retrieval and human-answer checks.
- DQ2: authorised specialist reuse → filtered tools and invocation checks → direct/delegated permission cases.
- DQ3: usable heterogeneous model configuration → catalogues, explicit model choice and live probes → configuration/error-path checks separate from model quality.
- DQ4: reusable structured interaction → skills, templates and streamed events → import validation, input usability, state continuity and task correctness.
- DQ5: reproducibility and operational assessment → installer, provisioning and documentation → setup, recovery, absolute timing and cost evidence.

## Additional implementation inspected

Relative to `ntg-agent/`:

- `NTG.Agent.Orchestrator/Services/Skills/SkillPrompt.cs`: compact catalogue, on-demand loading and instruction to reload on a later turn.
- `NTG.Agent.Orchestrator/Services/Skills/SkillPackageImporter.cs`: archive entry/path/duplicate checks and surface validation.
- `NTG.Agent.Orchestrator/Services/Skills/SurfaceValidator.cs`: component references and seeded data bindings.
- `NTG.Agent.Orchestrator/Services/Agents/ThinkingSupportProbe.cs`: shared client builder, small request, 30-second timeout and structured failure.
- `NTG.Agent.Orchestrator/Services/Agents/DefaultAgentProviderSeeder.cs`: fills unconfigured default-agent provider from LightRAG settings; skips providers with existing keys.
- Skill test files use in-memory database configurations; presence of these tests is not a verified SQL Server integration result.

The expanded Results section maps delivered capabilities to DQ1–DQ5 before presenting the retrieval measurements. PR-reported checks are not added together or represented as independently reproduced test outcomes.
