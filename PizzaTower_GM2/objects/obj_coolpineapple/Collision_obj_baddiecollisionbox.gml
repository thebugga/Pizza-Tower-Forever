if (state != "parry" && state != "backbreaker")
{
	exit;
}
var my_id = id;
var other_baddie = other.id;
var can_parry = false;
with (other_baddie)
{
	if (instance_exists(baddieID) && baddieID.thrown == true && baddieID != other.id)
	{
		can_parry = true;
	}
}
if (can_parry && state != "parry" && other.baddieID != id)
{
	sprite_index = parryspr;
	movespeed = 8;
	state = "parry";
	image_index = 0;
}
