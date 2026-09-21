# Prose page-limit check — 21 September 2026

The user reconfirmed a 20-page prose limit. `process.md`, Section 1, excludes cover, contents, references, figures, tables, appendices and journals and records the stricter wording “fewer than 20 pages”. Both interpretations are satisfied.

The current `report/main.typ` body spans 27 pages including visuals. Temporary copies were compiled with the existing A4 style, Liberation Serif 11 pt, unchanged margins and paragraph leading. Figures and tables, including captions, were hidden in zero-height boxes, retaining reference resolution. Explicit page breaks within sections were removed to allow prose to reflow after excluding visuals. All six sections and their prose were retained.

- Preserving page breaks between main sections: **17 pages**.
- Also removing inter-section page breaks: **15 pages**.
- Section starts in the 17-page version: Executive summary 1; Background 2; Literature 5; Solution design 9; Results 14; Reflection 17.

Diagnostic artifact: `output/pdf/report-prose-page-check.pdf` (17 body-only pages). This is a repaginated check, not the submission layout. Original report sources and PDF were preserved. Typst 0.15.1 compiled both variants without warnings; body markers and headings were queried and a representative page was visually inspected. No application validation was performed.

## Times New Roman recheck — 21 September 2026

After the requested font change, the same check preserving chapter breaks produces **18 prose pages**, replacing the earlier 17-page result. The full main body remains 27 pages including visuals. `output/pdf/report-prose-page-check.pdf` now contains the 18-page Times New Roman diagnostic. The continuous-flow variant was not remeasured; its earlier 15-page result applies to Liberation Serif only.

## Layout refinement recheck — 21 September 2026

After the approved layout changes (black headings, 10 pt tables/captions, explicit 6 pt paragraph spacing and removal of within-chapter forced breaks), the latest prose-only check is **17 pages**, preserving chapter breaks. The full body is **25 pages** including figures and tables. The diagnostic PDF was rebuilt accordingly; this supersedes the 18-page intermediate Times New Roman result. Body prose and assessment exclusions are unchanged.
