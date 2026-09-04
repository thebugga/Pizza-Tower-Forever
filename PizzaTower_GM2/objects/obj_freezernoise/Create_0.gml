if obj_player.character == characters.Noise || obj_player.character == characters.Doise
{
	instance_destroy();
	exit;
}

alarm[0] = 100;
alarm[1] = 450;
image_speed = 0.35;
hsp = 0;
vsp = 0;
depth = -7;