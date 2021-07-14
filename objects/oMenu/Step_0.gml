/// @description Insert description here
// You can write your code in this editor
key_left = keyboard_check_pressed(vk_left)
key_right = keyboard_check_pressed(vk_right)
key_up = keyboard_check_pressed(vk_up)
key_down = keyboard_check_pressed(vk_down)
key_select = keyboard_check_pressed(ord("C"))
if(key_select){
	//oCamera.smooth = true
}
if(key_up && selectX >0){
	selectX --;	
}
if(key_down && selectX < array_height_2d(levels) - 1){
	selectX++	
}
if(key_left && selectY > 0){
	selectY --;	
}
if(key_right && selectY < array_length_2d(levels,selectX) - 1){
	selectY ++;
}
if(selectY > array_length_2d(levels,selectX) - 1){
	selectY = array_length_2d(levels,selectX) - 1	
}
if(key_select){
	oLevelRunner.levelX = selectX
	oLevelRunner.levelY = selectY
	oCamera.in = true
	//oCamera.smooth = true
	oCamera.goRoom = levels[selectX,selectY]	
	oCamera.trans = true
	//room = levels[selectX,selectY]	
	
}