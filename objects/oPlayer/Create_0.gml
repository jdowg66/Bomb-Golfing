/// @description Insert description here
// You can write your code in this editor
bomb = false
hsp = 0
vsp = 0
spd = 5
grav = 0.5
blast = 15
jump = -6
bToss = 8
enum pState {
	normal,
	hold,
	dead
}
state = pState.dead
held = 0
poor = false
ghost = 0
ground = false
coyote = 0
buffer = 0
buffX = 0;
buffY = 0;
unheld = false
firstDead = true
fanTimer = 0
bombHold = false