repeat (irandom_range(6, 9))
{
	scr_add_leaf(irandom_range(x, x + sprite_width), y + irandom_range(-10, 10));
}
alarm[0] = irandom_range(15, 20);
