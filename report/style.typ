#let navy = rgb("17384d")
#let report(body) = {
  set document(title: "NTG-agent-vnext: Capstone Final Report", author: ("QUOTA team",))
  set page(paper: "a4", margin: (x: 22mm, top: 21mm, bottom: 20mm), numbering: "1", header: align(right, text(font: "Liberation Sans", size: 8pt, fill: navy)[QUOTA · NTG-agent-vnext · Review draft]), footer: context align(center, text(size: 9pt, counter(page).display())))
  set text(font: "Liberation Serif", size: 11pt, lang: "en")
  set par(justify: true, leading: 0.58em)
  set heading(numbering: "1.1")
  show heading: set text(font: "Liberation Sans", fill: navy)
  show heading.where(level: 1): set text(size: 17pt)
  show heading.where(level: 2): set text(size: 12pt)
  set figure(gap: 7pt)
  show figure.caption: set text(size: 9pt)
  set table(inset: 6pt, stroke: 0.4pt + rgb("c5cdd3"))
  set bibliography(style: "ieee")
  body
}
#let fig(path, caption, width: 100%) = figure(image(path, width: width), caption: caption)
#let tab(columns, headers, cells, caption) = figure(
  {
    set par(justify: false)
    set text(size: 9pt)
    table(columns: columns, align: left, table.header(..headers.map(h => strong(h))), ..cells)
  },
  kind: table, caption: caption,
)
