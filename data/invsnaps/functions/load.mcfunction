#define storage invsnaps:player Player inventory snapshots
#define score_holder $SaveTicksElapsed
#define score_holder $SavePeriod

scoreboard objectives add invsnaps dummy
execute unless score $SavePeriod invsnaps matches -1.. run scoreboard players set $SavePeriod invsnaps -1
execute unless data storage invsnaps:player Snapshots run data modify storage invsnaps:player Snapshots set value []

tellraw @a ["", {"text": "inventory-snapshots has been loaded", "color": "green"}, ". Set the timer by using ", {"text": "/scoreboard players set $SavePeriod invsnaps <ticks>", "color": "gold", "underlined": true, "clickEvent": {"action": "suggest_command", "value": "/scoreboard players set $SavePeriod invsnaps "}}, ". Set the timer period to -1 to pause it. To uninstall, use ", {"text": "/function invsnaps:uninstall", "color": "red", "underlined": true, "clickEvent": {"action": "suggest_command", "value": "/function invsnaps:uninstall"}}, ", then ", {"text": "/datapack disable \"file/inventory-snapshots\"","color": "red", "underlined": true, "clickEvent": {"action": "suggest_command", "value": "/datapack disable \"file/inventory-snapshots\""}}, "."]
