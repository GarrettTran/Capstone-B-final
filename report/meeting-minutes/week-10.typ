// Edit this week's metadata, discussion and actions below.
// Compile: typst compile report/meeting-minutes/week-10.typ output/pdf/meeting-minutes/week-10.pdf
#import "template.typ": journal, meeting
#let entry = (
    number: 10,
    title: "Evaluation Gap and Delivery Priorities",
    phase: "Phase 3 / Phase 4 overlap",
    date: "07/09/2026",
    future: false,
    time: "10:00 AM (UTC+7; proposed slot)",
    attendees: "QUOTA (proposed): Khang, Tien, An. Nguyen Le Quynh Thien and Nguyen Sieu Anh (Industrial Supervisors; attendance confirmed by user).",
    apologies: "Chau (proposed absence; verify with team)",
    copy-to: "Proposed: team repository / shared drive; distribution unconfirmed.",
    validation: "Time and QUOTA attendance are draft allocations for review. Supervisor attendance is user-confirmed for past meetings; future attendance is expected.",
    discussions: (
      "Review the planned 9 September production-readiness milestone and identify missing evidence. Its achievement has not been confirmed.",
      "The user later confirmed on 20 September that formal benchmarking and AI-output evaluation remained incomplete due to limited time to research the evaluation approach. Validate when this issue first arose.",
      "Proposed follow-up: prioritise accurate implementation evidence and document the evaluation gap. Do not replace measured findings with estimated scores or general demo impressions.",
    ),
    actions: (
      (item: "Record unresolved evaluation and operational evidence gaps.", owner: "All members", due: "14/09/2026"),
      (item: "Collect available functional examples without quality claims.", owner: "Tien, Khang", due: "14/09/2026"),
      (item: "Update infrastructure and handover limitations.", owner: "Chau, An", due: "14/09/2026"),
    ),
  )
#set document(title: "QUOTA - Capstone B Meeting 10", author: "QUOTA Team")
#show: journal
#meeting(entry)
