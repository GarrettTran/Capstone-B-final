// Edit this week's metadata, discussion and actions below.
// Compile: typst compile report/meeting-minutes/week-12.typ output/pdf/meeting-minutes/week-12.pdf
#import "template.typ": journal, meeting
#let entry = (
    number: 12,
    title: "Final Report and Showcase Readiness",
    phase: "Phase 4: proposed pre-Showcase agenda",
    date: "21/09/2026",
    future: true,
    time: "2:00 PM (UTC+7; proposed slot)",
    attendees: "QUOTA (proposed): Khang, Tien, An. Nguyen Le Quynh Thien and Nguyen Sieu Anh (Industrial Supervisors; expected).",
    apologies: "Chau (proposed absence; verify with team)",
    copy-to: "Proposed: team repository / shared drive; distribution unconfirmed.",
    validation: "Time and QUOTA attendance are draft allocations for review. Supervisor attendance is user-confirmed for past meetings; future attendance is expected.",
    discussions: (
      "Proposed agenda: review the report against OENG1185 requirements, including fewer than 20 assessed pages and the stated exclusions.",
      "Proposed agenda: confirm implemented deliverables, unresolved limitations and the incomplete benchmark status. Do not state that all success criteria were met.",
      "Proposed agenda: validate the retrospective journals, rehearse the demonstration and confirm handover arrangements for the planned 22 September Showcase. No meeting outcome is recorded.",
    ),
    actions: (
      (item: "Confirm factual claims, page count and final PDF layout.", owner: "All members", due: "22/09/2026"),
      (item: "Correct journals and mark confirmed retrospective entries.", owner: "All members", due: "22/09/2026"),
      (item: "Confirm demonstration ownership and handover materials.", owner: "All members", due: "22/09/2026"),
    ),
  )
#set document(title: "QUOTA - Capstone B Meeting 12", author: "QUOTA Team")
#show: journal
#meeting(entry)
