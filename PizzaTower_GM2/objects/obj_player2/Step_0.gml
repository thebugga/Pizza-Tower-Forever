
visible = false;
x = -10000;
y = -10000;
scr_getinput2();
if (!global.coopmode)
{
	obj_player1.spotlight = true;
	x = -1000;
	y = -1000;
	state = "titlescreen";
}
else if (key_start && !fightball && obj_player1.state != "mach3" && obj_player1.state != "grabbed")
{
	state = "gotoplayer";
}
if (!visible && state == "comingoutdoor")
{
	coopdelay++;
	image_index = 0;
	if (coopdelay == 50)
	{
		visible = true;
		coopdelay = 0;
	}
}
