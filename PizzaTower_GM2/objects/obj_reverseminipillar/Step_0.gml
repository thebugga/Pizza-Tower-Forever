if (global.panic == false || global.gerome == true)
{
	x = xstart;
	y = ystart;
	sprite_index = spr_minipillarwoke;
	mask_index = spr_minipillarwoke;
}
else
{
	x = -1000;
	y = -1000;
	sprite_index = spr_minipillarsleep;
}