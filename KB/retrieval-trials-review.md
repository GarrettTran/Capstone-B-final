# Retrieval Trials: Evidence Review

Reviewed: 20 September 2026.
Source: `Requirements/NTG-Agent-Retrieval-Trials.pdf` (9 pages).
Status: preliminary review of a supplied summary; raw records and harness have not been supplied or independently verified.

## What the supplied PDF reports

Configuration (p. 1): LightRAG 1.4.16, GPT-5.1 via Azure OpenAI, text-embedding-3-large, no configured reranker. Corpus (p. 9): frozen 14 September 2026, four documents and 81 chunks. One .NET document accounts for 61 chunks; the other three contain 2, 16 and 2 chunks. The corpus mixes .NET material, a medical review, and a Vietnamese handwriting worksheet.

| Trial | Queries per mode | Cache label | Hybrid hit-rate@5 | Naive / hybrid hit-rate@1 | Hybrid retrieval time relative to naive | Successful health samples |
| --- | --- | --- | --- | --- | --- | --- |
| Validation (pp. 2-3) | 6 | Cold | 1.000 | 0.833 / 0.833 | 4.0x | 9/9 |
| Pilot (pp. 4-5) | 12 | Cold | 0.917 | 0.583 / 0.500 | 3.9x | 44/44 |
| Re-run (pp. 6-7) | 12 | LLM cache warm | 0.917 | 0.583 / 0.500 | 1.8x | 32/32 |

The summary reports identical hit-rate@5 across naive, local, global and hybrid within each trial. The warm re-run repeats the pilot queries verbatim; do not treat it as another twelve independent questions. The overlap of the six validation queries with the pilot is unknown. Do not describe the experiment as thirty distinct questions.

The pilot query table (p. 8) reports that p04, concerning captive dependencies, missed the gold document for all four modes. The rounded pilot rates correspond to 11/12 hits at k=5, 7/12 for naive at k=1, and 6/12 for hybrid at k=1. This difference is one query, not evidence of a general ranking advantage. The PDF explicitly withdraws earlier non-human answer ratings (p. 9); no valid human correctness scores are provided.

## Useful report claims

- A preliminary retrieval comparison was conducted across four LightRAG modes on a small development corpus. Formal evaluation is incomplete, but it is now inaccurate to say that no trials exist.
- On this reported pilot, hit-rate@5 did not discriminate between modes. Matching the numerical 0.80 threshold does not establish completion of the planned answer-quality evaluation.
- Graph-based modes incurred greater reported retrieval latency than naive on this corpus. Label the multiplier as a latency ratio, not monetary cost or token consumption.
- The repeated-query run illustrates cache sensitivity. Its lower latency should be reported separately from the cold run, with attribution to the PDF until the cache procedure and raw timing records are available.
- The failed query and corpus imbalance provide concrete material for limitations and error analysis.

Suggested report framing: **Preliminary Retrieval Trials on a Development Corpus**. Keep it concise in the body, with one comparison table and an explanation of limitations. Put detailed query evidence in an appendix once received.

## Problems to resolve before stronger claims

1. **Retrieval unit is ambiguous.** The chart describes finding a gold document among the top-k chunks, while the narrative calls the results “top-5 documents.” With only four distinct documents, five unique document results are impossible. Establish whether the harness ranks chunks, document IDs with duplicates, or deduplicated documents, and exactly how a hit is assigned. Returning a chunk from the right document does not by itself prove that the answer-bearing passage was retrieved.
2. **Equal hit-rate does not prove equal retrieval.** Different chunks and orderings can yield the same document-level hit. The PDF's claim of identical retrieved documents requires per-query raw lists; it does not establish identical graph context or generated-answer quality.
3. **Validation text contradicts its own aggregate plot.** Page 2 says k=1 separates the modes, but its four displayed values are all 0.833. Describe no aggregate separation in that trial; reserve the k=1 comparison for the pilot/re-run. Equal rates alone also cannot establish identical per-query rankings.
4. **Sample coverage is limited.** There are twelve pilot queries over a mixed development corpus, not a demonstrated representative set of sponsor workflows. Five questions target the two-chunk .NET document; examine chunking and evidence granularity rather than assuming the corpus proportions explain outcomes.
5. **Answer quality remains unmeasured under the agreed method.** The completion plan requires two independent human raters and a mean correctness rating of at least 4/5. Do not use the withdrawn scores or infer answer accuracy from hit-rate.
6. **Timing boundaries and cache controls are missing.** Obtain exact latency values, whether “answer” includes retrieval, run order, resets/warm-up, retries, concurrency, generation settings and infrastructure details. These plots cannot establish TTFT or directly certify the application's full-response target.
7. **Uptime is sampling evidence only.** The 9, 44 and 32 successful samples do not establish continuous 100% availability over the agreed demonstration window or recovery within 60 seconds. Timestamps, sampling intervals, duration and recovery observations are needed for those targets.
8. **The PDF omits interactive evidence.** Page 8 says rows expand to show retrieved documents and answers, but those contents are not present in the static export. Page 9 names `retrieval/calls.jsonl`, `uptime/samples.jsonl` and checksums; none are currently in the workspace.

## Minimum additional evidence to request

First request the existing evidence bundle rather than immediately asking for a new benchmark:

- The three run directories, raw retrieval/answer/timing records and health samples, with checksums if available.
- The harness code or exact revision, configuration and metric calculation; confirm whether calls reach NTG Agent or LightRAG directly.
- Full query sets, gold document/chunk mapping and expected answer evidence; corpus identifiers and chunking settings. Include source documents when they can be shared.
- Original HTML dashboard or an expanded export containing per-query retrieved IDs, ordering and generated answers.
- Run metadata: timestamps, model/deployment settings, host specification, cache reset procedure, request order and retries.

If stronger evaluation is later feasible, add the planned two-rater review using existing pilot answers, and add deliberately selected answerable, cross-document and unanswerable queries on relevant enterprise material. Treat any expanded query count as an agreed design choice, not a substitute for gold evidence or representative coverage. Keep this work deferred unless the user resumes evaluation.

## Claim boundaries

This evidence does not establish hybrid superiority, general answer correctness, robust cross-document reasoning, isolation/access-control security, monetary conversation cost, application TTFT, ingestion latency, or production readiness. It can still support a useful, candid empirical subsection with explicit scope and uncertainty. No result has been recomputed from raw data during this review.
