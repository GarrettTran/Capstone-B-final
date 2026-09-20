"""Rebuild vector report assets from attributed summaries; no raw benchmark inference."""
from pathlib import Path
from datetime import date
import json, os
os.environ.setdefault('MPLCONFIGDIR', '/tmp/capstone-mpl')
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import matplotlib.dates as md
from matplotlib.patches import FancyBboxPatch
import numpy as np
ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'assets'; OUT.mkdir(exist_ok=True)
D=json.loads((ROOT/'data/retrieval-summary.json').read_text())
plt.rcParams.update({'font.family':'DejaVu Sans','font.size':10,'axes.spines.top':False,'axes.spines.right':False,'svg.fonttype':'path','axes.labelcolor':'#243746','text.color':'#243746','savefig.facecolor':'white'})
colors=['#176B87','#B86518','#695293','#26734D']
def save(fig,name):
 fig.savefig(OUT/(name+'.svg'));plt.close(fig)
# Paired plots: all modes, both cutoffs, common limits, explicit trial size.
fig,axs=plt.subplots(1,2,figsize=(9,3.15),layout='constrained')
x=np.arange(4)
for ax,tr in zip(axs,D['trials'][:2]):
 for offset,key,label,col,hat in [(-.18,'hit1','Hit-rate@1',colors[0],None),(.18,'hit5','Hit-rate@5',colors[3],'//')]:
  bars=ax.bar(x+offset,tr[key],.34,label=label,color=col,hatch=hat,edgecolor='white')
  ax.bar_label(bars,labels=[f'{v:.3f}' for v in tr[key]],fontsize=8,padding=3)
 ax.axhline(.8,color='#555555',ls='--',lw=1,label='Planned @5 target')
 ax.set(xticks=x,xticklabels=D['modes'],ylim=(0,1.15),yticks=[0,.25,.5,.75,1],ylabel='Share of queries',title=f"{tr['name']} / {tr['n']} queries / cold cache")
 ax.grid(axis='y',alpha=.15);ax.set_axisbelow(True)
axs[0].legend(loc='lower left',fontsize=8,framealpha=.95)
save(fig,'retrieval-hit-rates')
fig,ax=plt.subplots(figsize=(8.8,3.1),layout='constrained')
for off,tr,c,h in [(-.18,D['trials'][1],colors[0],None),(.18,D['trials'][2],colors[1],'//')]:
 bars=ax.bar(x+off,tr['retrieval_ratio'],.34,color=c,hatch=h,edgecolor='white',label=tr['name']+' / '+tr['cache']+' cache')
 ax.bar_label(bars,labels=[f'{v:.1f}x' for v in tr['retrieval_ratio']],padding=3)
ax.set(xticks=x,xticklabels=D['modes'],ylim=(0,4.7),ylabel='Median retrieval time / naive in same trial')
ax.axhline(1,color='#777777',ls='--',lw=.8);ax.legend(frameon=False,loc='upper left');ax.grid(axis='y',alpha=.15);ax.set_axisbelow(True)
save(fig,'retrieval-latency-ratios')
# Feature-level timelines derive from preserved GitHub records and selected commit mappings.
import runpy
runpy.run_path(str(ROOT/'scripts/build-delivery-timeline.py'), run_name='__main__')
# Code-native diagram sources live here, not screenshots.
def canvas(size):
 fig,ax=plt.subplots(figsize=size);ax.set(xlim=(0,10),ylim=(0,7));ax.axis('off');fig.subplots_adjust(left=.01,right=.99,top=.98,bottom=.02);return fig,ax
def box(ax,x,y,w,h,t,fill='#EFF5F7',fs=10):
 ax.add_patch(FancyBboxPatch((x,y),w,h,boxstyle='round,pad=0.04,rounding_size=0.08',facecolor=fill,edgecolor='#526574',lw=1))
 ax.text(x+w/2,y+h/2,t,ha='center',va='center',fontsize=fs)
def arrow(ax,a,b,label='',dashed=False):
 ax.annotate('',xy=b,xytext=a,arrowprops={'arrowstyle':'->','color':'#526574','lw':1.3,'linestyle':'--' if dashed else '-'})
 if label:ax.text((a[0]+b[0])/2+.08,(a[1]+b[1])/2+.10,label,fontsize=8,ha='left',bbox={'facecolor':'white','edgecolor':'none','pad':1})
