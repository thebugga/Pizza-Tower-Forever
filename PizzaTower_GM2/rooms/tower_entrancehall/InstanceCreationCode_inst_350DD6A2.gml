if obj_player1.character == "Peppino"
{
	dialog[0] = dialog_create("this place fucking sucks peppino", dia_gustavo_idle, bg_letterbox2, "GUSTAVO");
	dialog[1] = dialog_create("you should kys", dia_gustavo_idle, bg_letterbox2, "GUSTAVO");
	dialog[2] = dialog_create("oh ok", dia_peppino_idle, bg_letterbox2, "PEPPINO");
}
if obj_player1.character == "Pepperman"
{
	sprite_index = spr_shawn_idle
	dialog[0] = dialog_create("i love you pepperfman", dia_placehold_idle, bg_letterbox2, "SHAWN");
	dialog[1] = dialog_create("whats a pepperman", dia_placehold_idle, bg_letterbox2, "PEPEPRMAN");
	dialog[2] = dialog_create("awwwwww", dia_placehold_idle, bg_letterbox2, "SHAWN");
}
if obj_player1.character == "Noise"
{
	sprite_index = spr_playerO_idle
	dialog[0] = dialog_create("woag", dia_placehold_idle, bg_letterbox2, "MR. ORANGE");
	dialog[1] = dialog_create("woag!", dia_placehold_idle, bg_letterbox2, "NOISE");
	dialog[0] = dialog_create("woag...", dia_placehold_idle, bg_letterbox2, "MR. ORANGE");
}