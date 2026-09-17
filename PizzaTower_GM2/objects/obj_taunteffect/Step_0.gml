if (instance_exists(player) && player.state != "backbreaker" && player.sprite_index != player.spr_taunt)
{
	instance_destroy();
}
x = player.x;
y = player.y;
image_xscale = player.xscale;