fig,ax=canvas((9,5.3))
box(ax,.15,5.6,2.8,1,'Administration\nBlazor: agents, roles, skills')
box(ax,3.6,5.6,2.8,1,'User interfaces\nBlazor / Next.js + AG-UI')
box(ax,7.05,5.6,2.8,1,'Model providers\nDiscovery and capability probe')
box(ax,1.5,3.6,6.8,1.1,'Orchestrator / Microsoft Agent Framework\nAccess checks · conversations · tools · skills · streaming',fill='#DCEBF1')
arrow(ax,(1.55,5.6),(2.4,4.7));arrow(ax,(5,5.6),(5,4.7));arrow(ax,(7.7,4.7),(8.45,5.6))
box(ax,.15,1.9,2.5,.95,'SQL Server\nIdentity and application data')
box(ax,3.1,1.9,3.45,.95,'LightRAG gateway\nAgent ID selects container')
box(ax,7.05,1.9,2.8,.95,'Tools / MCP\nExternal capabilities')
arrow(ax,(2.4,3.6),(1.4,2.85));arrow(ax,(5,3.6),(4.8,2.85));arrow(ax,(7.5,3.6),(8.4,2.85))
box(ax,2.5,.55,2.05,.8,'LightRAG A\nWorkspace A',fs=9);box(ax,5.15,.55,2.05,.8,'LightRAG B\nWorkspace B',fs=9)
arrow(ax,(4.2,1.9),(3.5,1.35));arrow(ax,(5.5,1.9),(6.15,1.35))
ax.text(4.85,.05,'Shared PostgreSQL service; workspace-scoped knowledge storage',ha='center',fontsize=9)
save(fig,'system-architecture')
# Sequence diagram: every message starts and ends on the appropriate participant lifeline.
fig,ax=plt.subplots(figsize=(9,4.5))
ax.set(xlim=(0,10),ylim=(0,8));ax.axis('off')
fig.subplots_adjust(left=.015,right=.985,top=.98,bottom=.02)
participants=[(1.15,'Client'),(3.65,'Outer agent'),(6.15,'Inner agent'),(8.65,'Inner KB / LightRAG')]
for x,label in participants:
 box(ax,x-1.02,6.95,2.04,.7,label,fs=10)
 ax.plot([x,x],[1.05,6.9],color='#9BAAB3',ls=(0,(3,3)),lw=1,zorder=0)
steps=[
 (1.15,3.65,6.25,'1. Request + user identity',False),
 (3.65,6.15,5.30,'2. Invoke authorised tool',False),
 (6.15,8.65,4.35,'3. Query own knowledge',False),
 (8.65,6.15,3.40,'4. Retrieved context',True),
 (6.15,3.65,2.45,'5. Inner agent answer',True),
 (3.65,1.15,1.50,'6. Synthesised response',True),
]
for start,end,y,label,response in steps:
 ax.annotate('',xy=(end,y),xytext=(start,y),arrowprops={'arrowstyle':'->','color':'#176B87' if not response else '#526574','lw':1.5,'linestyle':'--' if response else '-', 'shrinkA':0,'shrinkB':0})
 ax.text((start+end)/2,y+.15,label,ha='center',va='bottom',fontsize=9,bbox={'facecolor':'white','edgecolor':'none','pad':1})
ax.text(5,.52,'Access checked before tool exposure and again at invocation.',ha='center',fontsize=9)
ax.text(5,.15,'The outer agent accesses the inner KB only through the authorised inner agent.',ha='center',fontsize=9)
save(fig,'delegated-knowledge')
(OUT/'provenance.json').write_text(json.dumps({'charts':D['source'],'gantt':'github-history.json and delivery-timeline.json; 12 PRs, selected feature commits, UTC+7; Completion Plan pp. 8-10 textual baseline with visual discrepancy documented','architecture':'AgentFactory, AgentToolPlugin, LightRagClientFactory, LightRagContainerManager, project docs; see KB/report-evidence.md','matplotlib':matplotlib.__version__,'note':'Commit-date spans are not continuous labour intervals; merge dates are not deployment acceptance. SVG text converted to paths for portable rendering.'},indent=2))
print('Generated 6 SVG figures and provenance manifest.')
