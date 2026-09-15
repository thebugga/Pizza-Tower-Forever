if (!trapped)
{
	if (comeback == true && obj_player1.state != "ratmountpunch" && obj_player1.sprite_index != spr_lonegustavo_hurt && obj_player1.state != "ratmountgroundpound")
	{
		other.brick = true;
		if (other.state != "ratmountcrouch" && other.state != "backbreaker" && other.state != "bump" && other.state != "ratmounthurt")
		{
			if (!other.grounded)
			{
				other.sprite_index = spr_player_ratmountfall;
			}
			else
			{
				other.sprite_index = spr_player_ratmountidle;
			}
		}
		if (other.state == "ratmountjump")
		{
			other.sprite_index = spr_player_ratmountfall;
			other.jumpAnim = false;
		}
		else if (other.state == "bump")
		{
			other.sprite_index = spr_player_ratmountbump;
		}
		instance_create(other.x, other.y, obj_genericpoofeffect);
		instance_destroy();
	}
}
else if (other.state == "ratmountpunch" && baddieID == noone)
{
	fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y);
	vsp = -6;
	hsp = other.xscale * 8;
	trapped = false;
	wait = true;
	comeback = false;
	alarm[0] = 30;
}
