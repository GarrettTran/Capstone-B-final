#import "../style.typ": fig, tab
= Solution design

== Scope evolution and design priorities

The completion plan remains the baseline for comparing commitments with the current solution. @completion Scope evolved toward explicit agent-level knowledge ownership and tool-based delegation. @table-scope records the main changes without treating the presence of code as evidence of a particular delivery date. The team confirmed the responsibility areas and the rationale for the isolation, provider and skill changes; the source snapshot supplies implementation evidence. @implementation

#tab((1.2fr, 1.5fr, 1.5fr), ([Area], [Baseline or earlier approach], [Current design and consequence]), (
  [Knowledge access], [Shared knowledge spaces and document-tag-based separation were considered.], [Dedicated LightRAG container/workspace per agent. Authorised access to another agent's knowledge occurs through that agent.],
  [Orchestration], [Planner/worker handoff and broader coordination scope.], [Inner agents exposed as tools to an outer agent; access checks govern exposure and invocation.],
  [Retrieval pipeline], [Additional hybrid keyword/reranking work.], [Use of LightRAG retrieval modes; no reranker in the supplied trial configuration.],
  [Memory], [Broader layered memory ambitions.], [Scope reduced toward recent conversation and summaries; long-term user memory is outside the retained commitment.],
  [User interface], [Native Blazor-oriented interface direction.], [Separate conversational client, with AG-UI streaming and declarative UI integration.],
  [Configuration], [Provider and agent configuration as a platform requirement.], [Model discovery, thinking compatibility probes and administrator-defined skills extend the configuration workflow.],
), [Scope evolution from the planning baseline to the current design.]) <table-scope>

The completion plan already described per-agent isolation as implemented, then scheduled a further move to shared knowledge spaces. The current repository retains per-agent contexts; it does not establish delivery of that additional many-to-many topology. Thus the earlier isolation redesign and the later unfulfilled shared-space extension are separate scope events.

The isolation change makes the agent the unit of knowledge configuration and delegated access. This is easier to reason about than treating a document tag as the entire access boundary, but it creates operational responsibilities for container lifecycle, configuration and shared infrastructure. The tradeoff is therefore not isolation without cost: stronger separation in the application topology is accompanied by more resources to provision and monitor.

The original evaluation targets are retained for comparison rather than revised after observing the trials. They cover hit\@5 and human-rated quality, ingestion percentiles, time to first token, complete response latency, availability, recovery and cost. Section 5 reports which of these have corresponding measurements. A changed implementation scope does not silently redefine a target as achieved.

#pagebreak()
== System architecture

The architecture separates administration, conversational interaction, orchestration and knowledge services. Figure 1 presents these responsibilities and their principal relationships. The administrative interface configures providers, agents, access roles, tool bindings and skills. The user-facing client sends requests and receives streamed responses and interface events. The backend constructs the configured agent and mediates its access to model providers and tools.

#fig("assets/system-architecture.svg", [System overview derived from the inspected implementation. Dedicated LightRAG containers use agent-specific workspaces within shared PostgreSQL infrastructure.])

Application data and agent configuration are persisted separately from the runtime conversation flow. Knowledge requests pass through an agent-scoped gateway to the relevant LightRAG service. Dedicated containers do not imply physically independent database servers: the inspected configuration uses shared PostgreSQL storage with workspace scoping. This distinction is important when describing the security boundary and the operational consequences of the design.

The platform also integrates external tools, including MCP-connected capabilities. These are reusable building blocks; the team's contribution lies in configuring and connecting them to the agent runtime and administrative workflow. Framework capabilities are therefore distinguished from application-specific work such as determining which inner agents a user can invoke.

Failures can occur at several boundaries: the provider may reject a request, an inner agent may be unavailable, or a knowledge container may need to start before serving a query. The inspected implementation contains access checks, provider error handling and knowledge-service readiness logic. These mechanisms describe intended runtime behaviour. Their existence is not treated as proof of a recovery-time target or complete fault tolerance.

#pagebreak()
== Knowledge ownership and authorised delegation

Each knowledge-enabled agent receives a LightRAG service addressed through its agent identifier. The container manager derives a workspace identifier for the agent and configures PostgreSQL-backed storage. Document ingestion associates the uploaded original with the agent and document identifiers, then submits processing work to LightRAG and tracks its asynchronous progress. This allows upload acceptance to be distinguished from completed indexing.

Delegation preserves the same ownership model. An outer agent exposes only eligible, published inner agents for the current user. When the delegated tool is invoked, the access service is consulted again, and the child agent receives a knowledge plugin scoped to its own identifier. The inner agent queries that knowledge and returns its answer to the outer agent. Figure 2 illustrates the sequence. @implementation

#fig("assets/delegated-knowledge.svg", [Authorised delegation: the inner agent performs retrieval within its own knowledge context and returns an answer. The outer agent does not directly query the inner knowledge base.])

This design separates permission to invoke a specialist from direct access to the specialist's retrieval client. The access service considers publication state and the configured owner, administrator or role-based permissions. Checking access at tool construction limits exposed capabilities; checking again at invocation reduces dependence on an earlier decision remaining valid.

The remaining validation requirement is behavioural. A convincing access-control evaluation should exercise users with and without the required role, revoked access, unpublished inner agents and cross-agent document requests. It should also test whether returned content follows the intended information-sharing policy. An authorised inner-agent invocation is designed to return information; isolation is therefore a controlled delegation boundary, not a claim that information can never flow between agents.

Container separation and workspace scoping also depend on correct routing and credentials. The report does not claim independent physical tenancy, a penetration-test result or resistance to prompt injection. These are separate assurance questions requiring evidence beyond the inspected control paths.

#pagebreak()
#include "04-runtime.typ"

#pagebreak()
#include "04-delivery.typ"
