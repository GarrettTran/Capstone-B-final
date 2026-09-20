// Optional combined export. Edit individual weeks in meeting-minutes/week-NN.typ.
#import "meeting-minutes/template.typ": journal, meeting
#import "meeting-minutes/week-01.typ": entry as week01
#import "meeting-minutes/week-02.typ": entry as week02
#import "meeting-minutes/week-03.typ": entry as week03
#import "meeting-minutes/week-04.typ": entry as week04
#import "meeting-minutes/week-05.typ": entry as week05
#import "meeting-minutes/week-06.typ": entry as week06
#import "meeting-minutes/week-07.typ": entry as week07
#import "meeting-minutes/week-08.typ": entry as week08
#import "meeting-minutes/week-09.typ": entry as week09
#import "meeting-minutes/week-10.typ": entry as week10
#import "meeting-minutes/week-11.typ": entry as week11
#import "meeting-minutes/week-12.typ": entry as week12
#set document(title: "QUOTA - Capstone B Weekly Meeting Drafts", author: "QUOTA Team")
#show: journal
#let meetings = (week01, week02, week03, week04, week05, week06, week07, week08, week09, week10, week11, week12,)
#for (index, entry) in meetings.enumerate() {
  if index > 0 { pagebreak() }
  meeting(entry)
}
