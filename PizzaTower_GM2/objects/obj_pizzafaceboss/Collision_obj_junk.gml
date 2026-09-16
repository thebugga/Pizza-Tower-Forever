if (other.thrown && state != "stun")
{
	state = "stun";
	stunned = 1000;
	thrown = false;
	hsp = -image_xscale * 8;
	vsp = -4;
	instance_destroy(obj_junk);
}
