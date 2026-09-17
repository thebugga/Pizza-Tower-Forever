if (scr_transformationcheck() && state != "bombpepside" && state != "bombpepup" && state != "Sjump" && state != "Sjumpprep")
{
	var dir = point_direction(other.x, other.y, x, y);
	trace(dir);
	if (!grounded && dir >= 45 && dir < 135)
	{
		state = "bombpepup";
		bombup_dir = -1;
		sprite_index = spr_superspringplayer;
		image_index = 0;
	}
	if (grounded && x > (other.x - 8) && x < (other.x + 8))
	{
		state = "bombpepside";
		xscale = -1;
		movespeed = 14;
		sprite_index = spr_hurt;
	}
	if (state != "bombpepside" && state != "bombpepup")
	{
		if (dir >= 135 && dir < 270)
		{
			state = "bombpepside";
			xscale = -1;
			movespeed = 14;
			sprite_index = spr_hurt;
		}
		else if (dir >= 270 || dir < 45)
		{
			state = "bombpepside";
			sprite_index = spr_hurt;
			movespeed = 14;
			xscale = 1;
		}
	}
}
