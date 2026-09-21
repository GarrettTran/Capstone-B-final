// Shared presentation for all weekly journals. Edit weekly content in week-NN.typ.
#let ink = rgb("263442")
// Keep row and internal column rules without vertical rails at the page margins.
#let journal-stroke(x, y) = (
  top: 0.5pt + rgb("777777"),
  bottom: 0.5pt + rgb("777777"),
  left: if x == 0 { none } else { 0.5pt + rgb("777777") },
  right: none,
)
#let section(title) = block(above: 10pt, below: 5pt)[#text(size: 11pt, weight: "bold", fill: ink, title)]
#let meeting(m) = {
  align(center)[
    #text(size: 10pt, weight: "bold")[RMIT UNIVERSITY / QUOTA TEAM]
    #v(4pt)
    #text(size: 16pt, weight: "bold", fill: ink)[#m.title]
    #v(4pt)
    #text(size: 10pt)[Capstone Project B - Meeting No. #m.number / Week #m.number]
    #linebreak()
    #text(size: 8.5pt, fill: rgb("555555"))[NTG-agent-vnext | #m.phase]
  ]
  v(9pt)
  section("Meeting Details")
  table(columns: (25mm, 1fr), inset: 6pt, stroke: journal-stroke, fill: rgb("f6f7f9"),
    [*Date:*], [#m.date #if m.future { [(proposed)] } else { [(proposed weekly slot)] }],
    [*Time:*], m.time,
    [*Attendees:*], m.attendees,
    [*Apologies:*], m.apologies,
    [*Copy To:*], m.copy-to,
  )
  section("Information / Decision")
  table(columns: (16mm, 1fr), inset: 6pt, stroke: journal-stroke,
    table.header([*Item No.*], [*Discussion Summary (draft wording)*]),
    ..m.discussions.enumerate().map(((i, item)) => (str(i + 1), item)).flatten(),
  )
  section("Action Items")
  text(size: 8pt, fill: rgb("555555"))[Suggested follow-ups, owners and due dates; completion is not recorded.]
  v(4pt)
  table(columns: (12mm, 1fr, 27mm, 23mm), inset: 5pt, stroke: journal-stroke,
    table.header([*No.*], [*Item*], [*Who*], [*By*]),
    ..m.actions.enumerate().map(((i, a)) => (
      str(m.number) + "." + str(i + 1), a.item, a.owner, a.due,
    )).flatten(),
  )
  v(8pt)
  text(size: 8pt, fill: rgb("555555"))[*Validation:* #m.validation]
}


#let journal(body) = {
  set page(paper: "a4", margin: (top: 16mm, bottom: 17mm, x: 20mm),
    header: align(center, text(size: 8pt, fill: rgb("666666"))[QUOTA / OENG1185 / WORKING JOURNAL]),
    footer: [
      #line(length: 100%, stroke: 1pt + rgb("773333"))
      #v(2pt)
      #grid(columns: (1fr, auto), text(size: 8pt)[Meeting Journal - Review Draft],
        context text(size: 8pt)[Page #counter(page).display("1")])
    ])
  set text(font: "Liberation Sans", size: 9.5pt, lang: "en")
  set par(leading: 0.5em)
  body
}
