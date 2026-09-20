// Edit this week's metadata, discussion and actions below.
// Compile: typst compile report/meeting-minutes/week-02.typ output/pdf/meeting-minutes/week-02.pdf
#import "template.typ": journal, meeting
#let entry = (
    number: 2,
    title: "Knowledge Isolation and Specialist-Agent Review",
    phase: "Baseline consolidation before Phase 2",
    date: "13/07/2026",
    future: false,
    time: "2:00 PM (UTC+7; proposed slot)",
    attendees: "QUOTA (proposed): Khang, Tien, Chau, An. Nguyen Le Quynh Thien and Nguyen Sieu Anh (Industrial Supervisors; attendance confirmed by user).",
    apologies: "None proposed; verify with team",
    copy-to: "Proposed: team repository / shared drive; distribution unconfirmed.",
    validation: "Time and QUOTA attendance are draft allocations for review. Supervisor attendance is user-confirmed for past meetings; future attendance is expected.",
    discussions: (
      "Review agent-level knowledge isolation using separate LightRAG instances instead of relying on document tags. The user confirms this architectural change; its discussion date remains unverified.",
      "Review the user-confirmed flow: with appropriate client permissions, the outer agent calls an inner agent as a tool. The inner agent queries its own KB and returns an answer.",
      "Stakeholder question for validation: how should the team balance stronger knowledge separation against instance management and infrastructure overhead? No mentor response is recorded.",
    ),
    actions: (
      (item: "Document the isolation boundary and instance lifecycle.", owner: "Chau, An", due: "20/07/2026"),
      (item: "Summarise the specialist invocation flow and its constraints.", owner: "Khang", due: "20/07/2026"),
      (item: "List UI events needed to expose agent activity.", owner: "Tien", due: "20/07/2026"),
    ),
  )
#set document(title: "QUOTA - Capstone B Meeting 02", author: "QUOTA Team")
#show: journal
#meeting(entry)
