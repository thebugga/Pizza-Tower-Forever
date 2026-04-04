for (var i = 0; i < array_length(leaves); i++)
{
	with (leaves[i])
	{
		draw_sprite_ext(spr_slopleaf, image_index, x, y, other.scale, other.scale, 0, c_white, image_alpha);
	}
}