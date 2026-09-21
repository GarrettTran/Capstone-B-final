#import "../style.typ": tab
== Delivered capabilities and engineering findings

The principal engineering outcome is a configured-assistant workflow that connects agent-scoped documents with caller-aware specialist delegation. Provider administration and interactive skills support its configuration and use, while lifecycle and setup tooling support continued operation. @table-accomplishments maps these outcomes to the design questions from Section 3. The source snapshot and merge records establish implementation and integration; the separate retrieval trials supply the quantitative observations analysed below. @implementation @githubhistory

#tab((0.65fr, 1.35fr, 1.85fr, 1.45fr), ([Link], [Capability], [Implemented outcome], [Evidence boundary]), (
  [DQ1], [Agent-scoped knowledge], [LightRAG/PostgreSQL integration, per-agent containers, asynchronous document status and later VM/gateway routing.], [PRs 265/282 and scoped retrieval paths; no independent tenancy-security test.],
  [DQ2], [Authorised specialist delegation], [Inner-agent bindings and tool invocation with caller-aware exposure and invocation checks.], [PRs 261/277 and AgentToolPlugin; composed-answer quality remains to be assessed.],
  [DQ3], [Provider and model administration], [Global provider configuration, enabled-model selection, endpoint handling and live thinking probes.], [PRs 277/281/287; probe acceptance is not a model-quality score.],
  [DQ4], [Interactive skills], [AG-UI client, declarative surfaces, skill import/binding, template validation and runtime rendering.], [PRs 264/286; demonstration packages use synthetic data.],
  [DQ5], [Reproducibility and maintenance], [Local installer, default-agent setup, provisioning support, scanner configuration and documentation.], [PRs 278/280/282/285/288; setup and CI claims need their corresponding execution records.],
), [Delivered capabilities mapped to the review's design questions and their evidence.]) <table-accomplishments>

Three engineering findings are particularly relevant to the application's needs. First, capability reuse required access control to be carried into the delegated invocation. Exposing an inner agent as a generic tool was not sufficient: the wrapper also needed the caller's access decision and the child's knowledge binding. This joins orchestration and document ownership in a single runtime path.

Second, provider compatibility was resolved at a more specific level than a model-name list. The progression from routing corrections to a live thinking probe shows why provider, endpoint, model and option must be considered together. The implemented result is an administrative check against a real request path. The remaining limitation is that a successful small request does not establish reliable behaviour across all conversations or later provider changes.

Third, reusable UI required more than transporting generated JSON. The skill work added template structure, input-binding validation, stable surface identity and client-aware handling. These changes address the difference between displaying a form and sustaining a usable task flow. The resulting contribution is a stronger interaction contract, with human task evaluation still needed to establish usability and correctness.

== Evidence for the configured-assistant workflow

The project's central access-control claim and its strongest quantitative evidence concern different parts of the workflow. The implementation contains caller-aware checks at specialist exposure and invocation, whereas the supplied trials measure retrieval coverage and relative latency. @table-workflow-evidence makes that distinction explicit. A favourable retrieval hit rate cannot establish that an unauthorised request is denied, just as a denied request cannot establish that an authorised answer is correct.

#tab((1.15fr, 1.5fr, 1.75fr), ([Workflow claim], [Available evidence], [Assessment and remaining question]), (
  [Administrators configure assistants and their capabilities.], [Provider/model management, access bindings and skill import in PRs 277, 286 and 287.], [Implemented configuration paths. No observed administrator task study or measured setup benefit is established.],
  [An assistant retrieves from its assigned knowledge context.], [Agent-scoped retrieval paths; supplied four-mode retrieval trials.], [Topology is implemented; reported pilot hit\@5 is 0.917. The trial does not measure cross-agent access enforcement or human answer correctness.],
  [Specialist use remains subject to caller permissions.], [Access filtering when tools are exposed and another check when invoked; PRs 261 and 277.], [Mechanism supported by inspected code. Recorded allowed, denied, revoked and unpublished-agent cases are needed for end-to-end acceptance.],
  [Supported task variations use reusable interactive surfaces.], [AG-UI integration, catalogue rendering and authored skill templates; PRs 264 and 286.], [Rendering and validation paths are implemented. No general usability result or completed real business transaction is established.],
), [Claim-to-evidence assessment of the configured-assistant workflow. Implementation evidence and retrieval measurements answer different acceptance questions.]) <table-workflow-evidence>

The demonstration scenario provides useful candidate acceptance tasks: configure an assistant, ask a document-backed question, attempt a restricted route and complete a structured interaction. However, a scripted scenario is not a retained execution record. The presentation flow contains proposed policy-question and cross-boundary measurements alongside unfinished numerical placeholders. Those proposed counts are not included as observed results in this report, and its fictional policy corpus is not treated as the development corpus used in the retrieval trials. @presentationflow

For a permission test, the expected outcome must depend on the caller, target specialist and configured grants. A request concerning another agent's documents is not necessarily a violation: an authorised delegation is intended to return information. A useful record would retain the access configuration, route, expected decision, actual tool invocation and returned content. This would test the central claim more directly than an isolated refusal or a successful answer alone.

== Evaluation evidence and trial conditions

The available quantitative evidence concerns retrieval. The supplied report describes a six-query validation run, a twelve-query pilot and a warm-cache rerun of the same twelve pilot queries. @trials The rerun examines consistency under changed cache conditions; it is not an additional independent query set. Overlap between the six validation questions and the twelve pilot questions is not established.

PR descriptions also report tests, builds and manual checks. Those statements provide development context, but they concern different revisions and procedures and were not independently reproduced during report preparation. In particular, test counts from different PRs are not combined into a final test-suite total. The report retains the distinction between such author-reported checks and the supplied retrieval measurements.
