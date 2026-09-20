"""Derive feature evidence ranges from selected GitHub commits, with merge dates kept separate."""
from pathlib import Path
from datetime import datetime
from zoneinfo import ZoneInfo
import json, csv, os
import textwrap
os.environ.setdefault('MPLCONFIGDIR','/tmp/capstone-mpl')
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import matplotlib.dates as md
from matplotlib.transforms import blended_transform_factory
from matplotlib.lines import Line2D
from matplotlib.patches import Patch
ROOT=Path(__file__).resolve().parents[1]
H=json.loads((ROOT/'data/github-history.json').read_text())
PRS={p['number']:p for p in H['pull_requests']}
TZ=ZoneInfo('Asia/Ho_Chi_Minh')
def day(s):return datetime.fromisoformat(s.replace('Z','+00:00')).astimezone(TZ).date().isoformat()
# Curated mapping excludes inherited branch commits and generic synchronization commits.
# Multiple features may share a PR; these are workstreams, not additive effort measures.
specs=[
('F01','LightRAG + PostgreSQL','Chau',265,'f2d8460 8314d04 363f8c4 cb8a5cc','foundation'),
('F02','Per-agent containers / network','Chau',265,'cf83c4f dddff4b a24dd21 5b71881 c4863c7 50949fb 89da3ae','foundation'),
('F03','Document status / event worker','Chau',265,'7772810 c092db1 e6906dd 3e496ff c31f6b7 0869847','foundation'),
('F04','Idle-container shutdown','An',265,'7dedbbf','foundation'),
('F05','Agents-as-tools / bindings','Khang',261,'13cb1d8 c06666d 30c3661 4c37def f61ef29 d45c2a4 2d88bd7 29e86cc','foundation'),
('F06','AG-UI client / streaming','Tien',264,'0fa504e 2f8049b 5d8ff93 192bb62 ebd49d5 5ce9238 523252a d231286 2c7158e 97bd106 db4c0bc','foundation'),
('F07','Generative cards / A2UI','Tien',264,'06a1ad6 a2d769b 78fd9a4 8ce4c67 2819180','foundation'),
('F08','Retire legacy memory / search','Chau + Tien',265,'f7f465c 158f0ba 2a8a57f dfc9b80 c6d6e27','foundation'),
('F09','Role-gated agent access','An',277,'53de6aa 65eb1b9 2eecd6d','foundation'),
('F10','Initial model discovery','An',277,'c311d21','foundation'),
('F11','Provider routing / client factories','An',281,'2abee85 91db30f 5fc2acf','delivery'),
('F12','Secret scan / scanner repair','An',278,'b67c3c0 5093ffe 80a2b36','delivery'),
('F13','Provisioning state / readiness','Chau',282,'f9cb3b1 bdf8962 54b8ed9 4f2afd1 2cf61c9','delivery'),
('F14','VM migration / service structure','Chau + Sieu Anh',282,'e8e6f63 ef78a16 833d110 ff337fa cc284ab','delivery'),
('F15','Agent gateway / port-ledger removal','An',282,'9d5caf9 f201be5 90e6b06 6558f1c 4beaad9','delivery'),
('F16','Global providers / model catalogue','Khang',287,'f19a588 fecc71a aff8472 35d143a b3a89d7 370c1ec 8bf22b3 c4a5165 2e769f7','delivery'),
('F17','Live thinking compatibility probe','Khang',287,'7af467b','delivery'),
('F18','Skills storage / import / runtime','Tien',286,'2b61da8 6d32bce 6e51e1e 13279d0 418785b d33e8b6 292194b 8244027 382655d 24fd7bf ec65dda','delivery'),
('F19','Surface validation / UI hardening','Tien',286,'b2cc9c9 23bcf08 d534812 9563463 08c89f6 5c23c96 7c33c46 9e8ddfc f7f97a3 fa6b6d1 ec65dda','delivery'),
('F20','Installer / default-agent setup','An',285,'b17a2e4 869fa74 57a7638 490925e a2631fc 295c401 d953174 cc9cb6d 3966a78','delivery'),
('F21','macOS setup / showcase demo plan','Chau',285,'ee86b96 5fdc798 2e943d2','delivery'),
('F22','Dependency / integration maintenance','Sieu Anh',288,'0324b94 451b3b8 a75e580','delivery'),
]
features=[]
for fid,label,owner,n,prefixes,panel in specs:
 p=PRS[n];selected=[]
 for prefix in prefixes.split():
  matches=[c for c in p['commit_records'] if c['sha'].startswith(prefix)]
  assert len(matches)==1,(fid,prefix)
  selected.extend(matches)
 if fid=='F12': selected.extend(PRS[280]['commit_records'])
 dates=sorted({day(c['authored_at']) for c in selected})
 features.append(dict(id=fid,feature=label,contributors=owner,pr=n,additional_prs=[280] if fid=='F12' else [],panel=panel,first_recorded=dates[0],last_recorded=dates[-1],commit_dates=dates,merged=day(p['merged_at']),url=p['url'],selected_shas=[c['sha'] for c in selected],meaning='Range of selected commit author dates; not a continuous effort or completion interval.'))
