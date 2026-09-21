#import "../style.typ": fig, tab
= Result analyses and discussions

#include "05-accomplishments.typ"

#tab((1fr, 2.6fr), ([Condition], [Supplied trial configuration]), (
  [Retrieval engine], [LightRAG 1.4.16; naive, local, global and hybrid modes.],
  [Generation and embedding], [GPT-5.1 through azure_openai; text-embedding-3-large embeddings; no reranker.],
  [Corpus], [Four documents, 81 chunks, frozen on 14 September 2026.],
  [Corpus composition], [Minimal APIs: 61 chunks; maintainability: 2; medical: 16; handwriting: 2.],
  [Query sets], [Validation: 6; pilot: 12; rerun: the same 12 pilot questions.],
  [Cache conditions], [Validation and pilot described as cold; rerun used a warm LLM cache.],
  [Available evidence], [Summary PDF with charts, aggregate values and query inventory; raw calls, health samples and harness configuration were not supplied.],
), [Conditions for interpreting the reported retrieval measurements. Source: supplied retrieval trials, pp. 1–9.])

The corpus provides a development-scale mixture of software and non-software topics. Its distribution is uneven, with the Minimal APIs document accounting for 61 of 81 chunks. This makes the trials useful for checking retrieval behaviour across the supplied cases, but does not establish performance on a large or representative enterprise collection. Corpus scale and question composition remain part of the result, rather than background details that can be omitted when reporting hit rates.

The numerical values below are transcribed from the supplied report. They were not recomputed from raw retrieval calls. Captions identify the relevant conditions, and the companion JSON file preserves the plotted values for subsequent verification and editing.

== Retrieval coverage and consistency

All four modes achieved a reported hit\@5 of 1.000 on the six-query validation set and 0.917 on the twelve-query pilot. The pilot value corresponds to eleven successful cases out of twelve and exceeds the completion plan's numerical hit\@5 threshold of 0.80 on this set. @fig-hits shows both hit\@1 and hit\@5, preserving the difference between placing relevant material first and including it within a larger candidate set. @trials

#fig("assets/retrieval-hit-rates.svg", [Reported retrieval coverage by mode and query set. The dashed line is the planned hit\@5 target, not a hit\@1 requirement. Pilot values were unchanged in the warm-cache rerun. Source: retrieval trials, pp. 2–7.]) <fig-hits>

The pilot's hit\@1 was 0.583 for naive retrieval and 0.500 for local, global and hybrid retrieval, corresponding to seven and six successful first-ranked cases respectively. On this task set, the aggregate results therefore do not demonstrate an advantage for hybrid retrieval. At hit\@5, hybrid matched the best observed mode; at hit\@1, naive had a one-query advantage. The small absolute difference should be interpreted at the query level rather than presented as a general ranking of retrieval approaches.

Consistency across the pilot and warm-cache rerun is a useful result. The reported hit rates were preserved despite the changed cache condition, suggesting stable aggregate retrieval coverage for those repeated questions. It does not establish stability across new questions, corpus updates or repeated independent deployments.

The source uses both document-level and chunk-level language when describing top-k hits. With only four documents, a top-five list of unique documents cannot be interpreted literally in the same way as five retrieved chunks. Until the raw records and scorer are available, the report retains the source's term “reported hit\@5.” A hit associated with the expected document should not automatically be read as retrieval of the exact answer-bearing passage.

The most informative unsuccessful case is the captive-dependency question, identified as p04 in the query inventory. It was missed by all four modes. The shared failure makes the case useful for inspecting the source passage, chunk construction and expected-answer mapping before attributing the problem to a particular retrieval mode. Its cause cannot be established from the aggregate report alone.

== Latency tradeoffs and cache conditions

The trials expose a clear latency tradeoff even where coverage is equal. In the cold pilot, relative median retrieval latency was 1.0 for naive, 3.4 for local, 3.3 for global and 3.9 for hybrid. In the warm-cache rerun, the corresponding ratios were 1.0, 1.3, 1.3 and 1.8. @fig-latency normalises each trial to its own naive baseline. @trials

#fig("assets/retrieval-latency-ratios.svg", [Reported relative median retrieval latency. Each trial has its own naive = 1 baseline; bar differences across trials are not absolute time savings. Source: retrieval trials, pp. 4–7.]) <fig-latency>

