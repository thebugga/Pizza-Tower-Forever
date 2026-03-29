eso_calc_fit(3);
eso_fit_scale = max(eso_fit_scale, 1);
var _cx = 160 * eso_fit_scale;
var _cy = obj_screensizer.actual_height - ((540 - captain_y) * eso_fit_scale);
var _cny = obj_screensizer.actual_height - ((540 - canon_y) * eso_fit_scale);
draw_sprite_ext(canon_sprite, canon_index, _cx + (64 * eso_fit_scale), _cny, eso_fit_scale, eso_fit_scale, 0, c_white, 1);
draw_sprite_ext(captain_sprite, captain_index, _cx, _cy, eso_fit_scale, eso_fit_scale, 0, c_white, 1);
