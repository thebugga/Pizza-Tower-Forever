depth = -10;
Region_active = true;
zoom = 1;
ClampTop = true;
ClampLeft = true;
ClampBottom = true;
ClampRight = true;

activationCode = function()
{
    return place_meeting(x, y, obj_player);
};
