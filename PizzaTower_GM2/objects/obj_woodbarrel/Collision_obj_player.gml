if ((other.state == "handstandjump" || other.state == "punch") && other.grounded == true)
{
	//instance_create(x + (obj_player1.xscale * 40), y, obj_punchdust);
	with (other)
	{
		image_index = 0;
		sprite_index = spr_haulingstart;
		grabbingenemy = true;
		baddiegrabbedID = other.id;
		state = "grab";
	}
	playerid = other.object_index;
	grabbed = true;
}
if (other.state == "mach2" || other.state == "mach3" || (other.state == "machroll" && grounded))
{
	create_particle(x, y, particletypes.genericpoofeffect, 0);
	with (other)
	{
		vsp = 0;
		mask_index = spr_crouchmask;
		x = other.x;
		y = other.y;
		state = "barrel";
		sprite_index = spr_barrelroll;
		movespeed = 12;
	}
	instance_destroy();
}
