if obj_player.character == "Noise"// || obj_player.character == characters.Doise
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
character = obj_player1.character;
spr_palette = obj_player1.spr_palette;
paletteselect = obj_player1.paletteselect;