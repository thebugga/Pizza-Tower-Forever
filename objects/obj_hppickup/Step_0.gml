scr_collide();
switch (obj_player1.character)
{
	case "N":
		sprite_index = spr_bossfight_noiseHP;
		break;
		
	default:
		sprite_index = spr_bossfight_playerhp;
		break;
}
