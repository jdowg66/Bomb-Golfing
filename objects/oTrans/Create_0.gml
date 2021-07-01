/// @description Insert description here
// You can write your code in this editor
vert = false
offX = 0
offY = 0
if(instance_exists(oPlayer)){
	centerX = oPlayer.x
	centerY = oPlayer.y
}
else if(instance_exists(oMenu)){
	centerX = 100+oMenu.x+200*oMenu.selectY
	centerY = 100+oMenu.y+200*oMenu.selectX
}
else{
	centerX = oCamera.x	
	centerY = oCamera.y
}

