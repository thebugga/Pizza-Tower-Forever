if (!global.coop)
{
    obj_player1.spotlight = true;
    x = -1000;
    y = 500;
    state = states.titlescreen;
    
    if (instance_exists(obj_coopflag))
        instance_destroy(obj_coopflag);
}
else
{
	scr_getinput2();
	event_inherited();	
}

if (!visible && state == states.comingoutdoor)
{
    coopdelay++;
    image_index = 0;
    
    if (coopdelay == 50)
    {
        visible = true;
        coopdelay = 0;
    }
}
