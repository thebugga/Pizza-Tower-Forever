hp--
if hp <= 0
{
	Instakill();
	instance_destroy();
}
else
{
	var lag = 1;
	fmod_event_one_shot_3d("event:/sfx/pep/mach2bump", x, y);
	xscale = 0.8;
	yscale = 1.3;
	instance_create(x, y, obj_bangeffect);
	state = "hit";
	image_xscale = -other.xscale;
	hithsp = other.xscale * 12;
	hitvsp = (other.y - 180 - y) / 60;
	hitLag = lag;
	hitX = x;
	hitY = y;
	movespeed = -other.movespeed / 1.5
	vsp = -4
	invtime = lag + 5;
	mach2 = true;
}