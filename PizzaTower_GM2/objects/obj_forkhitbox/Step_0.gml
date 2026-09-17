if (!instance_exists(ID))
{
	instance_destroy();
	exit;
}
x = ID.x;
y = ID.y;
image_xscale = ID.image_xscale;
image_yscale = ID.image_yscale;
with (ID)
{
	if (object_index == obj_coolpineapple || object_index == obj_ghostknight || object_index == obj_forknight || object_index == obj_noisey || object_index == obj_smokingpizzaslice)
	{
		if (state != "walk" && state != "rage")
		{
			hitboxcreate = false;
			instance_destroy(other);
		}
	}
	switch (object_index)
	{
		case obj_golfdemon:
			if (state != "charge")
			{
				instance_destroy(other);
			}
			break;
		case obj_pizzafaceboss_p3:
			if ((state != "punch" && state != states.swinging) || (state == "punch" && floor(image_index) >= 38))
			{
				instance_destroy(other);
			}
			break;
		case obj_fakepepclone:
		case obj_fakepepboss:
			if (state != "Sjump" && (state != "Sjumpprep" || image_index >= 11))
			{
				instance_destroy(other);
			}
			break;
		case obj_pepperman:
			if (state != "freefall")
			{
				instance_destroy(other);
			}
			break;
		case obj_badrat:
			other.x = x + (image_xscale * 16);
			if (state != "enemy_throw")
			{
				instance_destroy(other);
			}
			break;
		case obj_farmerbaddie:
		case obj_farmerbaddie2:
		case obj_farmerbaddie3:
			other.x = x + (image_xscale * 16);
			if (state != "charge")
			{
				instance_destroy(other);
			}
			break;
		case obj_peppinoclone:
			other.x = x - (image_xscale * 10);
			if (state != "punch")
			{
				instance_destroy(other);
			}
			break;
		case obj_robot:
			if (state != "mach2" && state != "slap" && state != "tackle")
			{
				hitboxcreate = false;
				instance_destroy(other);
			}
			else if (state == "slap")
			{
				other.x = x + (image_xscale * 32);
				if (floor(image_index) == (image_number - 2) || floor(image_index) < 8)
				{
					instance_destroy(other);
				}
			}
			else if (state == "mach2" || state == "tackle")
			{
				other.x = x + (image_xscale * 20);
			}
			break;
		case obj_soldier:
			other.x = x + (image_xscale * 24);
			if (state != "rage")
			{
				instance_destroy(other);
			}
			break;
		case obj_indiancheese:
			if (state != "walk" && sprite_index != spr_indiancheese_howl)
			{
				hitboxcreate = false;
				instance_destroy(other);
			}
			break;
		case obj_thug_red:
			if (state != "punch")
			{
				instance_destroy(other);
				punchinst = noone;
			}
			break;
		case obj_minijohn:
			if (state != "rage" && state != "punch")
			{
				instance_destroy(other);
			}
			break;
		case obj_ninja:
			if (state != "charge" && state != "punch")
			{
				instance_destroy(other);
			}
			if (state == "punch")
			{
				if (image_index > 14)
				{
					instance_destroy(other);
				}
				other.x = x + (image_xscale * 24);
			}
			break;
		case obj_boulder:
			if (!hitwall)
			{
				instance_destroy(other);
			}
			break;
		case obj_pickle:
			if (state != "enemy_throw")
			{
				instance_destroy(other);
			}
			break;
		case obj_peasanto:
		case obj_fencer:
		case obj_ancho:
			if (state != "charge" && state != "rage")
			{
				hitboxcreate = false;
				instance_destroy(other);
			}
			break;
		case obj_snowman:
			other.y = y - 22;
			if (state != "charge" && state != "rage")
			{
				hitboxcreate = false;
				instance_destroy(other);
			}
			break;
	}
}
