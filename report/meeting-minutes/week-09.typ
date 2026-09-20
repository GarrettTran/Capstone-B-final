// Edit this week's metadata, discussion and actions below.
// Compile: typst compile report/meeting-minutes/week-09.typ output/pdf/meeting-minutes/week-09.pdf
#import "template.typ": journal, meeting
#let entry = (
    number: 9,
    title: "Local Setup Automation and Developer Onboarding",
    phase: "Phase 3: operational preparation",
    date: "31/08/2026",
    future: false,
    time: "10:00 AM (UTC+7; proposed slot)",
    attendees: "QUOTA (proposed): Khang, Tien, Chau. Nguyen Le Quynh Thien and Nguyen Sieu Anh (Industrial Supervisors; attendance confirmed by user).",
    apologies: "An (proposed absence; verify with team)",
    copy-to: "Proposed: team repository / shared drive; distribution unconfirmed.",
    validation: "Time and QUOTA attendance are draft allocations for review. Supervisor attendance is user-confirmed for past meetings; future attendance is expected.",
    discussions: (
      "Review the user-reported friction in local installation and configuration. The team introduced an automation script to simplify setup for future developers.",
      "Review prompts for required API and environment inputs, with defaults for non-sensitive internal settings. Keep credentials out of source and report examples.",
      "Record the expected onboarding benefit without inventing a measured time saving. Script ownership, delivery date and any fresh-machine checks require confirmation.",
    ),
    actions: (
      (item: "Review setup prompts, defaults and documentation.", owner: "All members", due: "07/09/2026"),
      (item: "Identify the script author and supporting contributors.", owner: "All members", due: "07/09/2026"),
      (item: "List prerequisites and unresolved onboarding issues.", owner: "All members", due: "07/09/2026"),
    ),
  )
#set document(title: "QUOTA - Capstone B Meeting 09", author: "QUOTA Team")
#show: journal
#meeting(entry)
