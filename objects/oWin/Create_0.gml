/// @description Insert description here
// You can write your code in this editor
if(instance_number(oWin) > 1){
	show_debug_message("poof")
	instance_destroy()	
}
fBomb = oLevelRunner.bombs
fBlocks = oLevelRunner.blocks
fScore = 0
x = 640
y = 360
stay = true
chunk = 0
show_debug_message("bitch made")