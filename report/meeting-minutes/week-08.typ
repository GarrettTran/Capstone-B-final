// Edit this week's metadata, discussion and actions below.
// Compile: typst compile report/meeting-minutes/week-08.typ output/pdf/meeting-minutes/week-08.pdf
#import "template.typ": journal, meeting
#let entry = (
    number: 8,
    title: "Feature-Complete Milestone Review",
    phase: "Phase 2 milestone: 26 August (planned)",
    date: "24/08/2026",
    future: false,
    time: "2:00 PM (UTC+7; proposed slot)",
    attendees: "QUOTA (proposed): Khang, Tien, Chau, An. Nguyen Le Quynh Thien and Nguyen Sieu Anh (Industrial Supervisors; attendance confirmed by user).",
    apologies: "None proposed; verify with team",
    copy-to: "Proposed: team repository / shared drive; distribution unconfirmed.",
    validation: "Time and QUOTA attendance are draft allocations for review. Supervisor attendance is user-confirmed for past meetings; future attendance is expected.",
    discussions: (
      "Review the planned 26 August milestone against the actual feature checklist. Keep unfinished items visible rather than marking the milestone complete by date alone.",
      "Check skill, access-control and provider-discovery integration. Verify delegated KB access, the planned storage mapping and TTFT instrumentation against code evidence.",
      "Reserve benchmark and quality claims for recorded measurements. This draft does not establish a release, passing test run or sponsor acceptance.",
    ),
    actions: (
      (item: "Record implemented, incomplete and deferred deliverables.", owner: "All members", due: "31/08/2026"),
      (item: "Confirm the final knowledge mapping and permission scope.", owner: "Chau, An", due: "31/08/2026"),
      (item: "Collect provider and skill demonstration evidence.", owner: "Khang, Tien", due: "31/08/2026"),
    ),
  )
#set document(title: "QUOTA - Capstone B Meeting 08", author: "QUOTA Team")
#show: journal
#meeting(entry)
