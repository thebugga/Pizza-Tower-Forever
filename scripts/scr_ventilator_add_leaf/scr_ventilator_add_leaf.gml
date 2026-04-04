function scr_ventilator_add_leaf(_x, _y)
{
	var b = 
	{
		x: _x,
		y: _y,
		destroy: false,
		vsp: -random_range(1, 5),
		image_speed: 0,
		image_alpha: 0,
		image_index: irandom(sprite_get_number(spr_ventilatorleaf) - 1)
	};
	array_push(leaves, b);
}

function scr_ventilator_update_leaf(_leaf)
{
	with (_leaf)
	{
		if (!destroy)
		{
			image_alpha = Approach(image_alpha, 1, 0.1);
			if (y < (other.bbox_top - 48))
			{
				destroy = true;
			}
		}
		else
		{
			image_alpha = Approach(image_alpha, 0, 0.1);
			if (image_alpha <= 0)
			{
				return true;
			}
		}
		y += vsp;
	}
	return false;
}

function scr_add_leaf(_x, _y)
{
	var b = 
	{
		x: _x,
		y: _y,
		destroy: false,
		scale: random_range(0.5, 1.5),
		vsp: -random_range(1, 5),
		hsp: -random_range(1, 5),
		image_speed: 0,
		image_alpha: 1,
		image_index: irandom(sprite_get_number(spr_slopleaf) - 1)
	};
	array_push(leaves, b);
}

function scr_update_leaf(_leaf)
{
	with (_leaf)
	{
		image_alpha = Approach(image_alpha, 1, 0.1);
		x -= hsp;
		y -= vsp;
	}
	return false;
}