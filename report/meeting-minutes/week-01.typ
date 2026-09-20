// Edit this week's metadata, discussion and actions below.
// Compile: typst compile report/meeting-minutes/week-01.typ output/pdf/meeting-minutes/week-01.pdf
#import "template.typ": journal, meeting
#let entry = (
    number: 1,
    title: "Baseline Review and Responsibility Alignment",
    phase: "Baseline consolidation before Phase 2",
    date: "06/07/2026",
    future: false,
    time: "10:00 AM (UTC+7; proposed slot)",
    attendees: "QUOTA (proposed): Khang, Tien, Chau, An. Nguyen Le Quynh Thien and Nguyen Sieu Anh (Industrial Supervisors; attendance confirmed by user).",
    apologies: "None proposed; verify with team",
    copy-to: "Proposed: team repository / shared drive; distribution unconfirmed.",
    validation: "Time and QUOTA attendance are draft allocations for review. Supervisor attendance is user-confirmed for past meetings; future attendance is expected.",
    discussions: (
      "Review the existing NTG Agent platform and carry forward the revised scope from earlier work. Separate inherited capabilities from this semester's contributions.",
      "Use the reported workstreams: Chau and An on LightRAG, isolation and permissions; Tien on AG-UI and skills; Khang on agents-as-tools and provider integration.",
      "Prepare a weekly feature checklist. Exact completion dates and supporting contributions require team confirmation.",
    ),
    actions: (
      (item: "Map current features to the completion-plan scope.", owner: "All members", due: "13/07/2026"),
      (item: "Identify LightRAG and access-control work still required.", owner: "Chau, An", due: "13/07/2026"),
      (item: "Outline integration dependencies across agent tools and UI.", owner: "Khang, Tien", due: "13/07/2026"),
    ),
  )
#set document(title: "QUOTA - Capstone B Meeting 01", author: "QUOTA Team")
#show: journal
#meeting(entry)
