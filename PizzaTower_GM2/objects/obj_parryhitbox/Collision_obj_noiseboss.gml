var state = other.state;
var hsp = other.hsp;
if (((state == "mach2" && hsp != 0) || (state == states.spin && other.image_index > 3) || (state == "freefall" && !other.grounded) || state == "machslide" || state == "pogo" || state == states.jetpack || state == states.bounce) && !collisioned)
{
	event_user(0);
}
