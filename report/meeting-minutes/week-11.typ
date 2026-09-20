// Edit this week's metadata, discussion and actions below.
// Compile: typst compile report/meeting-minutes/week-11.typ output/pdf/meeting-minutes/week-11.pdf
#import "template.typ": journal, meeting
#let entry = (
    number: 11,
    title: "Report Evidence, Resources and Handover Review",
    phase: "Phase 4: documentation and polish",
    date: "14/09/2026",
    future: false,
    time: "2:00 PM (UTC+7; proposed slot)",
    attendees: "QUOTA (proposed): Khang, Tien, Chau. Nguyen Le Quynh Thien and Nguyen Sieu Anh (Industrial Supervisors; attendance confirmed by user).",
    apologies: "An (proposed absence; verify with team)",
    copy-to: "Proposed: team repository / shared drive; distribution unconfirmed.",
    validation: "Time and QUOTA attendance are draft allocations for review. Supervisor attendance is user-confirmed for past meetings; future attendance is expected.",
    discussions: (
      "Review feature evidence, member contributions and remaining handover notes. The report should explain both delivered capabilities and outstanding evaluation.",
      "The user later reported NashTech infrastructure/model support and US$300 of university Claude API support. Verify exact names and budget wording before final attribution.",
      "Use the setup-automation experience as a concrete reflection example. Any additional sponsor feedback or teamwork lessons must be confirmed rather than invented.",
    ),
    actions: (
      (item: "Review contribution mapping and reconstructed weekly records.", owner: "All members", due: "21/09/2026"),
      (item: "Verify infrastructure and model-support descriptions.", owner: "Chau, An, Khang", due: "21/09/2026"),
      (item: "Collect UI/skill evidence and refine the demonstration flow.", owner: "Tien", due: "21/09/2026"),
    ),
  )
#set document(title: "QUOTA - Capstone B Meeting 11", author: "QUOTA Team")
#show: journal
#meeting(entry)
