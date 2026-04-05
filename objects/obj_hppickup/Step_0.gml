scr_collide();
switch (obj_player.character)
{
	case "N":
		sprite_index = spr_bossfight_noiseHP;
		break;
		
	default:
		sprite_index = spr_bossfight_playerhp;
		break;
}
