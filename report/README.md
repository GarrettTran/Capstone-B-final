# NTG-agent-vnext final report draft

The expanded English review draft uses the evidence available on 20 September 2026. It follows the required section structure and uses IEEE references. Retrieval findings are presented as bounded observations with constructive evaluation priorities.

## Build

From the repository root:

```sh
python3 report/scripts/generate-figures.py
typst compile report/main.typ output/pdf/capstone-final-report-draft.pdf
```

Figure generation requires Python, Matplotlib and NumPy. The checked-in SVG assets allow Typst-only builds. The draft was compiled with Typst 0.15.1. No external Typst packages are required. Fonts: Liberation Serif and Liberation Sans.

## Editing

- `main.typ`: cover, contents, section assembly and journal inclusion.
- `style.typ`: typography and shared figure/table helpers.
- `sections/`: independently editable report sections; `04-runtime.typ` expands provider/skill/operational design and `05-accomplishments.typ` links delivered capabilities to the literature-derived design questions.
- `references.bib`: research, official documentation and project sources.
- `data/retrieval-summary.json`: transcribed aggregate trial values, not raw calls.
- `scripts/generate-figures.py`: six vector figures, including two detailed feature Gantt charts.
- `assets/provenance.json`: figure provenance.
- `data/github-main-check.json`: remote-main recheck; no newer integration than the reviewed head.
- `data/github-history.json`: twelve original PR records and full commit lists retrieved from GitHub.
- `data/github-pr-register.csv`: compact PR metadata and links.
- `data/delivery-timeline.json`: twenty-two feature mappings with selected SHAs and UTC+7 dates.
- `scripts/build-delivery-timeline.py`: feature mapping and Gantt generation, also called by `generate-figures.py`.
- `sections/04-delivery.typ`: expanded Section 4.7.
- `meeting-minutes/week-01.typ` through `week-12.typ`: existing independent weekly drafts, imported into the report.

## Length and verification

The expanded draft has **25 main-body pages including its figures and tables** and 45 physical pages including excluded matter. The user explicitly deferred page optimisation for this revision so that context, literature synthesis and implementation analysis could be developed fully. It is not yet the final page-budgeted submission version. Recheck the original fewer-than-20-page prose requirement during the later editorial pass.

```sh
typst eval --in report/main.typ 'query(<body-end>).first().location().page() - query(<body-start>).first().location().page() + 1'
```

The initial PDF was compiled and visually reviewed for body layout, figure readability, table wrapping, references, front matter and journal integration. This validates the report artifact, not the application. No application tests or benchmark rerun were performed.

## Remaining final-review items

- Confirm final delivery status after the 20 September snapshot, exact submission metadata and any additional contribution or deployment records.
- Confirm the weekly journal drafts before treating them as actual meeting records.
- Supply the retrieval harness, raw calls, labels and configuration if available, especially to resolve chunk-versus-document scoring.
- Human answer assessment, absolute end-to-end latency, ingestion, recovery and conversation cost remain unverified against the original targets.

The Gantt charts distinguish planned phase windows, selected commit-author dates and PR merges. Spans between recorded changes do not measure continuous effort. The Phase 3 plan graphic conflicts with its prose/table milestone; the report documents use of the textual baseline. Benchmark strengths and remaining evaluation needs are both retained; the report does not describe the benchmark as “weak.”
