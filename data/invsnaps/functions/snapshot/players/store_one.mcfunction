#{Snapshots:[{SnapshotIndex:0,Players:[{Name:"230V",InventoryIndex:0}],Inventories:[[...],[...]]}]}
#define tag PlayerNameItem

execute as @s run loot spawn 0 -1 0 loot invsnaps:player_name
tag @e[type=item,x=0,y=-1,z=0,distance=..1,nbt={Item:{tag:{invsnapsPlayerNameItem:true}}}] add PlayerNameItem

#Set a Players entry
data modify storage invsnaps:player Snapshots[-1].Players append value {Name:"",InventoryIndex:-1}
data modify storage invsnaps:player Snapshots[-1].Players[-1].Name set from entity @e[tag=PlayerNameItem,limit=1] Item.tag.SkullOwner.Name
execute store result storage invsnaps:player Snapshots[-1].Players[-1].InventoryIndex int 1 run scoreboard players get $PlayerIndex invsnaps

#Copy @s.Inventory
data modify storage invsnaps:player Snapshots[-1].Inventories append from entity @s Inventory

kill @e[tag=PlayerNameItem]

scoreboard players add $PlayerIndex invsnaps 1
