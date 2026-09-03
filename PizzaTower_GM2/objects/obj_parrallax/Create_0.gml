bg = bg_desert;
bg2 = bg_null;
bg3 = bg_null;
bg_scrollx = 0;
bg_scrolly = 0;
bg_scrollxoffset = 0;
bg_scrollyoffset = 0;
bg_scroll2x = 0;
bg_scroll2y = 0;
bg_scroll2xoffset = 0;
bg_scroll2yoffset = 0;
bg_1xoffset = 0;
bg_1yoffset = 0;
bg_2xoffset = 0;
bg_2yoffset = 0;
fg1_x = 0;
fg1_y = 0;
backgrounds = ["Backgrounds_still1", "Backgrounds_still2"];
timer = 0;
var _groundFunc = function(_cam)
{	
	return
	{
		x : _cam.x * intensity,
		y : y
	};
}

layers = 
{
	Assets_BG2 : new parallaxLayer("Assets_BG2", .1, 202),
	Assets_BG1 : new parallaxLayer("Assets_BG1", .05, 201),
	Backgrounds_1 : new parallaxLayer("Backgrounds_1", .25),
	Backgrounds_2 : new parallaxLayer("Backgrounds_2", .2),
	Backgrounds_3 : new parallaxLayer("Backgrounds_3", .15),
	
	Backgrounds_Ground1 : new parallaxLayer("Backgrounds_Ground1", .2, _groundFunc),
	Backgrounds_Ground2 : new parallaxLayer("Backgrounds_Ground2", .18, _groundFunc),
	Backgrounds_Ground3 : new parallaxLayer("Backgrounds_Ground3", .16, _groundFunc),
};