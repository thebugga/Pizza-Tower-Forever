if (!active)
{
	exit;
}
editor_input_update();
hovered = obj_editorcursor.hovered_object == id;
image_index = 0;
if (hovered)
{
	image_index = 1;
	if (obj_button.key_place)
	{
		image_index = 2;
		on_left_click();
	}
	else if (obj_button.key_delete)
	{
		image_index = 2;
		on_right_click();
	}
}