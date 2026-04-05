scr_getinput();
event_inherited();

if (keyboard_check_pressed(ord("1")))
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
