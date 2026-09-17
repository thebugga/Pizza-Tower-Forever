if (state != "throwing")
{
	pizzaball = false;
	playerid = other.id;
	shot = false;
	state = "throwing";
	sprite_index = spr_bigcheese_throw;
	image_index = 0;
	other.state = "actor";
	other.sprite_index = other.spr_tumble;
}
