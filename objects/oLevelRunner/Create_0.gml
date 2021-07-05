/// @description Insert description here
// You can write your code in this editor
x = 0
y = 0
currRoom = room
pal_swap_init_system(shd_pal_swapper,shd_pal_html_sprite,shd_pal_html_surface);
palate = 0
const = 7
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
sprite_index = layer_background_get_sprite(back_id)
pars = [[-1,0,1,-1,-1,-1],
		[2,3,-1,-1,0,-1],
		[-1,-1,-1,-1,-1,-1]]