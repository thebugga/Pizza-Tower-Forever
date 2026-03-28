//show_message("initializing rich presence");
var config_file = "mods/config/Discord_Rich_Presence.ini";
var rich_presence_config = ini_open(config_file);

var discord_client_id = ini_read_string("discord", "discord_client_id", "1294242445823053896");

display_small_image = ini_read_real("text", "display_small_image", 1);

mainmenu_room = ini_read_string("text", "mainmenu_room", "Mainmenu");
mainmenu_largeimage_text = ini_read_string("text", "mainmenu_largeimage_text", "Main menu");
mainmenu_details = ini_read_string("text", "mainmenu_details", "In main menu");

tower_large_image_text = ini_read_string("text", "tower_large_image_text", "The Tower");
tower_details = ini_read_string("text", "tower_details", "In the Tower");

boss_pepperman_room = ini_read_string("text", "boss_pepperman_room", "boss_pepperman");
boss_pepperman_large_image_text = ini_read_string("text", "boss_pepperman_large_image_text", "Clashing with Pepperman");
boss_pepperman_details = ini_read_string("text", "boss_pepperman_details", "Clashing with Pepperman");

boss_vigilante_room = ini_read_string("text", "boss_vigilante_room", "boss_vigilante");
boss_vigilante_large_image_text = ini_read_string("text", "boss_vigilante_large_image_text", "Clashing with Vigilante");
boss_vigilante_details = ini_read_string("text", "boss_vigilante_details", "Clashing with Vigilante");

boss_noise_room = ini_read_string("text", "boss_noise_room", "boss_noise");
boss_noise_large_image_text = ini_read_string("text", "boss_noise_large_image_text", "Clashing with Noise");
boss_noise_details = ini_read_string("text", "boss_noise_details", "Clashing with Noise");

boss_fakepep_room = ini_read_string("text", "boss_fakepep_room", "boss_fakepep");
boss_fakepep_large_image_text = ini_read_string("text", "boss_fakepep_large_image_text", "Clashing with Fake Peppino");
boss_fakepep_details = ini_read_string("text", "boss_fakepep_details", "Clashing with Fake Peppino");

boss_pizzaface_room = ini_read_string("text", "boss_pizzaface_room", "boss_pizzaface");
boss_pizzaface_large_image_text = ini_read_string("text", "boss_pizzaface_large_image_text", "Clashing with Pizzaface");
boss_pizzaface_details = ini_read_string("text", "boss_pizzaface_details", "Clashing with Pizzaface");

entrance_str = ini_read_string("text", "entrance_str", "entrance");
entrance_large_image_text = ini_read_string("text", "entrance_large_image_text", "John Gutter");
entrance_details = ini_read_string("text", "entrance_details", "Finishing John Gutter");

medieval_str = ini_read_string("text", "medieval_str", "medieval");
medieval_large_image_text = ini_read_string("text", "medieval_large_image_text", "Pizzascape");
medieval_details = ini_read_string("text", "medieval_details", "Finishing Pizzascape");

ruin_str = ini_read_string("text", "ruin_str", "ruin");
ruin_large_image_text = ini_read_string("text", "ruin_large_image_text", "Ancient Cheese");
ruin_details = ini_read_string("text", "ruin_details", "Finishing Ancient Cheese");

dungeon_str = ini_read_string("text", "dungeon_str", "dungeon");
dungeon_large_image_text = ini_read_string("text", "dungeon_large_image_text", "Bloodsauce Dungeon");
dungeon_details = ini_read_string("text", "dungeon_details", "Finishing Bloodsauce Dungeon");

badland_str = ini_read_string("text", "badland_str", "badland");
badland_large_image_text = ini_read_string("text", "badland_large_image_text", "Oregano Desert");
badland_details = ini_read_string("text", "badland_details", "Finishing Oregano Desert");

graveyard_str = ini_read_string("text", "graveyard_str", "graveyard");
graveyard_large_image_text = ini_read_string("text", "graveyard_large_image_text", "Wasteyard");
graveyard_details = ini_read_string("text", "graveyard_details", "Finishing Wasteyard");

farm_str = ini_read_string("text", "farm_str", "farm");
farm_large_image_text = ini_read_string("text", "farm_large_image_text", "Fun Farm");
farm_details = ini_read_string("text", "farm_details", "Finishing Fun Farm");

