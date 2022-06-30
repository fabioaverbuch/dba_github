Check the asm disk labelling
#/etc/init.d/oracleasm querydisk /dev/sdn1
Device "/dev/sdn" is not marked as an ASM disk

Create asm disk
# /etc/init.d/oracleasm createdisk ARCDATA /dev/sdn1
Marking disk "ARCDATA" as an ASM disk: [ OK ]

Check the asm disk labelling
# /etc/init.d/oracleasm querydisk /dev/sdn1
Device "/dev/sdn1" is marked an ASM disk with the label "ARCDATA"

List the asm disks present
# /etc/init.d/oracleasm listdisks
ARCDATA
 
