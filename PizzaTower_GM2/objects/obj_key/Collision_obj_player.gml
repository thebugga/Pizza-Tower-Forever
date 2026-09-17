
if (global.key_inv)
{
	exit;
}
with (other)
{
	if (state != "bombpep" && state != "gotoplayer" && state != "ghost" && state != "knightpep" && state != "cheeseball" && state != "boxxedpep" && state != "cheesepep" && state != "knightpepattack" && state != "knightpepslopes" && state != "hurt" && state != "knightpepbump")
	{
		instance_destroy(other);
		goblinkey = false;
		global.key_inv = true;
		key_particles = true;
		alarm[7] = 30;
		fmod_event_one_shot("event:/sfx/misc/collecttoppin");
		state = "keyget";
		image_index = 0;
		keysound = false;
		global.combotime = 60;
	}
}