These results support testing naive retrieval as a lower-latency baseline for similar queries, since the graph-based modes did not improve aggregate hit\@5 in this pilot. They do not justify removing graph-based retrieval from the platform. Questions requiring broader relationship synthesis may behave differently, and the trial does not isolate the effect of every processing stage.

The source also describes answer generation as approximately seven times faster in the warm-cache rerun. This is useful evidence that cache state materially affects the observed experience, but the supplied summary is insufficient to separate model, retrieval, network and cache contributions. The relative retrieval ratios should not be converted into dollar costs, nor should a warm-cache answer-time observation be equated with a time-to-first-token percentile.

Health checks succeeded in 9 of 9 validation samples, 44 of 44 pilot samples and 32 of 32 rerun samples. This supports the narrower observation that the sampled checks were successful during the trials. The sample intervals and observation-window durations are not supplied, so these counts do not establish availability across the full demonstration window or compliance with the recovery target.

The operational implication is to make cache state and measurement boundaries visible in subsequent comparisons. A repeatable evaluation should report absolute timings, distinguish retrieval from full response generation, and record both cold and warm conditions. This would allow the team to connect the observed tradeoffs to the completion plan's service-level targets without changing those targets after the fact.

== Comparison with planned success criteria

@table-targets separates observed results from requirements that need further evidence. This preserves the positive retrieval finding while avoiding an unsupported claim that all performance goals were achieved. @completion @trials

#tab((1.05fr, 1.45fr, 1.8fr), ([Criterion], [Planned target], [Evidence and current assessment]), (
  [Retrieval coverage], [Hybrid hit\@5 ≥ 0.80 and at least the best single mode.], [Reported pilot hit\@5 = 0.917 for all modes. Numerical target met on this set; scoring unit requires confirmation.],
  [Answer quality], [Mean human rating ≥ 4/5; two independent blind raters.], [No validated human-rated output results supplied. Retrieval hits cannot substitute for this measure.],
  [Ingestion], [P95 ≤ 20 s below 100 KB; ≤ 90 s for 100 KB–1 MB; ≤ 5 min above 1 MB.], [No comparable ingestion measurements supplied for these document-size bands.],
  [Response latency], [TTFT p50 ≤ 1.5 s, p95 ≤ 4 s; full response p50 ≤ 12 s.], [Relative retrieval medians and a cache observation do not establish these end-to-end targets.],
  [Availability and recovery], [Full demonstration-window availability; recovery ≤ 60 s.], [Successful sampled checks reported; no complete window or recovery exercise supplied.],
  [Cost], [Median ≤ US\$0.03 per five-turn conversation.], [No comparable five-turn cost distribution supplied. Latency ratios are not cost measurements.],
  [Quality gate], [Green quality checks for each merge.], [CI workflow present in source; execution history and merge-by-merge compliance not verified.],
), [Success criteria retained from the completion plan and assessed against the available evidence.]) <table-targets>

== Priorities for further validation

The first priority is to preserve and inspect the trial artefacts: query definitions, relevance labels, raw calls, configuration and health samples. This would resolve the hit-definition ambiguity and permit recomputation of the published aggregates. The p04 failure should then be analysed against the exact source passage and retrieved chunks. A corrected scoring definition may change interpretation without changing the underlying system.

The second priority is to evaluate the configured-assistant workflow through paired authorised and unauthorised cases. Retain the caller's roles, specialist bindings and publication state, then test allowed, denied, revoked and unpublished-agent paths. For allowed calls, use the planned human assessment to judge answer correctness and evidence use; for denied calls, inspect both invocation records and returned content. This connects access enforcement and answer quality without confusing their scoring criteria. Include missing-information cases and compare retrieval modes under matched conditions.

The third priority is operational assurance: retain delegation records that explain which specialist was called and under whose access decision, and collect absolute latency, ingestion, recovery and conversation-level cost measurements. Multi-turn interface tasks should check input edits and continuation alongside content correctness. These activities close gaps in the existing workflow and original success criteria. Reintroducing long-term memory would be a separate scope decision requiring its own use case and evaluation, rather than a prerequisite for validating the retained solution.
