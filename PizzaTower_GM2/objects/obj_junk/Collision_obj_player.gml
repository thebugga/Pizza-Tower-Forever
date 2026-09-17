if (!grabbed && other.state == "handstandjump" && unpickable == false)
{
	with instance_create(x + (obj_player1.xscale * 40), y, obj_parryeffect)
	{
		sprite_index = spr_punchdust;
	}
	
	with (other)
	{
		image_index = 0;
		sprite_index = spr_haulingstart;
		baddiegrabbedID = other.id;
		grabbingenemy = true;
		state = "grab";
	}
	
	playerid = other.object_index;
	grabbed = true;
	been_grabbed = true;
}

if (!grabbed && unpickable == false && !ratgrabbed && other.state == "ratmountattack")
{
	ratplayerid = other.id;
	ratgrabbed = true;
	state = states.ratgrabbed;
	other.ratgrabbedID = id;
	other.state = "ratmount";
	been_grabbed = true;
}
