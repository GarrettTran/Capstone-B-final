#import "../style.typ": tab
= Literature review and market research

== Review scope and analytical approach

The review examines how existing methods and platforms address five concerns arising from the project: access to external knowledge, specialist orchestration, permission boundaries, configurable interaction, and evaluation. Research papers establish the methodological basis, while official framework and protocol documentation establishes the capabilities of reusable components. The comparison focuses on fit with the project's requirements; it is not an exhaustive survey or a measured ranking of products.

The distinction between these sources matters. A research result obtained on a published task set does not establish the performance of the team's corpus or configuration. Similarly, documentation of a supported capability does not prove that the NTG integration exercises it correctly. The review therefore moves from prior work to a design implication and then to an evaluation question that the project can address.

== Grounding answers in external knowledge

Lewis et al. combine a parametric generator with retrieval from a non-parametric knowledge source. Their work establishes a basis for generating answers using evidence obtained at inference time. @rag For NTG-agent-vnext, the implication is to represent retrieval as an explicit service boundary. Documents can then be managed independently of model training, and the evaluation can inspect both the retrieved material and the answer that uses it.

A straightforward alternative is to place a larger amount of source material directly into the model's context. This can simplify small demonstrations, but context capacity alone is not evidence of effective evidence use. Liu et al. found that performance on their long-context tasks varied with the position of relevant information, with weaker use of information in the middle of the context. @lostmiddle This finding motivates testing evidence selection and use separately. It does not establish that the same positional effect occurs in the project's GPT-5.1 configuration, which was not evaluated by that study.

Graph-oriented approaches address a different aspect of retrieval. Edge et al.'s GraphRAG constructs entity graphs and community summaries to support global questions across a corpus. Its reported improvements concern global sensemaking and summary coverage under the study's conditions. @graphrag LightRAG also uses graph structure, combining entity and relationship information with vector retrieval and a dual-level retrieval design. @lightrag These methods make relational and broader contextual questions relevant comparison cases; they do not imply that graph processing improves every direct lookup.

For this project, the central distinction is between retrieving a specific passage and constructing an answer that draws on relationships across information. The former may be served efficiently by a simpler retrieval mode. The latter motivates testing graph-based alternatives. A useful corpus should therefore contain both kinds of questions, with an explicit account of which task types are represented. The supplied mixed twelve-query pilot provides an initial comparison, but it cannot establish the preferred mode for all intended organisational work.

The design implication is to retain a simple baseline and compare it with more elaborate modes under matched conditions. Additional indexing and retrieval stages should be justified by their contribution to the task, including response quality and processing cost. The team's use of LightRAG's built-in modes is consequently assessed as a bounded integration choice; the original plan's additional keyword and reranking stages are not treated as necessary merely because they were initially proposed.

#pagebreak()
== Knowledge boundaries and specialist orchestration

Retrieval relevance and retrieval permission answer different questions. A result may be highly relevant yet outside the information scope intended for a particular assistant or caller. Ferraiolo and Kuhn's role-based access-control model provides a foundation for organising permission around organisational roles. @rbac Applied to NTG-agent-vnext, the relevant design question is where the access decision is enforced when an assistant invokes another capability. Role configuration alone would be insufficient if indirect invocation bypassed it.

The project considered document-tag separation and shared knowledge spaces before retaining per-agent LightRAG contexts in the inspected implementation. The following comparison is an engineering analysis of those alternatives, informed by the project requirements and source paths. It does not claim that a single tenancy model is universally more secure. @completion @implementation

#tab((1.1fr, 1.55fr, 1.75fr), ([Boundary strategy], [Potential benefit], [Responsibility or tradeoff]), (
  [Shared index with filtering], [Shared indexing and storage can support reuse across assistants.], [Every relevant query path must apply the intended scope correctly; tags are useful only when the retrieval layer enforces them.],
  [Per-agent retrieval context], [Knowledge ownership and routing align with the configured agent.], [Container lifecycle, workspace configuration and shared infrastructure remain operational responsibilities.],
  [Many-to-many knowledge spaces], [Several agents can reuse curated collections without copying every collection.], [Access must account for both agent permissions and collection bindings; this planned topology is not established by the current implementation.],
), [Knowledge-boundary alternatives and their implications for this application.]) <table-boundaries>

