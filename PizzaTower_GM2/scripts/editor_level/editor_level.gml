function editor_level() constructor
{
	static destroy = function()
	{
		ds_list_destroy(rooms);
	};
	
	rooms = ds_list_create();
	current_room = noone;
	previous_room = noone;
	name = "Default";
}

function new_empty_level()
{
	var l = new editor_level();
	var r = new editor_room(0, 0);
	ds_list_add(l.rooms, r);
	l.current_room = r;
	return l;
}

function get_current_room()
{
	return global.current_level.current_room;
}