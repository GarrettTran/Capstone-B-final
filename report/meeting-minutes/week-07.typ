// Edit this week's metadata, discussion and actions below.
// Compile: typst compile report/meeting-minutes/week-07.typ output/pdf/meeting-minutes/week-07.pdf
#import "template.typ": journal, meeting
#let entry = (
    number: 7,
    title: "Feature Integration and Operational Preparation",
    phase: "Phase 2 / Phase 3 overlap",
    date: "17/08/2026",
    future: false,
    time: "2:00 PM (UTC+7; proposed slot)",
    attendees: "QUOTA (proposed): Khang, Tien, Chau, An. Nguyen Le Quynh Thien and Nguyen Sieu Anh (Industrial Supervisors; attendance confirmed by user).",
    apologies: "None proposed; verify with team",
    copy-to: "Proposed: team repository / shared drive; distribution unconfirmed.",
    validation: "Time and QUOTA attendance are draft allocations for review. Supervisor attendance is user-confirmed for past meetings; future attendance is expected.",
    discussions: (
      "Review integration across knowledge isolation, specialist invocation, provider settings and skills before the feature-complete target.",
      "Review operational needs for the NashTech-supported LightRAG infrastructure and model deployments. Exact deployment identifiers and support dates still need confirmation.",
      "Prepare an evidence checklist for monitoring, health checks and handover. Operational readiness requires records beyond the existence of configuration files.",
    ),
    actions: (
      (item: "Review the LightRAG deployment and health-check notes.", owner: "Chau, An", due: "24/08/2026"),
      (item: "Check integration issues across providers, skills and UI.", owner: "Khang, Tien", due: "24/08/2026"),
      (item: "Collect reproducible setup and handover requirements.", owner: "All members", due: "24/08/2026"),
    ),
  )
#set document(title: "QUOTA - Capstone B Meeting 07", author: "QUOTA Team")
#show: journal
#meeting(entry)
