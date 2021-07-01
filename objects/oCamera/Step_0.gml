/// @description Insert description here
// You can write your code in this editor
if(instance_exists(follow)){
	xTo = follow.x
	yTo = follow.y
}

x+=(xTo - x)/15
y+= (yTo - y)/15

x = clamp(x,view_w_half,room_width - (view_w_half - 96 ))

y = clamp(y,view_h_half,room_height -( view_h_half - 48))


x+= random_range(-shake_remain,shake_remain)
y+= random_range(-shake_remain,shake_remain)
shake_remain = max(0,shake_remain -((1/shake_length)*shake_magnitude))


camera_set_view_pos(cam,x-view_w_half,y-view_h_half)
if(trans){
if(trans && !moving ){
	with(instance_create_layer(x,y+view_h_half,"particle",oTrans)){ vert = true; offY = oCamera.view_h_half }
	with(instance_create_layer(x,y-view_h_half,"particle",oTrans)){ vert = true; offY = -oCamera.view_h_half}
	with(instance_create_layer(x+view_w_half,y,"particle",oTrans)){ vert = false; offX = oCamera.view_w_half}
	with(instance_create_layer(x-view_w_half,y,"particle",oTrans)){ vert = false; offX = -oCamera.view_w_half}
	moving = true
	if(in){
		show_debug_message("go in")
	counter = 0
	}
	else{
	counter = 24	
	}
}
else if(trans && in){
	counter++
	show_debug_message("zoom in " + string(counter))
	if(counter >23){
		in = false
		if(instance_exists(oPlayer)){
		room = DeathRoom
		}
		else{
			show_debug_message("did we get here")
			smooth = true
			room = goRoom	
		}
	}
}
else if(trans){
	show_debug_message("how did we go out")
	if(counter > 23){
	with(instance_create_layer(x,y+view_h_half,"particle",oTrans)){ vert = true;offY = oCamera.view_h_half}
	with(instance_create_layer(x,y-view_h_half,"particle",oTrans)){ vert = true; offY = -oCamera.view_h_half}
	with(instance_create_layer(x+view_w_half,y,"particle",oTrans)){ vert = false; offX = oCamera.view_w_half}
	with(instance_create_layer(x-view_w_half,y,"particle",oTrans)){ vert = false; offX = -oCamera.view_w_half}	
	}
	counter--
	if(counter <= 0){
		if(instance_exists(oPlayer)){
		oPlayer.state = pState.normal
		oPlayer.firstDead = true
		}
		trans = false
		moving = false
		in = true
	}
}
}
if(room == MainRoom){
	//in = false	
	x = room_width / 2
	y = room_height / 2
}