saloon_str = ini_read_string("text", "saloon_str", "saloon");
saloon_large_image_text = ini_read_string("text", "saloon_large_image_text", "Fast Food Saloon");
saloon_details = ini_read_string("text", "saloon_details", "Finishing Fast Food Saloon");

plage_str = ini_read_string("text", "plage_str", "plage");
plage_large_image_text = ini_read_string("text", "plage_large_image_text", "Crust Cove");
plage_details = ini_read_string("text", "plage_details", "Finishing Crust Cove");

forest_str = ini_read_string("text", "forest_str", "forest");
forest_large_image_text = ini_read_string("text", "forest_large_image_text", "Gnome Forest");
forest_details = ini_read_string("text", "forest_details", "Finishing Gnome Forest");

space_str = ini_read_string("text", "space_str", "space");
space_large_image_text = ini_read_string("text", "space_large_image_text", "Deep-Dish 9");
space_details = ini_read_string("text", "space_details", "Finishing Deep-Dish 9");

minigolf_str = ini_read_string("text", "minigolf_str", "minigolf");
minigolf_large_image_text = ini_read_string("text", "minigolf_large_image_text", "GOLF");
minigolf_details = ini_read_string("text", "minigolf_details", "Finishing GOLF");

street_str = ini_read_string("text", "street_str", "street");
street_large_image_text = ini_read_string("text", "street_large_image_text", "The Pig City");
street_details = ini_read_string("text", "street_details", "Finishing The Pig City");

industrial_str = ini_read_string("text", "industrial_str", "industrial");
industrial_large_image_text = ini_read_string("text", "industrial_large_image_text", "Peppibot Factory");
industrial_details = ini_read_string("text", "industrial_details", "Finishing Peppibot Factory");

sewer_str = ini_read_string("text", "sewer_str", "sewer");
sewer_large_image_text = ini_read_string("text", "sewer_large_image_text", "Oh Shit!");
sewer_details = ini_read_string("text", "sewer_details", "Finishing Oh Shit!");

freezer_str = ini_read_string("text", "freezer_str", "freezer");
freezer_large_image_text = ini_read_string("text", "freezer_large_image_text", "Refrigerator-Refrigerador-Freezerator");
freezer_details = ini_read_string("text", "freezer_details", "Finishing Refrigerator-Refrigerador-Freezerator");

chateau_str = ini_read_string("text", "chateau_str", "chateau");
chateau_large_image_text = ini_read_string("text", "chateau_large_image_text", "Pizzascare");
chateau_details = ini_read_string("text", "chateau_details", "Finishing Pizzascare");

kidsparty_str = ini_read_string("text", "kidsparty_str", "kidsparty");
kidsparty_large_image_text = ini_read_string("text", "kidsparty_large_image_text", "Don't Make A Sound");
kidsparty_details = ini_read_string("text", "kidsparty_details", "Finishing Don't Make A Sound");

war_str = ini_read_string("text", "war_str", "war");
war_large_image_text = ini_read_string("text", "war_large_image_text", "WAR");
war_details = ini_read_string("text", "war_details", "Finishing WAR");

exit_str = ini_read_string("text", "exit_str", "exit");
exit_large_image_text = ini_read_string("text", "exit_large_image_text", "The Crumbling Tower of Pizza");
exit_details = ini_read_string("text", "exit_details", "Finishing The Crumbling Tower of Pizza");

secretworld_str = ini_read_string("text", "secretworld_str", "secretworld");
secretworld_large_image_text = ini_read_string("text", "secretworld_large_image_text", "Secrets Of The World");
secretworld_details = ini_read_string("text", "secretworld_details", "Finishing Secrets Of The World");

tutorial_str = ini_read_string("text", "tutorial_str", "tutorial");
tutorial_large_image_text = ini_read_string("text", "tutorial_large_image_text", "The Tutorial");
tutorial_details = ini_read_string("text", "tutorial_details", "Finishing The Tutorial");

// Reminder that the third argument is a default value if it can't find the key in the ini.
peppino_icon_link = ini_read_string("link", "peppino_icon_link", "https://i.imgur.com/5nT1guz.png");
noise_icon_link = ini_read_string("link", "noise_icon_link", "https://i.imgur.com/89x7EZ3.png");
gustavo_icon_link = ini_read_string("link", "gustavo_icon_link", "https://i.imgur.com/3Mkscuy.png");