ReAct demonstrates the interleaving of model reasoning and actions that obtain information from an external environment. @react The relevant connection is explicit capability invocation: a specialist agent can be exposed through a tool interface while performing its own task. NTG-agent-vnext uses this pattern to give the outer agent a callable specialist, rather than direct access to the specialist's retrieval client.

This choice can be compared with a single agent holding all tools, or with an explicit planner-and-worker workflow. A single agent reduces delegation boundaries but concentrates tool choice and knowledge responsibilities. A workflow can make steps and state transitions explicit, at the cost of defining and maintaining the coordination logic. Tool-based delegation fits the project's retained scope because each specialist can answer a subtask behind a common invocation contract. This rationale follows from the final design; no comparative orchestration-performance experiment was supplied.

The contract nevertheless has costs. A delegated call can add model and retrieval work, and the outer agent must interpret the child's response. Returning an answer also compresses the underlying evidence, making provenance and error handling important. These tradeoffs lead to two questions for the evaluation: does the runtime enforce caller access at both tool exposure and invocation, and does the composed answer preserve the relevant evidence from the specialist? The inspected code addresses the first structurally; the second requires judged end-to-end tasks.

#pagebreak()
== Platform alternatives and implementation fit

The platform decision concerns what to adopt as a foundation and what remains application-specific. Dify provides an application-building environment with workflows, RAG facilities and model/tool integration. Microsoft Agent Framework supplies agent and workflow abstractions for application development, including the .NET environment used by the project. LangGraph emphasises stateful orchestration and durable execution. @dify @maf @langgraph These options occupy different layers, so their documented strengths are compared along the same project-relevant dimensions in @table-platforms.

#tab((1fr, 1.3fr, 1.45fr, 1.5fr), ([Dimension], [Dify], [Microsoft Agent Framework], [LangGraph]), (
  [Adoption unit], [An application platform and associated workflow environment.], [Agent and workflow building blocks integrated into application code.], [A stateful orchestration framework integrated into application code.],
  [Workflow emphasis], [Configured application workflows and knowledge/model capabilities.], [Agent construction, tools and workflow integration.], [Explicit state, durable execution and workflow control.],
  [Fit with this repository], [Adoption would require mapping the existing administration and agent model to the platform.], [Matches the existing .NET runtime and allows the project's own configuration model to remain central.], [A possible orchestration alternative; its state model would require additional application integration.],
  [Work still required for NTG], [Confirm how agent-level knowledge and role requirements map to the adopted configuration.], [Implement role checks, scoped knowledge binding, provider administration and client contracts.], [Implement equivalent access, knowledge, provider and client integrations around the workflow.],
), [Comparison of documented platform approaches. Repository-fit and remaining-work entries are project-specific interpretations, not claims that an alternative lacks those capabilities.]) <table-platforms>

Continuing with Microsoft Agent Framework can therefore be justified by continuity with the repository and control over the existing administrative model. It should not be justified by an untested claim that the framework is faster or more capable than the alternatives. The reusable framework supplies agent execution primitives; the capstone contribution supplies application decisions such as which specialist is visible, which knowledge context it receives and how an administrator configures its model.

Provider flexibility introduces another integration boundary. The GitHub record documents endpoint-routing fixes, global provider configuration, curated model selection and finally live thinking probes. @githubhistory These changes support a practical distinction between catalogue discovery and request compatibility. The former identifies what an endpoint advertises; the latter checks a selected option through an actual request path. A successful probe still does not compare the quality of different providers' reasoning, and its validity is bounded by the tested endpoint and configuration.

The market-review conclusion is consequently an integration gap specific to this project, rather than a claim that configurable assistants are absent from the market. Existing platforms and frameworks supply substantial capabilities. NTG-agent-vnext combines a particular set of requirements within an inherited application: agent-owned knowledge, caller-aware delegation, configurable providers, reusable skills and an interactive client. The report evaluates that combination and the work required to make its boundaries consistent.

#pagebreak()
== Interaction protocols and reusable task skills

A tool-capable assistant needs a way to communicate more than final text. AG-UI defines an event-oriented connection between an agent backend and a user-facing application, including streamed activity and state interaction. A2UI supplies a declarative representation of interfaces rendered by compatible clients. @agui @a2ui Their roles are complementary: one concerns the interaction stream, while the other concerns the structure of a surface carried through the application.

MCP addresses a further boundary by exposing tools, resources and prompts through a client–server architecture. @mcp A backend tool connection, a browser-facing event stream and a rendered form are therefore different integration contracts. Treating all three as a generic “agent protocol” would conceal where validation and error handling belong. In NTG-agent-vnext, access to an inner agent remains an application-level decision even when other tools use MCP.

