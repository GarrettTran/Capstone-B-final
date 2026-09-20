#import "../style.typ": tab
== Delivered capabilities and engineering findings

The reviewed GitHub history links the final solution to identifiable integration outcomes. @table-accomplishments groups these by the design questions from Section 3, rather than treating repository activity as a single undifferentiated accomplishment. The source snapshot and merge records support implementation and integration claims; the separate retrieval trials support the experimental claims that follow. @implementation @githubhistory

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

#pagebreak()
== Evaluation evidence and trial conditions

The available quantitative evidence concerns retrieval. The supplied report describes a six-query validation run, a twelve-query pilot and a warm-cache rerun of the same twelve pilot queries. @trials The rerun examines consistency under changed cache conditions; it is not an additional independent query set. Overlap between the six validation questions and the twelve pilot questions is not established.

PR descriptions also report tests, builds and manual checks. Those statements provide development context, but they concern different revisions and procedures and were not independently reproduced during report preparation. In particular, test counts from different PRs are not combined into a final test-suite total. The report retains the distinction between such author-reported checks and the supplied retrieval measurements.
