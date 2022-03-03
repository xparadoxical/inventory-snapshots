#define score_holder $AnySnapshotExists
#define score_holder $SnapshotIndex

#{Snapshots:[{SnapshotIndex:0,Players:[{Name:"230V",InventoryIndex:0}],Inventories:[[...],[...]]}]}

#Set SnapshotIndex to the SnapshotIndex of the last snapshot, or to 0
execute store success score $AnySnapshotExists invsnaps if data storage invsnaps:player Snapshots[-1]
scoreboard players set $SnapshotIndex invsnaps 0
execute if score $AnySnapshotExists invsnaps matches 1 store result score $SnapshotIndex invsnaps run data get storage invsnaps:player Snapshots[-1].SnapshotIndex
execute if score $AnySnapshotExists invsnaps matches 1 run scoreboard players add $SnapshotIndex invsnaps 1

#Prepare tag
data modify storage invsnaps:player Snapshots append value {SnapshotIndex:-1,Players:[],Inventories:[]}
execute store result storage invsnaps:player Snapshots[-1].SnapshotIndex int 1 run scoreboard players get $SnapshotIndex invsnaps

#Create a snapshot
#define score_holder $PlayerIndex
scoreboard players set $PlayerIndex invsnaps 0
execute as @a run function invsnaps:snapshot/players/store_one

#Reset clock
scoreboard players set $SaveTicksElapsed invsnaps 0
