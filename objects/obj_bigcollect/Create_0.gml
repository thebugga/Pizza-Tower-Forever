sprite_index = choose(spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5);
image_speed = 0.35;
depth = 11;
value = 100;

if chance(20)
{
	instance_destroy();
	instance_create(x, y, obj_pizzacoinbig);
}