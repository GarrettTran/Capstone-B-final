// Edit this week's metadata, discussion and actions below.
// Compile: typst compile report/meeting-minutes/week-03.typ output/pdf/meeting-minutes/week-03.pdf
#import "template.typ": journal, meeting
#let entry = (
    number: 3,
    title: "Phase 2 Planning and Integration Boundaries",
    phase: "Phase 2: product completeness",
    date: "20/07/2026",
    future: false,
    time: "10:00 AM (UTC+7; proposed slot)",
    attendees: "QUOTA (proposed): Khang, Tien, Chau, An. Nguyen Le Quynh Thien and Nguyen Sieu Anh (Industrial Supervisors; attendance confirmed by user).",
    apologies: "None proposed; verify with team",
    copy-to: "Proposed: team repository / shared drive; distribution unconfirmed.",
    validation: "Time and QUOTA attendance are draft allocations for review. Supervisor attendance is user-confirmed for past meetings; future attendance is expected.",
    discussions: (
      "Review the Phase 2 target of 26 August and identify outstanding skills, access-control, provider-discovery and client-integration work.",
      "Keep each agent's KB isolated while enabling authorised outer-to-inner delegation. This flow does not itself implement the completion plan's many-to-many agent/container mapping.",
      "Use role-based workstreams to coordinate integration, without assuming that a planned milestone proves release readiness.",
    ),
    actions: (
      (item: "Prepare the Phase 2 feature checklist with evidence links.", owner: "All members", due: "27/07/2026"),
      (item: "Document delegated KB access separately from storage sharing.", owner: "Chau, An", due: "27/07/2026"),
      (item: "Align skill and provider settings with agent configuration.", owner: "Tien, Khang", due: "27/07/2026"),
    ),
  )
#set document(title: "QUOTA - Capstone B Meeting 03", author: "QUOTA Team")
#show: journal
#meeting(entry)
