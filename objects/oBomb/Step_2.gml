/// @description Insert description here
// You can write your code in this editor
if(oPlayer.key_undo && !ignite){
	for(i = 0; i < 15; i++){instance_create_layer(x,y,"particle",oPoof)}
	instance_destroy()	
}
if(detonate){
	//oCamera.shake_remain = 6
	mask_index= fast_bomb8
		while(place_meeting(x,y,oWall) && loopStop < 8){
		with(instance_place(x,y,oWall)){
			if(blowup){ instance_destroy()}	
			else{mask_index = sEmpty}
		}
		}
		instance_destroy()
}