if (other.state == "knightpep" && other.sprite_index != other.spr_knightpepstart && other.sprite_index != other.spr_knightpepthunder)
{
	fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y);
	state = "stun";
	stunned = 1000;
	lastattack = pizzafacep2_attacks.pullinglevel;
	throwsword = false;
	other.state = "default";
	other.jumpstop = true;
	other.vsp = -11;
	instance_destroy(obj_swordstone);
}
