if (state != "grabbed" && (other.state != "handstandjump" || invincible) && (other.state != "tumble" || (other.sprite_index != other.spr_tumble && other.sprite_index != other.spr_tumblestart && other.sprite_index != other.spr_tumbleend)) && state != "stun" && (state == states.chase || state == "walk"))
{
	var s = other.state;
	if (other.flash)
	{
		other.flash = false;
	}
	scr_hurtplayer(other);
	if (other.state != s && other.state != "parry")
	{
		state = "stun";
		hsp = -image_xscale * 7;
		vsp = -6;
		stunned = 100;
	}
}
