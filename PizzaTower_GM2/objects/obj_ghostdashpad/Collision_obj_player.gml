with (other)
{
	if ((state == "ghost" || (state == "chainsaw" && tauntstoredstate == "ghost")) && other.visible == true)
	{
		if character == "Peppino"
		{
			ghostdash = true;
		}
		GamepadSetVibration(0, 0.6, 0.6, 0.2);
		if (xscale > 0)
		{
			ghostangle = 0;
		}
		else
		{
			ghostangle = 180;
		}
		ghostpepper += 1;
		other.cooldown = 50;
		other.visible = false;
		scr_sound_multiple("event:/sfx/misc/collect", x, y);
		repeat (2)
		{
			create_debris(other.x, other.y, spr_flashdots, true);
		}
	}
}