manifest=dict(timezone='Asia/Ho_Chi_Minh',source='github-history.json',selection='Curated feature commits, excluding inherited PR ancestors unless directly relevant. Author date retained; committer date also stored in raw history. Merge marker is GitHub merged_at converted to UTC+7.',features=features,planned_phases=[dict(name='Phase 2',start='2026-07-20',end='2026-08-26'),dict(name='Phase 3',start='2026-08-17',end='2026-09-09'),dict(name='Phase 4',start='2026-09-07',end='2026-09-22')],baseline_conflict='Completion plan prose and milestone table specify Phase 3 ending 9 September; its embedded Gantt depicts a later endpoint. Charts use the explicit prose/table dates; task-bar endpoints are not silently reconstructed.')
(ROOT/'data/delivery-timeline.json').write_text(json.dumps(manifest,indent=2)+'\n')
with (ROOT/'data/github-pr-register.csv').open('w') as f:
 w=csv.writer(f);w.writerow(['pr','title','author','opened_utc7','merged_utc7','merged_by','merge_sha','url'])
 for p in PRS.values(): w.writerow([p['number'],p['title'],p['author'],day(p['created_at']),day(p['merged_at']),p['merged_by'],p['merge_commit_sha'],p['url']])
plt.rcParams.update({'font.family':'DejaVu Sans','font.size':8.4,'svg.fonttype':'path','axes.spines.top':False,'axes.spines.right':False,'axes.spines.left':False,'text.color':'#243746','savefig.facecolor':'white'})
colors={'An':'#99611C','Chau':'#286B52','Chau + Tien':'#286B52','Chau + Sieu Anh':'#286B52','Khang':'#176B87','Tien':'#725596','Sieu Anh':'#5B6570'}
for panel,start,end,height in [('foundation','2026-05-11','2026-07-29',5.5),('delivery','2026-07-06','2026-09-29',7.25)]:
 fs=[f for f in features if f['panel']==panel]
 offset=3 if panel=='delivery' else 0
 fig,ax=plt.subplots(figsize=(7.1,height));fig.subplots_adjust(left=.35,right=.925,top=.94,bottom=.145 if panel=='foundation' else .115)
 if offset:
  for i,p in enumerate(manifest['planned_phases']):
   a,b=[md.datestr2num(p[k]) for k in ['start','end']]
   ax.barh(i,b-a,left=a,height=.4,color='#e9edf0',edgecolor='#89959d',hatch='///',linewidth=.4)
   ax.plot(b,i,marker='D',mfc='white',mec='#536775',ms=4)
   ax.text(1.015,i,datetime.fromisoformat(p['end']).strftime('%d %b'),transform=ax.get_yaxis_transform(),va='center',fontsize=8)
  ax.axhline(2.6,color='#aab5bd',lw=.7)
 for i,f in enumerate(fs,offset):
  if i%2==0: ax.axhspan(i-.47,i+.47,color='#f3f6f8',zorder=0)
  a,b,m=[md.datestr2num(f[k]) for k in ['first_recorded','last_recorded','merged']]
  c=colors[f['contributors']]
  if a!=b: ax.barh(i,b-a,left=a,height=.34,color=c,alpha=.7,zorder=2)
  ax.scatter([md.datestr2num(d) for d in f['commit_dates']],[i]*len(f['commit_dates']),s=13,c=c,zorder=3)
  ax.plot([b,m],[i,i],ls=':',lw=1.1,color=c,zorder=2)
  ax.plot(m,i,marker='D',ms=5,color=c,zorder=4)
  ax.text(1.015,i,datetime.fromisoformat(f['merged']).strftime('%d %b'),transform=ax.get_yaxis_transform(),va='center',fontsize=8)
 labels=([p['name']+' · planned baseline' for p in manifest['planned_phases']] if offset else [])+[textwrap.fill(f"{f['id']}  {f['feature']}", width=29, break_long_words=False, break_on_hyphens=False)+f"\n{f['contributors']} · PR {f['pr']}"+(' / 280' if f['id']=='F12' else '') for f in fs]
 ax.set(yticks=range(len(labels)),yticklabels=[],xlim=(md.datestr2num(start),md.datestr2num(end)),ylim=(len(labels)-.4,-.65))
 ax.tick_params(axis='y',length=0)
 # Fixed, inset label column keeps all rows inside the page margin and frees timeline width.
 label_transform=blended_transform_factory(fig.transFigure, ax.transData)
 for row,label in enumerate(labels):
  ax.text(.025,row,label,transform=label_transform,ha='left',va='center',fontsize=8.2,linespacing=1.13,clip_on=False)
 ax.xaxis.set_major_locator(md.WeekdayLocator(byweekday=md.MO,interval=2));ax.xaxis.set_major_formatter(md.DateFormatter('%d %b'))
 ax.xaxis.set_minor_locator(md.WeekdayLocator(byweekday=md.MO));ax.tick_params(axis='x',labelsize=8)
 ax.grid(axis='x',which='major',color='#d7dfe4',lw=.6);ax.grid(axis='x',which='minor',color='#e8edf0',lw=.4);ax.set_axisbelow(True)
 ax.text(1.015,1.025,'Merge /\ndue',transform=ax.transAxes,fontsize=7.4,ha='left')
 ax.set_title('2026 · recorded changes and integration',fontsize=8.5,loc='left',pad=10)
 legend=[Line2D([0],[0],color='#47677b',lw=5,alpha=.7,label='Selected change-date span'),Line2D([0],[0],marker='.',color='none',mfc='#47677b',mec='#47677b',label='Recorded change date'),Line2D([0],[0],marker='D',color='none',mfc='#47677b',mec='#47677b',ms=4,label='Merged to main'),Line2D([0],[0],color='#47677b',ls=':',label='Gap to integration')]
 if offset:legend.append(Patch(facecolor='#e9edf0',edgecolor='#89959d',hatch='///',label='Planned phase; hollow diamond = due'))
 fig.legend(handles=legend,loc='lower center',ncol=2,fontsize=7.4,frameon=False,bbox_to_anchor=(.5,.012))
 name='delivery-gantt-foundations' if panel=='foundation' else 'delivery-gantt'
 fig.savefig(ROOT/'assets'/f'{name}.svg');fig.savefig('/tmp/'+name+'.png',dpi=180);plt.close(fig)
# Stable textual register is generated from the same data as the plots.
lines=['// Generated by build-delivery-timeline.py. Edit the evidence JSON or feature mapping instead.','#let pr-rows = (']
for p in PRS.values():
 lines.append(f'  [#link("{p["url"]}")[PR {p["number"]}]], [{p["author"]}], [{day(p["created_at"])[5:]}], [{day(p["merged_at"])[5:]}], [#raw("{p["merge_commit_sha"][:7]}")],')
lines.append(')')
(ROOT/'sections/github-register.typ').write_text('\n'.join(lines)+'\n')
print(f'Built {len(features)} feature rows from {len(PRS)} PRs; times converted to UTC+7.')
