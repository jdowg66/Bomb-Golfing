/// @description Insert description here
// You can write your code in this editor
oldX = x
oldY = y
key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_up = keyboard_check(vk_up)
key_down = keyboard_check(vk_down)
key_bomb = keyboard_check_pressed(ord("X"))
key_bombgo = keyboard_check_released(ord("X"))
key_release = keyboard_check(ord("C"))
key_undo = keyboard_check_pressed(ord("Z"))

xdir = key_right - key_left
ydir = key_down - key_up
if( ground && (hsp*sign(hsp) < spd*3 || xdir != sign(hsp))){
	if(unheld && hsp == 0 && ydir == 1){}
	else{
		unheld = false
hsp += (spd*xdir/10)
	}
}
else if( !ground && hsp*sign(hsp) < spd*4){
	hsp += (spd*xdir/10)
}
if(xdir == 0){
	hsp -= 0.2 * sign(hsp)	
	if(abs(hsp) < 1){
		hsp = 0	
	}
}
switch(state){
	case pState.normal:
	{
		if(key_bomb && instance_exists(oBomb) && bombHold){
			bombHold = false
			oLevelRunner.bombs++
			with(oBomb){
				ignite = true;	
				oCamera.shake_remain = 6
			}
		}
		else if(key_bomb){
			bombHold = true
			held = instance_create_layer(x,y-40,"Instances",oBomb)
			state = pState.hold
		}
		if(key_release && (place_meeting(x,y+1,oWall)|| coyote > 0)){
			coyote = 0
			audio_play_sound(yump,1,false)
			vsp+=jump
		}
	}break;
	case pState.hold:
	{
		if(!ground){}
		else {
			if(ydir == 1){
				if(xdir != 0){
					hsp -= (spd*xdir/10)
				}
				hsp -= 0.2 * sign(hsp)	
				if(abs(hsp) < 1){
				hsp = 0	
				}
			}
			else{
			hsp -= (spd*xdir/20)
			}
		}
		if(key_bombgo){
			//audio_play_sound(toss,1,false)
			
			ground = place_meeting(x,y+1,oWall)
			with(held){
				mask_index = nova_bomb
				//x = oPlayer.x
			//	y = oPlayer.y
				if(/*!oPlayer.ground*/ false){
					if(oPlayer.xdir == 0 && oPlayer.buffX != 0){
						momx = oPlayer.bToss*oPlayer.buffX + oPlayer.hsp
					}
					else{
						momx = oPlayer.bToss*oPlayer.xdir + oPlayer.hsp
					}
				}
				else{
					
					if(oPlayer.ydir == 0){
						if(oPlayer.buffY == -1){
							if(oPlayer.xdir == 0 && oPlayer.buffX != 0){
								momx = /*oPlayer.buffX*abs*/(oPlayer.hsp) + oPlayer.buffX*oPlayer.bToss / 8
							}
							else{
								momx =/* oPlayer.xdir*abs*/(oPlayer.hsp) + oPlayer.xdir*oPlayer.bToss / 8
							}
						}
						else if(oPlayer.buffY ==  1){
						
							if(oPlayer.xdir == 0 && oPlayer.buffX != 0){
								momx =/* oPlayer.buffX*abs*/(oPlayer.hsp)	+ oPlayer.buffX*oPlayer.bToss / 1
							}
							else{
								momx =/* oPlayer.xdir*abs*/(oPlayer.hsp)	+ oPlayer.xdir*oPlayer.bToss / 1
							}
						}
						else if(oPlayer.xdir == 0 && oPlayer.buffX != 0){
							momx =/* oPlayer.buffX*abs*/(oPlayer.hsp) 	+ oPlayer.buffX*oPlayer.bToss / 2
						}
						else{
							momx = /*oPlayer.xdir*abs*/(oPlayer.hsp) 	+ oPlayer.xdir*oPlayer.bToss / 2
						}
					}
					else if(oPlayer.ydir == -1){
						if(oPlayer.xdir == 0 && oPlayer.buffX != 0){
							momx = /*oPlayer.buffX*abs*/(oPlayer.hsp) + oPlayer.buffX*oPlayer.bToss / 8
						}
						else{
							momx =/* oPlayer.xdir*abs */(oPlayer.hsp) + oPlayer.xdir*oPlayer.bToss / 8
						}
					}
					else{
							
						oPlayer.unheld = true
						if(oPlayer.xdir == 0 && oPlayer.buffX != 0){
							momx = /*oPlayer.buffX*abs*/(oPlayer.hsp)	+ oPlayer.buffX*oPlayer.bToss / 1
						}
						else{
							momx = /*oPlayer.xdir*abs*/(oPlayer.hsp)	+ oPlayer.xdir*oPlayer.bToss / 1
						}
					}
				}
				if(oPlayer.ydir == 0 && oPlayer.buffY != 0){
				momy = oPlayer.bToss*oPlayer.buffY*abs(min(-1,1.5*sign(oPlayer.buffY))) + oPlayer.vsp
				}
				else{
					momy = oPlayer.bToss*oPlayer.ydir*abs(min(-1,1.5*sign(oPlayer.ydir))) + oPlayer.vsp
				}
			}
			held = 0
			state = pState.normal
		}
		else{
			with(held){
				x = oPlayer.x
				y = oPlayer.y - 40
				mask_index = sEmpty
			}
		}
		if(key_release && (place_meeting(x,y+1,oWall) || coyote > 0)){
			coyote = 0
			audio_play_sound(yump,1,false)
			vsp+=jump
		}
		image_index = 2
	}break;
	case pState.dead:
	{
		oCamera.trans = true
		if(oCamera.in){
			sprite_index = nova_death	
			
		}
		image_index = 0
		if(firstDead){
			if(oCamera.in){
			for(i = 1; i < 12; i++){ with(instance_create_layer(x,y,"particle",oCrumble)){grav = oPlayer.grav; mask_index = nova_crumble; scale = 4; image_angle = irandom_range(0,358); sprite_index = nova_death; image_speed = 0; image_index = oPlayer.i;}}	
			}
			firstDead = false
			oldx = x
			oldy = y
			xdir = 0
			ydir = 0
			hsp = 0
			vsp = 0
			delay = 0
		}
		else{
			x = oldx
			y = oldy
			xdir = 0
			ydir = 0
			hsp = 0
			vsp = 0
			delay++
			if(delay > 10){
			oCamera.trans = true	
			}
		}
	}break;
	case pState.pause:
	{
		x = oldX
		y = oldY
	}break;
}
if(place_meeting(x,y,oBomb)){
	with(instance_nearest(x,y,oBomb)){
		if(	ignite && !blown){
			other.ghost = 30
			blown = true
			var yblast = oPlayer.blast*-1*dsin(point_direction(x,y,oPlayer.x,oPlayer.y))
			oPlayer.hsp += oPlayer.blast*dcos(point_direction(x,y,oPlayer.x,oPlayer.y))
			if(sign(yblast) == sign(oPlayer.vsp)){
				oPlayer.vsp += oPlayer.blast*-1*dsin(point_direction(x,y,oPlayer.x,oPlayer.y))
			}
			else{
				oPlayer.vsp = yblast
			}
			//show_debug_message(string(point_direction(x,y,oPlayer.x,oPlayer.y)) + "  " + string(oPlayer.hsp) + "  " + string(oPlayer.vsp))
			mask_index = sEmpty
		}
	}
}
if(place_meeting(x,y,oFan)){
	with(instance_place(x, y, oFan)){
		if(oPlayer.fanTimer < timer){
			oPlayer.fanTimer++
			oPlayer.hsp += xMod
			oPlayer.vsp += yMod
		}
		else{
			if(xMod != 0){
				if(/*sign(oPlayer.hsp) != xMod && */oPlayer.fanTimer >= timer){
					if(sign(oPlayer.hsp) != xMod || abs(oPlayer.hsp) <= 2){
						if(oPlayer.xdir != xMod && oPlayer.xdir != 0 && abs(oPlayer.hsp) <= 2){
							oPlayer.fanTimer = timer - 2
							oPlayer.hsp -=xMod
						}else{
						oPlayer.fanTimer = timer - 2
						}
					}
					else{
							if(oPlayer.xdir != xMod && oPlayer.xdir != 0 /*&& abs(oPlayer.hsp) <= 2*/){
							oPlayer.fanTimer = timer - 2
							oPlayer.hsp -=xMod
						}else{
						oPlayer.fanTimer = timer + min(-1, -2 /*abs(oPlayer.hsp) - timer/2*/)
						}
						//oPlayer.fanTimer = timer + min(-1, -2 /*abs(oPlayer.hsp) - timer/2*/)
					}
				}
				
			}
			else if(yMod != 0){
				if(/*sign(oPlayer.vsp) != yMod && */oPlayer.fanTimer >= timer){
					if(sign(oPlayer.vsp) != yMod|| abs(oPlayer.vsp) <= 2){
					oPlayer.fanTimer = timer - 2
					}
					else{
							oPlayer.fanTimer = timer + min(-1,( abs(oPlayer.vsp) - timer/2))
					}
				}
			}
		}
	}
}
else{
	if(fanTimer > 0){
		fanTimer = 0
	}
}
if(place_meeting(x+hsp,y,oWall) || place_meeting(x+sign(hsp),y,oWall) ){
	while(!place_meeting(x+sign(hsp),y,oWall)){
		x+=sign(hsp)
	}
	hsp = 0;
}
x+=hsp
vsp+=grav

