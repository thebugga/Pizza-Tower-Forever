if (global.panic == true)
{
	instance_destroy();
}
if (is_holiday(holidays.halloween))
{
	instance_destroy();
}
if (obj_player1.character == "N" && !global.swapmode)
{
	instance_destroy();
}
