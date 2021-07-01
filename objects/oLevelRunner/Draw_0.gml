/// @description Insert description here
// You can write your code in this editor

pal_swap_set(try_palates, oLevelRunner.palate, false)
for(i = 0; i <= ceil( room_width / sprite_width) ; i++){
	for(j = 0; j <= ceil(room_height / sprite_height) ; j++){
		draw_sprite(sprite_index,-1,x+(i*sprite_width),y+(j*sprite_height))
	}
}
pal_swap_reset()