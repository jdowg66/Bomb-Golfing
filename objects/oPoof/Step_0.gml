/// @description Insert description here
// You can write your code in this editor

if(image_index > 1 ){
	loop = true	
}
if(loop && image_index <=1){
	kill = true	
}
if(kill){
	instance_destroy()	
}
x+= spdX
y+= spdY