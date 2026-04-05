scr_menu_getinput();
if key_down2
{
	global.swapmode = true;
}
else if key_up2
{
	global.coop = true;
	create_transformation_tip("coop is very broken rn use it with caution");
}