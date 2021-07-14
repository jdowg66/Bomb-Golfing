/// @description Insert description here
// You can write your code in this editor
key_bug = keyboard_check_pressed(ord("F"))
if(key_bug){
	palate = (palate+1)% const
}
if(currRoom != room){
	bombs = 0
	blocks = 0
	if(room == DeathRoom){
		room = currRoom	
		oCamera.smooth = true
	}
	else{
		currRoom = room	
	}
}
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
sprite_index = layer_background_get_sprite(back_id)

