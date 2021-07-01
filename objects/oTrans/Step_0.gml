/// @description Insert description here
// You can write your code in this editor
if(!oCamera.trans){
	instance_destroy()	
}
x = oCamera.x + offX
y = oCamera.y + offY
if(vert){
	image_xscale = oCamera.view_w_half
	scale = abs(y - centerY) / 20
	image_yscale = (oCamera.counter ) * scale
}	
else{
	image_yscale = oCamera.view_h_half
	scale = abs(x - centerX) / 20
	image_xscale = (oCamera.counter ) * scale
}
