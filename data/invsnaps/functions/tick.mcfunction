execute unless score $SavePeriod invsnaps matches ..-1 run scoreboard players add $SaveTicksElapsed invsnaps 1
execute unless score $SavePeriod invsnaps matches ..-1 if score $SaveTicksElapsed invsnaps >= $SavePeriod invsnaps run function invsnaps:snapshot/players/new
