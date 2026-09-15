if (state != "parry" && state != "backbreaker")
{
	exit;
}
with (other)
{
	var _maxhsp = abs(spd);
	var _dir = sign(spd);
	if (x != other.x)
	{
		_dir = sign(x - other.x);
	}
	spd = _maxhsp * _dir;
}
if (state != "parry")
{
	sprite_index = parryspr;
	movespeed = 8;
	state = "parry";
	image_index = 0;
}
