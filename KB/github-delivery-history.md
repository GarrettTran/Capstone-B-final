# GitHub delivery history and contribution reconciliation

Reviewed 20 September 2026. Source: original GitHub REST PR metadata and complete PR commit lists, plus local application integration commits. Dates below are UTC+7.

## Scope and interpretation

- The nested application repository is non-shallow and has development history; do not apply the report repository import-commit limitation to it.
- Twelve PRs are preserved in `report/data/github-history.json`. Integration SHAs were checked locally; the reviewed head is `7789ed056a403486f094f81cfe50f37fedf1dd54`.
- The 22 feature rows use explicitly selected commits. Inherited ancestors in stacked PRs are not automatically attributed to the later feature. Rows are not additive effort measures.
- Ranges use commit author dates; committer dates are separately preserved. A merge date is integration into main, not initial implementation, deployment or acceptance.
- User-confirmed identity mappings are corroborated by PR authors and linked commits. An appears as `AnVuGia`, `PepeDaFrog` and `An Vu`; keep the recorded identifier rather than rewriting history.

## Feature-level evidence

| ID | Feature | Recorded contributor(s) | Selected change dates | Integration | PR |
| --- | --- | --- | --- | --- | --- |
| F01 | LightRAG + PostgreSQL | Chau | 2026-05-14 to 2026-05-18 | 2026-07-17 | [265](https://github.com/nashtech-garage/ntg-agent/pull/265) |
| F02 | Per-agent containers / network | Chau | 2026-06-02 to 2026-06-03 | 2026-07-17 | [265](https://github.com/nashtech-garage/ntg-agent/pull/265) |
| F03 | Document status / event worker | Chau | 2026-06-07 to 2026-06-07 | 2026-07-17 | [265](https://github.com/nashtech-garage/ntg-agent/pull/265) |
| F04 | Idle-container shutdown | An | 2026-06-07 to 2026-06-07 | 2026-07-17 | [265](https://github.com/nashtech-garage/ntg-agent/pull/265) |
| F05 | Agents-as-tools / bindings | Khang | 2026-05-31 to 2026-06-15 | 2026-06-19 | [261](https://github.com/nashtech-garage/ntg-agent/pull/261) |
| F06 | AG-UI client / streaming | Tien | 2026-06-07 to 2026-07-06 | 2026-07-07 | [264](https://github.com/nashtech-garage/ntg-agent/pull/264) |
| F07 | Generative cards / A2UI | Tien | 2026-06-22 to 2026-06-29 | 2026-07-07 | [264](https://github.com/nashtech-garage/ntg-agent/pull/264) |
| F08 | Retire legacy memory / search | Chau + Tien | 2026-07-13 to 2026-07-14 | 2026-07-17 | [265](https://github.com/nashtech-garage/ntg-agent/pull/265) |
| F09 | Role-gated agent access | An | 2026-06-15 to 2026-07-22 | 2026-07-23 | [277](https://github.com/nashtech-garage/ntg-agent/pull/277) |
| F10 | Initial model discovery | An | 2026-06-21 to 2026-06-21 | 2026-07-23 | [277](https://github.com/nashtech-garage/ntg-agent/pull/277) |
| F11 | Provider routing / client factories | An | 2026-07-13 to 2026-07-22 | 2026-07-23 | [281](https://github.com/nashtech-garage/ntg-agent/pull/281) |
| F12 | Secret scan / scanner repair | An | 2026-07-18 to 2026-07-22 | 2026-07-22 | [278](https://github.com/nashtech-garage/ntg-agent/pull/278) / [280](https://github.com/nashtech-garage/ntg-agent/pull/280) |
| F13 | Provisioning state / readiness | Chau | 2026-07-19 to 2026-08-16 | 2026-08-20 | [282](https://github.com/nashtech-garage/ntg-agent/pull/282) |
| F14 | VM migration / service structure | Chau + Sieu Anh | 2026-08-02 to 2026-08-16 | 2026-08-20 | [282](https://github.com/nashtech-garage/ntg-agent/pull/282) |
| F15 | Agent gateway / port-ledger removal | An | 2026-08-04 to 2026-08-05 | 2026-08-20 | [282](https://github.com/nashtech-garage/ntg-agent/pull/282) |
| F16 | Global providers / model catalogue | Khang | 2026-07-20 to 2026-08-26 | 2026-09-03 | [287](https://github.com/nashtech-garage/ntg-agent/pull/287) |
| F17 | Live thinking compatibility probe | Khang | 2026-08-26 to 2026-08-26 | 2026-09-03 | [287](https://github.com/nashtech-garage/ntg-agent/pull/287) |
| F18 | Skills storage / import / runtime | Tien | 2026-08-10 to 2026-08-24 | 2026-08-25 | [286](https://github.com/nashtech-garage/ntg-agent/pull/286) |
| F19 | Surface validation / UI hardening | Tien | 2026-08-10 to 2026-08-24 | 2026-08-25 | [286](https://github.com/nashtech-garage/ntg-agent/pull/286) |
| F20 | Installer / default-agent setup | An | 2026-08-12 to 2026-09-07 | 2026-09-13 | [285](https://github.com/nashtech-garage/ntg-agent/pull/285) |
| F21 | macOS setup / showcase demo plan | Chau | 2026-08-25 to 2026-09-06 | 2026-09-13 | [285](https://github.com/nashtech-garage/ntg-agent/pull/285) |
| F22 | Dependency / integration maintenance | Sieu Anh | 2026-08-30 to 2026-09-03 | 2026-09-03 | [288](https://github.com/nashtech-garage/ntg-agent/pull/288) |

Exact selected SHAs are in `report/data/delivery-timeline.json`; the source PR commit messages and dates are retained in `github-history.json`. Merge changed-file lists were read from the local Git objects.

## Findings affecting report interpretation

- PR 265 has no body and a generic memory title, but its commits distinguish Chau's LightRAG work, An's shutdown changes and Tien's legacy-stack removal. PR title/author alone is insufficient attribution.
- PR 277 includes An's initial model-discovery commit `c311d21`; PR 281 adds provider/client routing by An. Khang's PR 287 extends this with global providers, per-provider model management and a live thinking probe.
- PR 287's body is stale about curated thinking support. Commit `7af467b` (26 August) removes the curated list and adds the probe. The commit changed-file list and final implementation were inspected to resolve this.
- PR 285 explicitly depends on PR 282. An supplies installer/bootstrap and provider-seeding changes; Chau supplies macOS installation and showcase demo planning. A 7 September integration commit retargets default-agent seeding to the provider entity.
- Thien (`thiennn`) is the merger recorded for all twelve PRs. Sieu Anh (`sieunhantanbao`) contributes within PR 282 and authors maintenance PR 288. Do not infer meetings or sponsor acceptance from this activity.
- Against the Phase 2 textual milestone of 26 August: access merged 23 July; skills 25 August; provider/model management 3 September, eight days later. The history does not establish the reason for that interval.
- The completion-plan Phase 3 image conflicts with its explicit prose/table endpoint of 9 September. The report uses that textual baseline and flags the conflict; feature subtask dates are not inferred from inconsistent image bars.
- Shared many-to-many knowledge spaces remain a scope difference. Per-agent containers and gateway routing do not establish shared-space delivery.
- The benchmark corpus freeze on 14 September does not establish a run date or the fulfilment of Phase 3 operational targets.
- PR bodies contain author-reported tests and setup checks; they were not rerun during this review, and CI execution history was not audited.

## Reproduction

Run `python3 report/scripts/generate-figures.py` to regenerate the feature manifest and charts from the preserved GitHub records, then compile `report/main.typ`. The feature selection is explicit in `report/scripts/build-delivery-timeline.py`.
