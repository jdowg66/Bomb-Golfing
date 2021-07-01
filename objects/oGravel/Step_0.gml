/// @description Insert description here
// You can write your code in this editor
vsp += grav	
if(place_meeting(x,y+1,oWall) || place_meeting(x,y+vsp,oWall)){
	vsp = 0	
}
y+=vsp