The evolution of the project's interface illustrates the distinction. PR 264 introduced the AG-UI conversational path and generative surfaces. PR 286 then added skill-bound templates and client-capability handling. The earlier per-tool approach required a corresponding frontend component for a new visual result. A declarative catalogue broadened what could be rendered, while authored skill templates constrained the layout for repeatable workflows. @githubhistory These are successive engineering choices, not evidence that every task should use generated UI.

The Agent Skills specification organises reusable expertise around instructions and supporting resources. @skills The project adopts that concept in administrator-managed packages, then adds its own storage, binding and template-validation logic. Its implementation deliberately supports a constrained package format; adopting the skill concept does not imply support for every optional resource or execution capability in other skill ecosystems.

Three interaction strategies emerge. Plain text remains suitable when an answer requires explanation but little structured input. Freely generated surfaces offer flexibility when presentation varies, but require robust handling of invalid or inconsistent structures. Authored templates are appropriate when the workflow and input fields should remain stable while the data change. NTG-agent-vnext retains both declarative paths, using skill templates to reduce repeated layout generation in the supplied demonstrations.

Template validation and task correctness must still be separated. A surface can satisfy a component schema while presenting an incorrect recommendation, and a plausible recommendation can appear in a form with unusable bindings. The project's validator addresses structural constraints such as references and seeded input paths. Human task assessment and runtime interaction checks address the separate questions of whether the content is correct and the workflow is useful. This division gives a concrete evaluation purpose to the separation between model output, transport and rendering.

#pagebreak()
== Evaluation synthesis and design questions

RAG evaluation must distinguish whether relevant material was retrieved, whether the answer is supported by that material, and whether it answers the question correctly. RAGAs presents a framework for evaluating several dimensions of RAG pipelines, including context relevance, faithfulness and answer relevance. @ragas These dimensions inform the report's analysis, but RAGAs was not executed for the supplied trials. Its relevance is methodological: one favourable metric should not stand in for the entire application outcome.

The retrieved-source unit also matters. A hit on a document identifier and a hit on an answer-bearing chunk are different observations. Likewise, a correct specialist answer does not establish that the outer agent uses it correctly, and a successful health sample does not measure availability throughout an agreed window. The project's evaluation should preserve these distinctions in its scorer, task definitions and runtime traces.

@table-design-questions consolidates the review into questions that guide the design and analysis. Each question links a user need to a chosen mechanism and a corresponding test. This provides a traceable contribution argument: prior work supplies methods and infrastructure, the team supplies application integration, and the evaluation determines which resulting claims are supported.

#tab((0.55fr, 1.45fr, 1.65fr, 1.55fr), ([ID], [Design question], [Project response], [Evaluation implication]), (
  [DQ1], [How can answers use the appropriate agent's documents?], [Agent-scoped LightRAG and a document indexing lifecycle.], [Measure retrieved evidence and judged answers separately; verify document ownership and routing.],
  [DQ2], [How can specialists be reused without bypassing caller permissions?], [Agents-as-tools with access filtering and invocation-time checks.], [Exercise allowed, denied, revoked and unpublished-agent cases through direct and delegated routes.],
  [DQ3], [How can administrators configure heterogeneous models reliably?], [Provider/model catalogues, explicit selection and live thinking probes.], [Test configuration and error paths; distinguish accepted parameters from output quality.],
  [DQ4], [How can task interaction be extended without per-task frontend redevelopment?], [AG-UI events, A2UI rendering and skill-bound authored templates.], [Check import validation, usable inputs, state continuity and task correctness.],
  [DQ5], [How can the integrated platform be reproduced and assessed?], [Setup automation, provisioning status, documentation and retained evidence.], [Repeat setup and recovery exercises; retain absolute timings, cost records and evaluation artefacts.],
), [Design questions synthesised from the literature, platform comparison and project needs.]) <table-design-questions>

The available retrieval results primarily address DQ1's coverage component and expose latency tradeoffs. The inspected implementation and GitHub history provide evidence for mechanisms relevant to DQ2–DQ5. They do not replace behavioural acceptance tests. The resulting research direction is focused: evaluate representative authorised workflows, explain unsuccessful cases, and measure operational properties under documented conditions before drawing broader deployment conclusions.
