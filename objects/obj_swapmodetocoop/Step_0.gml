scr_menu_getinput();
if (((global.coop && key_down2) || (global.swapmode && key_up2)) && obj_characterselect.ready)
{
	global.swapmode = !global.coop
	global.coop = !global.swapmode
	if global.coop
		create_transformation_tip("coop is very broken rn use it with caution")
}