# NTG-agent-vnext final report draft

The expanded English review draft retains implementation and trial evidence from 20 September 2026, with narrative alignment and market sources updated on 21 September 2026. It follows the required section structure and uses IEEE references. Retrieval findings are presented as bounded observations with constructive evaluation priorities.

## Build

From the repository root:

```sh
python3 report/scripts/generate-figures.py
typst compile --font-path report/.fonts report/main.typ output/pdf/capstone-final-report-draft.pdf
```

Figure generation requires Python, Matplotlib and NumPy. The checked-in SVG assets allow Typst-only builds. The draft was compiled with Typst 0.15.1. No external Typst packages are required. Report text uses Times New Roman, including headings and the cover. Install this font locally or supply it through `--font-path report/.fonts`; extracted font files are ignored by Git. This workspace uses the four Times New Roman styles from Microsoft Core Fonts (`https://downloads.sourceforge.net/corefonts/times32.exe`), with the accompanying licence retained in the local font directory. Existing SVG figure labels retain their authored fonts.

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

The expanded draft has **27 main-body pages including its figures and tables** and 48 physical pages including excluded matter. The user explicitly deferred page optimisation for this revision so that context, literature synthesis and implementation analysis could be developed fully. It is not yet the final page-budgeted submission version. Recheck the original fewer-than-20-page prose requirement during the later editorial pass.

```sh
typst eval --in report/main.typ 'query(<body-end>).first().location().page() - query(<body-start>).first().location().page() + 1'
```

The revised PDF was compiled and visually reviewed for body layout, figure readability, table wrapping, references, front matter and journal integration. This validates the report artifact, not the application. No application tests or benchmark rerun were performed.

## Remaining final-review items

- Confirm final delivery status after the 20 September snapshot, exact submission metadata and any additional contribution or deployment records.
- Confirm the weekly journal drafts before treating them as actual meeting records.
- Supply the retrieval harness, raw calls, labels and configuration if available, especially to resolve chunk-versus-document scoring.
- Human answer assessment, absolute end-to-end latency, ingestion, recovery and conversation cost remain unverified against the original targets.

The Gantt charts distinguish planned phase windows, selected commit-author dates and PR merges. Spans between recorded changes do not measure continuous effort. The Phase 3 plan graphic conflicts with its prose/table milestone; the report documents use of the textual baseline. Benchmark strengths and remaining evaluation needs are both retained; the report does not describe the benchmark as “weak.”

## Presentation alignment revision — 21 September 2026

The narrative now centres on administrator-configured, document-grounded assistants with caller-aware specialist delegation. Provider management, interactive skills and operational tooling are explained as supporting that workflow. The literature distinguishes enterprise adoption routes from framework selection, and Results adds a claim-to-evidence matrix before the unchanged retrieval analysis. The presentation's proposed measurements are not reported as completed tests.

The revised report contains six figures and fifteen tables (twelve in the main body). Source review and editorial decisions are recorded in `KB/presentation-report-alignment.md`. The implementation cutoff remains 20 September; no new application test, deployment acceptance or benchmark is implied by the later editing date.

## Current typography and pagination — 21 September 2026

Times New Roman 11 pt body; 0.58 em leading and explicit 6 pt paragraph spacing; black headings and cover titles; 10 pt table text and captions. Within-chapter forced page breaks have been removed; chapter, appendix and weekly journal breaks remain. Current main body: **25 pages including visuals**; current prose-only diagnostic: **17 pages with chapter breaks retained**. These counts supersede earlier revision counts above. See `KB/prose-page-limit-check.md` and `output/pdf/report-prose-page-check.pdf`.
