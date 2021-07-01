/// @description Insert description here
// You can write your code in this editor
timer = 20
scale = 1
width = sprite_width
	yMod = 0
	xMod = 0
//it rotates counter clockwise, so image angle = 90 is down, while 270 is up, and 180 is right
if(image_angle == 0){
	dir = -1	
	yMod = -1
	xMod = 0
}
else if(image_angle == 90){
	xMod = -1
	yMod = 0
	//image_angle = 270
	dir = -1	
}
else if(image_angle == 180){
	//image_angle = 180
	dir = 1	
	yMod = 1
	xMod = 0
}
else{
	xMod = 1
	yMod = 0
	//image_angle = 90
	dir = 1	
}