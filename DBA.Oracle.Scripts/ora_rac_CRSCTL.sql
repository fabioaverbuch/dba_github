1. STOP & START CRS: ( run from root user)
$GRID_HOME/bin/crsctl stop crs
$GRID_HOME/bin/crsctl start crs

2. Enable/Disable auto restart of CRS.
$GRID_HOME/bin/crsctl disable crs
$GRID_HOME/bin/crsctl enable crs

3. Find the cluster name
$GRID_HOME/bin/cemutlo -n
$GRID_HOME/bin/olsnodes -c

4. Find grid version:
$GRID_HOME/bin/crsctl query crs softwareversion host-dbaclass1

5. check cluster component status
$GRID_HOME/bin/crsctl stat res -t
$GRID_HOME/bin/crsctl check crs
$GRID_HOME/bin/crsctl check cssd
$GRID_HOME/bin/crsctl check crsd
$GRID_HOME/bin/crsctl check evmd

6. Find voting disk location
$GRID_HOME/bin/crsctl query css votedisk

7. Find OCR location:
$GRID_HOME/bin/ocrcheck

8. Find cluster interconnect details
$GRID_HOME/bin/oifcfg getif

9. Check CRS status of local node 
crsctl check crs

10. Check status of all crs resourcs
$GRID_HOME/bin/crsctl stat res -t
$GRID_HOME/bin/crsctl stat res -t -init

10. Check active version of cluster
crsctl query crs activeversion

11. Stop and start high availability service ( HAS)
crsctl stop has
crsctl start has

12. Check CRS status of remote nodes
crsctl check cluster
crsctl check cluster -all

13. Disk timeout from node to voting disk(disktimeout)
crsctl get css disktimeout

14. Network latency in the node interconnect (Misscount)
crsctl get css misscount

15. Move voting disk to another diskgroup:
crsctl replace votedisk +OCRVD

16. Add another voting disk:
crsctl add css votedisk 

17. Delete voting disk:
crsctl delete css votedisk 

18 . Get ocr disk backup details
ocrconfig -showbackup

19 . Check whether standard or flex ASM
crsctl get cluster mode status
Cluster is running in "standard" mode

20 . Check CRS configuation
crsctl config crs 

21 . Find cluster configuration information:
crsctl get cluster configuration

21 . Find node roles in cluster
crsctl get node role status -all

22. crsctl has commands for standalone grid infrastrcuture
crsctl check has
crsctl config has
crsctl disable has
crsctl enable has
crsctl query has releaseversion
crsctl query has softwareversion
crsctl start has
crsctl stop has

 