mainmenu_link = ini_read_string("link", "mainmenu_link", "https://i.imgur.com/IKTrqnz.png");
tower_lobby_link = ini_read_string("link", "tower_lobby_link", "https://i.imgur.com/vOSVbbc.png");
boss_pepperman_link = ini_read_string("link", "boss_pepperman_link", "https://i.imgur.com/RrG0BYE.png");
boss_vigilante_link = ini_read_string("link", "boss_vigilante_link", "https://i.imgur.com/y4UH3Sr.png");
boss_noise_link = ini_read_string("link", "boss_noise_link", "https://i.imgur.com/re40024.png");
boss_fakepep_link = ini_read_string("link", "boss_fakepep_link", "https://i.imgur.com/yQfYXCG.png");
boss_pizzaface_link = ini_read_string("link", "boss_pizzaface_link", "https://i.imgur.com/z6akk2u.png");

level_johngutter_link = ini_read_string("link", "level_johngutter_link", "https://i.imgur.com/Smom78e.png");
level_pizzascape_link = ini_read_string("link", "level_pizzascape_link", "https://i.imgur.com/fS8aKyo.png");
level_ancientcheese_link = ini_read_string("link", "level_ancientcheese_link", "https://i.imgur.com/SdFKm8O.png");
level_bloodsaucedungeon_link = ini_read_string("link", "level_bloodsaucedungeon_link", "https://i.imgur.com/U40osKz.png");
level_oreganodesert_link = ini_read_string("link", "level_oreganodesert_link", "https://i.imgur.com/QwopVnS.png");

level_wasteyard_link = ini_read_string("link", "level_wasteyard_link", "https://i.imgur.com/gpzPu2M.png");
level_funfarm_link = ini_read_string("link", "level_funfarm_link", "https://i.imgur.com/8saeWYb.png");
level_fastfoodsalon_link = ini_read_string("link", "level_fastfoodsalon_link", "https://i.imgur.com/CqafbmC.png");
level_crustcove_link = ini_read_string("link", "level_crustcove_link", "https://i.imgur.com/tCJ5ZXB.png");
level_gnomeforest_link = ini_read_string("link", "level_gnomeforest_link", "https://i.imgur.com/ON39jgP.png");

level_deepdish9_link = ini_read_string("link", "level_deepdish9_link", "https://i.imgur.com/2sTumqU.png");
level_golf_link = ini_read_string("link", "level_golf_link", "https://i.imgur.com/jZy2zGi.png");
level_thepigcity_link = ini_read_string("link", "level_thepigcity_link", "https://i.imgur.com/AwOPs6X.png");
level_peppibotfactory_link = ini_read_string("link", "level_peppibotfactory_link", "https://i.imgur.com/7gHIDvI.png");
level_ohshit_link = ini_read_string("link", "level_ohshit_link", "https://i.imgur.com/ETe2sqA.png");

level_refrigerator_link = ini_read_string("link", "level_refrigerator_link", "https://i.imgur.com/ugByEPW.png");
level_pizzascare_link = ini_read_string("link", "level_pizzascare_link", "https://i.imgur.com/mpeaGxo.png");
level_dontmakesound_link = ini_read_string("link", "level_dontmakesound_link", "https://i.imgur.com/6C6G0Ll.png");
level_war_link = ini_read_string("link", "level_war_link", "https://i.imgur.com/DJAgY6V.png");
level_thecrumblingtowerofpizza_link = ini_read_string("link", "level_thecrumblingtowerofpizza_link", "https://i.imgur.com/roi3IAH.png");

level_secret_link = ini_read_string("link", "level_secret_link", "https://i.imgur.com/FxNWyVF.png");
level_tutorial_link = ini_read_string("link", "level_tutorial_link", "undefined");

ini_close();

discord_state = "";
discord_details = "";

small_image_text = "";
small_image_key = "";

large_image_text = "";
large_image_key = "";

fifteen_second = 900;
alarm[0] = 60 // 1 second

is_peppino = obj_player.ispeppino;
is_gustavo = obj_player.isgustavo;

peppino_str = "Peppino";
gustavo_str = "Gustavo";
noise_str = "Noise";

combo_str = "Score: ";

if (!np_initdiscord(discord_client_id, false, "0"))
{
	show_message("NekoPresence init fail.")
}