if(place_meeting(x,y+vsp,oWall) || place_meeting(x,y+sign(vsp),oWall)){
	if(!ground){ audio_play_sound(plangin,1,false); for(i = 0; i < 10; i++){ with(instance_create_layer(x,y + sprite_width / 2,"particle",oPoof)){ spdY = random_range(-0.5,0.5);}}}
	ground = true
	while(!place_meeting(x,y+sign(vsp),oWall)){
		y+=sign(vsp);	
	}
	if(vsp > 0){
		coyote = 5
	}
	vsp = 0;
}
else{
	ground = false	
	if(coyote >0){
		coyote--;	
	}
}
y+=vsp;
if(place_meeting(x,y,oLazer)){
	state = pState.dead
	
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
	poor = false	
}
if(ghost > 0 ){
	if(ghost %2 == 0){
	instance_create_layer(x,y,"instances",oAfterimage)
	}
	ghost--;
}
if(place_meeting(x,y,oFlag)){
	with(instance_place(x,y,oFlag)){
		if(!death){
			if(other.oneWin){
				instance_create_layer(x,y,"particle",oWin)
				other.oneWin = false
			}
			for(i = 0; i < 2; i++){
				instance_create_layer(x,y,"particle",oPoof)	
			}
			state = pState.pause
			//room = MainRoom	
		}
		else{
			//oPlayer.state = pState.dead
		}
	}
}

if(xdir != 0 || ydir != 0){
	buffer = 0
	buffX = xdir
	buffY = ydir
}
else{
	buffer ++;
	if(buffer > 4){
			buffX = 0
			buffY = 0
	}
}
if(xdir < 0){
	image_speed = 1
	image_xscale= -1
}
else if(xdir > 0){
	image_speed = 1
	image_xscale = 1
}
else{
	if(state !=pState.hold){
	image_index = 0
	}
	image_speed = 0	
}
if(vsp > 0){
	image_index = 2	
}
else if(vsp < 0){
	image_index = 0	
}
if(x < 0 || x > room_width){
	x = oldX	
	hsp = 0
	vsp = 0
	show_debug_message("warp")
}
if(y < 0 || y > room_height){
	y = oldY	
	hsp = 0
	vsp = 0
	show_debug_message("warp")
}
if(place_meeting(x,y,oWall)){
	x = lazyX
	y = lazyY
	oldX = x
	oldY = y
	hsp = 0
	vsp = 0
}
if(state == pState.pause){
	x = oldX
	y = oldY
}