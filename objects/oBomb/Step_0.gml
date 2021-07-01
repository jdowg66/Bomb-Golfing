
if(ignite){
	poor = true
	if(timer == -1){
		instance_create_layer(x,y,"instances",oBlast);
		audio_play_sound(boom,1,false); timer = 15; 
		image_index = 0; image_speed = 1;
		if(mask_index != sEmpty){ 
			mask_index = fast_bomb8;
		}
	}
	else if(timer == 0){
		detonate = true
		
		
	}
	timer--;
}
else{
	image_speed = 0
	if(anime ==0){
	if(image_index ==0){
	image_index = 1
	}
	else{
	image_index = 0	
	}
	anime = 10
	}
	anime--;

if(momx != 0 && place_meeting(x,y+1,oWall)){
	momx -= 0.5*sign(momx)	
	if(abs(momx) < 1){
		momx = 0;	
	}
}
if(landtick > 5){
	prev = false	
}
if(place_meeting(x,y,oFan)){
	with(instance_place(x, y, oFan)){
			other.momx += xMod
			other.momy += yMod
	}
}
if(place_meeting(x+momx,y,oWall)){

	while(!place_meeting(x+ sign(momx),y,oWall)){

		x+=sign(momx)	
	}
	momx = 0;/*if(!audio_is_playing(bombland))*/ if(xtick){audio_play_sound(bombland,1,false);  for(i = 0; i < 10; i++){ with(instance_create_layer(x,y + sprite_width / 2,"particle",oPoof)){ spdX = random_range(-0.5,0.5);}}}  xtick = false;} else{ x+=momx }
momy += grav
if(place_meeting(x,y+momy,oWall)){
	while(!place_meeting(x,y+ sign(momy),oWall)){
		y+=sign(momy)	
	}
	momy = 0; if(/*!audio_is_playing(bombland) &&*/ !prev){ audio_play_sound(bombland,1,false); for(i = 0; i < 10; i++){ with(instance_create_layer(x,y + sprite_width / 2,"particle",oPoof)){ spdY = random_range(-0.5,0.5);}}} prev = true; landtick = 0;   } else{ y+=momy; landtick++}
}
if(place_meeting(x,y,oPortal)){
	if(!poor){
	with(instance_place(x,y,oPortal)){
		other.x = toX
		other.y = toY
	}
	}
	poor = true
}
else{
	if(!ignite){
	poor = false
	}
}
if(oPlayer.state == pState.hold){
	momy = 0	
	momx = 0
}
if(place_meeting(x,y,oBombLazer)){
	for(i = 0; i < 10; i++){instance_create_layer(x,y,"particle",oPoof)}
	instance_destroy();	
}
if(oPlayer.state = pState.dead){
	for(i = 0; i < 10; i++){instance_create_layer(x,y,"particle",oPoof)}
	instance_destroy()	
}

if(sd ==1){
	detonate = true
}
if(place_meeting(x,y,oRadarLazer) && !delay){
	oPlayer.bombHold = false
	delay = true
}