
pal_swap_set(try_palates, oLevelRunner.palate, false)

draw_sprite_ext(nova_lazer,-1,x,y,1,1,image_angle,c_white,1)
for( i = 1; i < scale - 1; i++){
	if(image_angle % 180 == 0){
		//show_debug_message(string(x) + "  " + string(x + dir*i*width))
	draw_sprite_ext(nova_beam,-1,(x + dir*i*width) ,y,1,1,image_angle,c_white,1) 
	//draw_sprite(lazer,1,(x + dir*i*width) ,y) 
	}
	else{
		draw_sprite_ext(nova_beam,-1,x, (dir*i*width)+ y,1,1,image_angle,c_white,1) 	
	}
}
/// @description Insert description here
// You can write your code in this editor
pal_swap_reset()