---

System Summary				Sat Apr 24 17:18:57 2010

FreeBSD 7.3-STABLE #0 r207062M Thu Apr 22 10:36:14 EDT 2010 root

Kernel Version:					703100 (osreldate)

Hardware Platform:				i386
Processor Architecture:				i386

17:18  up 1 day, 21:02, 4 users, load averages: 0.02, 0.16, 0.15

---


Physical Memory:				1009.91M
Page Size:					4096

Kernel Memory
TOTAL:						170.12M
DATA:					94.97%	161.56M
TEXT:					5.03%	8.56M

ARC Summary
> Storage pool Version:			13 (spa)
> Filesystem Version:			3 (zpl)
> Memory Throttle Count:			150

ARC Misc:
> Deleted:				1185413
> Recycle Misses:				740609
> Mutex Misses:				714
> Evict Skips:				714

ARC Size:
> Current Size:			29.91%	143.57M (arcsize)
> Target Size: (Adaptive)		35.84%	172.03M (c)
> Min Size (Hard Limit):		16.67%	80.00M (c\_min)
> Max Size (High Water):		~6:1	480.00M (c\_max)

ARC Size Breakdown:
> Recently Used Cache Size:	98.29%	169.09M (p)
> Frequently Used Cache Size:	1.71%	2.94M (c-p)

ARC Hash Breakdown:
> Elements Max:				369547
> Elements Current:		79.59%	294105
> Collisions:				1132167
> Chain Max:				44
> Chains:					16384

ARC Efficiency:
> Cache Access Total:			22086001
> Cache Hit Ratio:		93.10%	20560999
> Cache Miss Ratio:		6.90%	1525002
> Actual Hit Ratio:		76.28%	16847085

> Data Demand Efficiency:		94.24%
> Data Prefetch Efficiency:	76.70%

> CACHE HITS BY CACHE LIST:
> > Anonymous:			15.05%	3094008
> > Most Recently Used:		10.00%	2056771 (mru)
> > Most Frequently Used:		71.93%	14790314 (mfu)
> > Most Recently Used Ghost:	0.73%	150323 (mru\_ghost)
> > Most Frequently Used Ghost:	2.28%	469583 (mfu\_ghost)


> CACHE HITS BY DATA TYPE:
> > Demand Data:			17.44%	3586528
> > Prefetch Data:		0.40%	81644
> > Demand Metadata:		57.40%	11802490
> > Prefetch Metadata:		24.76%	5090337


> CACHE MISSES BY DATA TYPE:
> > Demand Data:			14.36%	219040
> > Prefetch Data:		1.63%	24803
> > Demand Metadata:		59.32%	904653
> > Prefetch Metadata:		24.69%	376506

L2 ARC Summary

> Low Memory Aborts:			3960
> Bad Checksums:				0
> IO Errors:				0
> R/W Clashes:				106
> Free on Write:				5714

L2 ARC Size:
> Current Size: (Adaptive)		2418.33M
> Header Size:			1.70%	41.19M

L2 ARC Evicts:
> Lock Retries:				0
> Upon Reading:				0

L2 ARC Breakdown:
> Access Total:				875020
> Hit Ratio:			99.99%	874914
> Miss Ratio:			0.01%	106
> Feeds:					157606

> WRITES:
> > Sent Total:				11365
> > Done Ratio:			100.00%	11365
> > Error Ratio:			0.00%	0

VDEV Cache Summary

> Access Total:				443239
> Hits Ratio:			74.78%	331437
> Miss Ratio:			25.22%	111802
> Delegations:				85760

ZFS Tunable (sysctl):
> kern.maxusers=512
> vfs.zfs.arc\_meta\_limit=125829120
> vfs.zfs.arc\_meta\_used=145044632
> vfs.zfs.mdcomp\_disable=0
> vfs.zfs.arc\_min=83886080
> vfs.zfs.arc\_max=503316480
> vfs.zfs.zfetch.array\_rd\_sz=1048576
> vfs.zfs.zfetch.block\_cap=256
> vfs.zfs.zfetch.min\_sec\_reap=2
> vfs.zfs.zfetch.max\_streams=8
> vfs.zfs.prefetch\_disable=0
> vfs.zfs.recover=0
> vfs.zfs.txg.synctime=5
> vfs.zfs.txg.timeout=30
> vfs.zfs.scrub\_limit=10
> vfs.zfs.vdev.cache.bshift=16
> vfs.zfs.vdev.cache.size=10485760
> vfs.zfs.vdev.cache.max=16384
> vfs.zfs.vdev.aggregation\_limit=131072
> vfs.zfs.vdev.ramp\_rate=2
> vfs.zfs.vdev.time\_shift=6
> vfs.zfs.vdev.min\_pending=4
> vfs.zfs.vdev.max\_pending=35
> vfs.zfs.cache\_flush\_disable=0
> vfs.zfs.zil\_disable=0
> vfs.zfs.version.zpl=3
> vfs.zfs.version.vdev\_boot=1
> vfs.zfs.version.spa=13
> vfs.zfs.version.dmu\_backup\_stream=1
> vfs.zfs.version.dmu\_backup\_header=2
> vfs.zfs.version.acl=1
> vfs.zfs.debug=0
> vfs.zfs.super\_owner=0
> vm.kmem\_size=536870912
> vm.kmem\_size\_scale=3
> vm.kmem\_size\_min=0
> vm.kmem\_size\_max=536870912

---
```