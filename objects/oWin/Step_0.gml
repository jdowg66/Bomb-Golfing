/// @description Insert description here
// You can write your code in this editor
key_next = keyboard_check(ord("C"))

if(key_next){
	fScore = max(0, oLevelRunner.pars[oLevelRunner.levelX,oLevelRunner.levelY])
	if(fBomb <= oLevelRunner.clears[oLevelRunner.levelX,2*oLevelRunner.levelY] && fScore != 2 && fScore !=3){
		fScore+=2
	}
	if(fBlocks <= oLevelRunner.clears[((oLevelRunner.levelX)), 2*oLevelRunner.levelY+1] && fScore != 1 && fScore !=3){
		fScore+=1
	}
	if(fScore >3){
		fScore = 3	
	}
	oLevelRunner.pars[oLevelRunner.levelX,oLevelRunner.levelY] = fScore
	//room = MainRoom	
	stay = false
	
}
oPlayer.state = pState.pause
	oCamera.trans = true
	oCamera.goRoom = MainRoom
	if(oCamera.counter >= 21 && stay){
		oCamera.counter = 21	
	}
	if(chunk < 40){
		chunk++	
	}