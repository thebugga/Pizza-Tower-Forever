scr_getinput2();
event_inherited();

if (!global.coop)
{
    obj_player.spotlight = true;
    x = -1000;
    y = 500;
    state = states.titlescreen;
    
    if (instance_exists(obj_coopflag))
        instance_destroy(obj_coopflag);
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

if (keyboard_check_pressed(ord("2")))
{
    state = 0;
    visible = true;
    image_xscale = 1;
    image_yscale = 1;
    xscale = 1;
    yscale = 1;
    slopexscale = 0;
    hitxscale = 1;
    prevxscale = 1;
    scale_xs = 1;
    scale_ys = 1;
}
