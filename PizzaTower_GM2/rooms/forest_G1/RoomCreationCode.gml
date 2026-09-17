
global.roommessage = "PIZZA TOWER ISLAND";
var lay_id = layer_get_id("Assets_1");
var gus = layer_sprite_get_id(lay_id, "graphic_606CD6FF");
var noise = layer_sprite_get_id(lay_id, "graphic_1D834491");

layer_sprite_alpha(gus, obj_player1.character == "Peppino");
layer_sprite_alpha(noise, obj_player1.character == "Noise");
