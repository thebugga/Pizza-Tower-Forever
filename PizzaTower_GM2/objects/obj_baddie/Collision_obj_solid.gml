if (state != states.pizzaheadjump && use_collision && state != "grabbed" && state != "pummel" && state != "hit" && state != states.secret && (!place_meeting(x, y, obj_destructibles) || place_meeting(x, y, obj_onewaybigblock)))
{
	instance_destroy();
}
