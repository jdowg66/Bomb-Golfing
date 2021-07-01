/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x +momx,y,oWall)){momx = 0} else{ x +=momx }
momy+=grav
if(place_meeting(x,y + momy,oWall)){momy = 0} else{y += momy }

if(timer > 56){
	momy =  scale*dsin(image_angle)	
	momx = scale*dcos(image_angle)
}
else if(timer > 40){
	momx = scale*dcos(image_angle)
}
timer--;
if(timer < 0 && momx == 0 && momy == 0){
	/*
	with(instance_create_layer(x,y,"instances",oBomb)){
		//ignite = true
	}
	*/
	instance_destroy()	
}
if(momx != 0){
	momx -= (sign(momx)*.05)	
	if(abs(momx) < 0.15){
		momx = 0	
	}
}