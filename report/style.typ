#let navy = rgb("17384d")
#let report(body) = {
  set document(title: "NTG-agent-vnext: Capstone Final Report", author: ("QUOTA team",))
  set page(paper: "a4", margin: (x: 22mm, top: 21mm, bottom: 20mm), numbering: "1", header: grid(columns: (auto, 1fr), align: (left + horizon, right + horizon), image("assets/rmit-logo.webp", width: 15mm), text(font: "Times New Roman", size: 8pt, fill: navy)[QUOTA · NTG-agent-vnext]), footer: context align(center, text(size: 9pt, counter(page).display())))
  set text(font: "Times New Roman", size: 11pt, lang: "en")
  set par(justify: true, leading: 0.58em, spacing: 6pt)
  set heading(numbering: "1.1")
  show heading: set text(font: "Times New Roman", fill: black)
  show heading.where(level: 1): set text(size: 17pt)
  show heading.where(level: 2): set text(size: 12pt)
  set figure(gap: 7pt)
  show figure.caption: set text(size: 10pt)
  set table(inset: 6pt, stroke: 0.4pt + rgb("c5cdd3"))
  set bibliography(style: "ieee")
  body
}
#let fig(path, caption, width: 100%) = figure(image(path, width: width), caption: caption)
#let tab(columns, headers, cells, caption) = figure(
  {
    set par(justify: false)
    set text(size: 10pt)
    table(columns: columns, align: left, table.header(..headers.map(h => strong(h))), ..cells)
  },
  kind: table, caption: caption,
)
