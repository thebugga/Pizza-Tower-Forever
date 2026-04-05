if (room != rank_room && room != timesuproom && room != Mainmenu)
{
	showtext = true;
	alarm[0] = 200;
}
if (room == tower_soundtest || room == tower_soundtestlevel || room == Mainmenu)
{
	visible = false;
	y = 600;
	showtext = false;
}
