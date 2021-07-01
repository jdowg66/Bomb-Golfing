/// @description Insert description here
// You can write your code in this editor
if(first){
	first = false
	with(oPortal){
	if(self != other && tag == other.tag && other.blue && !blue){
		toX = other.x
		toY = other.y
		other.toX = x
		other.toY = y
	}
}
}