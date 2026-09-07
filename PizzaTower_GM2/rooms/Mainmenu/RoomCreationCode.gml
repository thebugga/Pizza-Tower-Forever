global.gameframe_caption_text = lang_get_value("caption_mainmenu");
with (instance_create(0, 0, obj_loadingscreen))
{
	group_arr = ["hudgroup", "baddiegroup", "levelstructuregroup", "menugroup"];
	offload_arr = ["introgroup"];
}
instance_destroy(obj_pigtotal);
instance_destroy(obj_swapmodefollow);
with (obj_player)
{
	state = states.titlescreen;
}