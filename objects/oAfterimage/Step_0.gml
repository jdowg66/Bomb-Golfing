/// @description Insert description here
// You can write your code in this editor
image_alpha = time / const
if(time <= 0){
	instance_destroy()	
}
time--;
if(oPlayer.state == pState.dead){
	instance_destroy()	
}