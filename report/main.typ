#import "style.typ": *
#show: report
#let draft-date = [20 September 2026]
#page(header: none, footer: none)[
  #align(center)[
    #v(18mm)
    #text(font: "Liberation Sans", size: 14pt, fill: navy)[RMIT UNIVERSITY]
    #v(18mm)
    #text(font: "Liberation Sans", size: 27pt, weight: "bold", fill: navy)[NTG-agent-vnext]
    #v(6mm)
    #text(size: 18pt)[Capstone Final Report]
    #v(3mm)
    #text(size: 13pt)[OENG1185 — Capstone Project B]
    #v(10mm)
    *QUOTA team · Industry partner: NashTech*
    #v(8mm)
    #table(columns: (1fr, auto), stroke: none, align: left,
      [Vu Gia An], [s3926888],
      [Nguyen Tien], [s3924427],
      [Tran Nguyen Quy Khang], [s3929513],
      [Nguyen Dinh Minh Chau], [s3923010],
    )
    #v(12mm)
    *Academic supervisor* \
    Tran Nhat Quang
    #v(5mm)
    *Industrial supervisors* \
    Nguyen Le Quynh Thien — Technical Manager \
    Nguyen Sieu Anh — Technical Architect
    #v(1fr)
    #text(size: 11pt)[Review draft · #draft-date]
    #v(3mm)
    #text(size: 9pt)[Evidence snapshot: 20 September 2026.]
  ]
]
#counter(page).update(1)
#set page(numbering: "i")
#outline(title: [Contents], depth: 2)
#pagebreak()
#outline(title: [List of Figures], target: figure.where(kind: image))
#v(12pt)
#outline(title: [List of Tables], target: figure.where(kind: table))
#pagebreak()
#set page(numbering: "1")
#counter(page).update(1)
#metadata("body-start") <body-start>
#include "sections/01-executive.typ"
#pagebreak()
#include "sections/02-background.typ"
#pagebreak()
#include "sections/03-literature.typ"
#pagebreak()
#include "sections/04-design.typ"
#pagebreak()
#include "sections/05-results.typ"
#pagebreak()
#include "sections/06-reflection.typ"
#metadata("body-end") <body-end>
#pagebreak()
#bibliography("references.bib", title: [References])
#pagebreak()
#include "sections/07-appendices.typ"
#pagebreak()
#heading(numbering: none)[Meeting journals]
The twelve weekly journal files are included below for team review. Their proposed scheduling and draft actions require confirmation; they are not used to establish measured performance, individual delivery dates, or sponsor acceptance. Each week remains independently editable in the accompanying source package. The final scheduled week falls after this report's evidence snapshot.
#import "meeting-minutes.typ": meetings
#import "meeting-minutes/template.typ": meeting
#for entry in meetings {
  pagebreak()
  set text(font: "Liberation Sans", size: 9pt)
  set par(justify: false, leading: 0.4em)
  meeting(entry)
}
