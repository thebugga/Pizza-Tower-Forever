var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
draw_sprite_ext(sprite1122, 0, cx, cy, SCREEN_WIDTH / 64, SCREEN_HEIGHT / 64, 0, c_white, 1);

var i = 0;
if (is_holiday(holidays.halloween))
	i = 1;
draw_sprite(spr_mainmenu_bg, i, obj_screensizer.normal_size_fix_x, 0);

with obj_explosioneffect
	draw_self();

shader_set(global.Pal_Shader);
var _x = SCREEN_WIDTH * 0.50625;
var _y = y;
var pal = obj_player.paletteselect;
var tex = -4;
if currentselect != -1
{
	pal = global.game[currentselect].palette;
	tex = global.game[currentselect].palettetexture;
}
draw_set_alpha(extrauialpha);

var qx = 0;
var qy = 0;

draw_set_font(lang_get_font("bigfont"));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var options_x = SCREEN_WIDTH * (273 / 320);
var options_y = 84;
lang_draw_sprite(spr_controlseggplant, 0, options_x, options_y);
scr_draw_text_arr(options_x - 88, options_y - 37, start_key, c_white);

var status_x = 183;
var status_y = 312;
var percentstate_x = 199;
var percentstate_y = 450;
var deletefile_x = 779;
var deletefile_y = 449;
var papersize = 1;
var papercolor = c_gray;
var paperalpha = 0.5;


for (i = -1; i < array_length(global.game); i++)
{
	var game = i == -1 ? game_empty() : menu_get_game(i);
	var middle_x = (SCREEN_WIDTH / 2) + (i * (SCREEN_WIDTH / 4)) - (visualselect * (SCREEN_WIDTH / 4))
	
	var character_index = 0	
	//if game.character == "P" || game.character == "PUP"
	//	character_index = 1
	//if game.character == "N"
	//	character_index = 2
	//if game.character == "V"
	//	character_index = 3
	//if game.character == "M"
	//	character_index = 4
	//if game.character == "D"
	//	character_index = 6
	draw_sprite_ext(spr_mainmenu_paper, character_index, middle_x, 150, 1, 1, 0, c_white, 1)
	if game.character == "PUP"
		draw_sprite_ext(spr_mainmenu_charms, 0, middle_x, 150, 1, 1, 0, c_white, 1)
	
	if game.character != ""
	{
		draw_set_font(global.combofont);
		lang_draw_sprite(spr_towerstatusmenu, 0, middle_x, 228);
		draw_text_transformed(middle_x + 8, 238, floor(game.percentage), 1, 1, 0);
		papersize = 1;
		papercolor = c_gray;
		paperalpha = 0.5;
	}
	else
	{
		papersize = 1.2;
		papercolor = c_white;
		paperalpha = 1;
	}
	
}
draw_set_alpha(extrauialpha);

if state != states.titlescreen && state != states.transitioncutscene
{
	var selecterG = (currentselect == -1 ? game_empty() : menu_get_game(currentselect))

	pizzaboy_alpha = Approach(pizzaboy_alpha, selecterG.character != "", 0.1)
	judgement_alpha = Approach(judgement_alpha, selecterG.judgement != "none", 0.1)
	john_alpha = Approach(john_alpha, selecterG.john, 0.1)
	snotty_alpha = Approach(snotty_alpha, selecterG.snotty, 0.1)

	var judge_spr = spr_menu_finaljudgement;
	if selecterG.character == "N"
		judge_spr = spr_menu_finaljudgementN;
	var judge_i = 0;
	switch selecterG.judgement
	{
		case "confused": judge_i = 0; break;
		case "quick": judge_i = 1; break;
		case "officer": judge_i = 2; break;
		case "yousuck": judge_i = 3; break;
		case "nojudgement": judge_i = 4; break;
		case "notbad": judge_i = 5; break;
		case "wow": judge_i = 6; break;
		case "holyshit": judge_i = 7; break;
	}

	draw_sprite_ext(spr_percentstatemenu, selecterG.perstatus_icon, 480, percentstate_y, 1, 1, 0, c_white, pizzaboy_alpha);
	lang_draw_sprite_ext(judge_spr, judge_i, 480, percentstate_y + 50, 1, 1, 0, c_white, judgement_alpha);
	draw_sprite_ext(spr_menu_approvedjohn, 0, 400, percentstate_y, 1, 1, 0, c_white, john_alpha);
	draw_sprite_ext(spr_menu_approvedsnotty, 0, 560, percentstate_y, 1, 1, 0, c_white, snotty_alpha);
}


lang_draw_sprite(spr_deletefile, 0, deletefile_x, deletefile_y);
var dal = 0.5;
if currentselect != -1
	dal = 1;
scr_draw_text_arr(deletefile_x - 67, deletefile_y, taunt_key, c_white, dal);
draw_set_alpha(1);