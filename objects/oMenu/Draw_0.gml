/// @description Insert description here
// You can write your code in this editor
pal_swap_set(try_palates, oLevelRunner.palate, false)
for(j = 0; j < array_height_2d(levels); j++){
	for(i = 0; i < array_length_2d(levels,j); i++){
		if(oLevelRunner.pars[j,i] <0){
			draw_sprite(nova_levels2, 1,100+x+200*i, 100+y+200*j)
		}
		else{
			draw_sprite(nova_levels2, 0,100+x+200*i, 100+y+200*j)
		}
		if(oLevelRunner.pars[j,i] == 3){
		draw_sprite(nova_medals_clear, 0, 100+x+200*i - 24, 100+y+200*j + 48 + 24)
		draw_sprite(nova_medals_clear, 2, 100+x+200*i + 24, 100+y+200*j + 48 + 24)
		}
		else if(oLevelRunner.pars[j,i] == 1){
		draw_sprite(nova_medals_clear, 0, 100+x+200*i - 24, 100+y+200*j + 48 + 24)
		draw_sprite(nova_medals_clear, 3, 100+x+200*i + 24, 100+y+200*j + 48 + 24)
		}
		else if(oLevelRunner.pars[j,i] == 2){
		draw_sprite(nova_medals_clear, 1, 100+x+200*i - 24, 100+y+200*j + 48 + 24)
		draw_sprite(nova_medals_clear, 2, 100+x+200*i + 24, 100+y+200*j + 48 + 24)
		}
		else {
		draw_sprite(nova_medals_clear, 1, 100+x+200*i - 24, 100+y+200*j + 48 + 24)
		draw_sprite(nova_medals_clear, 3, 100+x+200*i + 24, 100+y+200*j + 48 + 24)	
		}
		if(j == selectX && i == selectY){
			draw_sprite(nova_cursor,image_index,100+x+200*i, 100+y+200*j)
		}
	}
	var name =  room_get_name(levels[selectX,selectY])
	name = string_lower(name)
	fontScale = 4
	var buffer = 0
	for(l = 0; l < string_length(name); l++){
		var index = ord(string_char_at(name,l+1))-97
		if(index < 0){
			index = 26	
		}
		var ken = 12
		if( index == 13 || index == 14 || index == 23){
			//buffer+=2
			//kenBuff= true
		}
		else if(kenBuff){
			kenBuff = false	
		}
		else{
			//buffer-=fontScale
		}
		draw_sprite_ext(nova_font, index,600 + ken*l*fontScale - (floor(string_length(name)/2) * fontScale*ken) + ken*fontScale+buffer,650,fontScale,fontScale,0,c_white,1)
	}
	
	
}
pal_swap_reset()