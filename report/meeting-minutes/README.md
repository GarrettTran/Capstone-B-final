# Weekly meeting journals

Edit `week-01.typ` through `week-12.typ` independently. Each contains its own meeting record. Edit `template.typ` for shared presentation.

From the repository root, build all twelve separate PDFs:

```sh
mkdir -p output/pdf/meeting-minutes
for week in report/meeting-minutes/week-*.typ; do
  typst compile "$week" "output/pdf/meeting-minutes/$(basename "$week" .typ).pdf"
done
```

Optional combined export (imports the same weekly records):

```sh
typst compile report/meeting-minutes.typ output/pdf/meeting-minutes.pdf
```

Dates, attendance and discussion placement remain provisional until team validation. Week 12 is a proposed agenda, as documented in `process.md`.
