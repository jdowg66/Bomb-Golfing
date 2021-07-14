/// @description Insert description here
// You can write your code in this editor
pal_swap_set(try_palates, oLevelRunner.palate, false)
if(chunk>= 20){
draw_self()
draw_sprite_ext(nova_your_blocks,-1,x-400,y-88,4,4,0,c_white,1)
draw_sprite_ext(phy_numbers,min(fBlocks,9),x-225,y-88,4,4,0,c_white,1)
draw_sprite_ext(nova_min_blocks,-1,x-400,y+100,4,4,0,c_white,1)
draw_sprite_ext(phy_numbers,oLevelRunner.clears[((oLevelRunner.levelX)), 2*oLevelRunner.levelY+1],x-225,y+100,4,4,0,c_white,1)
draw_sprite_ext(nova_your_bombs,-1,x+400,y-88,4,4,0,c_white,1)
draw_sprite_ext(phy_numbers,min(fBomb,9),x+560,y-88,4,4,0,c_white,1)
draw_sprite_ext(nova_min_bombs,-1,x+400,y+100,4,4,0,c_white,1)
draw_sprite_ext(phy_numbers,oLevelRunner.clears[((oLevelRunner.levelX)), 2*oLevelRunner.levelY],x+560,y+100,4,4,0,c_white,1)
for(j = 0; j < 5; j++){
	instance_create_depth(x+500,y-300,-1000,oPoof)	
	instance_create_depth(x+500,y,-1000,oPoof)
	instance_create_depth(x-500,y,-1000,oPoof)
		instance_create_depth(x,y-300,-1000,oPoof)
			instance_create_depth(x,y+300,-1000,oPoof)
	instance_create_depth(x-500,y-300,-1000,oPoof)	
	instance_create_depth(x+500,y+300,-1000,oPoof)	
	instance_create_depth(x-500,y+300,-1000,oPoof)	
}
}
pal_swap_reset()