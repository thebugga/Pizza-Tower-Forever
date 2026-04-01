var xs = sign(image_xscale);
for (var i = 0; i < array_length(leaves); i++)
{
	with (leaves[i])
	{
		draw_sprite_ext(spr_slopleaf, image_index, x, y, 1, 1, 0, c_white, image_alpha);
	}
}