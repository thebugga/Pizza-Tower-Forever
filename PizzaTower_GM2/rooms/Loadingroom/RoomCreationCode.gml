pal_swap_init_system(shd_pal_swapper, shd_pal_html_sprite, shd_pal_html_surface);
global.roommessage = "PIZZA TOWER WESTERN BUILD V3";
global.longintro = true;
tdp_text_init();
global.holiday = holidays.normal;
var date = date_current_datetime();
var month = date_get_month(date);
var day = date_get_day(date);
if (month == 10 || (month == 11 && day <= 14))
{
	global.holiday = holidays.halloween;
}