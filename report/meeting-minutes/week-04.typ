// Edit this week's metadata, discussion and actions below.
// Compile: typst compile report/meeting-minutes/week-04.typ output/pdf/meeting-minutes/week-04.pdf
#import "template.typ": journal, meeting
#let entry = (
    number: 4,
    title: "Document Lifecycle and Access Control",
    phase: "Phase 2: knowledge and permissions",
    date: "27/07/2026",
    future: false,
    time: "10:00 AM (UTC+7; proposed slot)",
    attendees: "QUOTA (proposed): Khang, Tien, Chau, An. Nguyen Le Quynh Thien and Nguyen Sieu Anh (Industrial Supervisors; attendance confirmed by user).",
    apologies: "None proposed; verify with team",
    copy-to: "Proposed: team repository / shared drive; distribution unconfirmed.",
    validation: "Time and QUOTA attendance are draft allocations for review. Supervisor attendance is user-confirmed for past meetings; future attendance is expected.",
    discussions: (
      "Review how document upload, ingestion status and removal relate to the correct agent knowledge base.",
      "Review permission boundaries for administrative actions and user access. Keep access control distinct from physical knowledge-store separation.",
      "Prepare functional examples for authorised access and attempted cross-agent access. These are proposed checks, not recorded passing results.",
    ),
    actions: (
      (item: "Review document lifecycle behaviour and record open issues.", owner: "Chau, An", due: "03/08/2026"),
      (item: "Trace access checks to the relevant application paths.", owner: "Chau, An", due: "03/08/2026"),
      (item: "Coordinate permission behaviour with the client workflow.", owner: "Tien, Khang", due: "03/08/2026"),
    ),
  )
#set document(title: "QUOTA - Capstone B Meeting 04", author: "QUOTA Team")
#show: journal
#meeting(entry)
