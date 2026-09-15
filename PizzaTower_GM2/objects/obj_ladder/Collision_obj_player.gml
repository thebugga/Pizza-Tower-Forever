with (other)
{
	if (key_up && ladderbuffer <= 0 && (state == "default" || state == "pogo" || state == "machcancel" || state == "mach2" || (state == "mach3" && sprite_index != spr_fightball) || state == "mach1" || state == "punch" || state == "shotgunjump" || state == "jump" || state == "highjump" || (state == "ratmountbounce" && character == "Noise")) && state != "hurt" && state != "machslide" && state != "freefall" && state != "freefallland")
	{
		input_buffer_jump = 0;
		state = "ladder";
		x = other.x + 16;
		y = floor(y);
		if ((y % 2) == 1)
		{
			y -= 1;
		}
	}
	if (key_up && ladderbuffer <= 0 && isgustavo && (state == "ratmountjump" || state == "ratmountbounce" || state == "noisecrusher" || state == "ratmount"))
	{
		input_buffer_jump = 0;
		state = "ratmountladder";
		if (brick == true)
		{
			with (instance_create(x, y, obj_brickcomeback))
			{
				wait = true;
				instance_create(x, y, obj_genericpoofeffect);
			}
		}
		brick = false;
		x = other.x + 16;
		y = floor(y);
		if ((y % 2) == 1)
		{
			y -= 1;
		}
	}
}
