//show_message("executing rich presence alarm");

var current_room = room_get_name(room);
var current_level = global.leveltosave;
var inlevel = false;
var boss_fight = false;

if (current_room == mainmenu_room) {
    large_image_text = mainmenu_largeimage_text;
    large_image_key = mainmenu_link;
    discord_details = mainmenu_details;
}
else {
    large_image_text = tower_large_image_text;
    large_image_key = tower_lobby_link;
    discord_details = tower_details;    
}

if (current_room == boss_pepperman_room) {
    discord_details = boss_pepperman_details;
    large_image_text = boss_pepperman_large_image_text;
    large_image_key = boss_pepperman_link;
    boss_fight = true;
}
else if (current_room == boss_vigilante_room) {
    discord_details = boss_vigilante_details;
    large_image_text = boss_vigilante_large_image_text;
    large_image_key = boss_vigilante_link;
    boss_fight = true;
}
else if (current_room == boss_noise_room) {
    discord_details = boss_noise_details;
    large_image_text = boss_noise_large_image_text;
    large_image_key = boss_noise_link;
    boss_fight = true;
}
else if (current_room == boss_fakepep_room) {
    discord_details = boss_fakepep_details;
    large_image_text = boss_fakepep_large_image_text;
    large_image_key = boss_fakepep_link;
    boss_fight = true;
}
else if (current_room == boss_pizzaface_room) {
    discord_details = boss_pizzaface_details;
    large_image_text = boss_pizzaface_large_image_text;
    large_image_key = boss_pizzaface_link;
    boss_fight = true;
}
else if (current_level != -4) {
    switch (current_level) {
        case entrance_str:
            discord_details = entrance_details;
            large_image_text = entrance_large_image_text;
            large_image_key = level_johngutter_link;
            inlevel = true;
            break;
        case medieval_str:
            discord_details = medieval_details;
            large_image_text = medieval_large_image_text;
            large_image_key = level_pizzascape_link;
            inlevel = true;
            break;
        case ruin_str:
            discord_details = ruin_details;
            large_image_text = ruin_large_image_text;
            large_image_key = level_ancientcheese_link;
            inlevel = true;
            break;
        case dungeon_str:
            discord_details = dungeon_details;
            large_image_text = dungeon_large_image_text;
            large_image_key = level_bloodsaucedungeon_link;
            inlevel = true;
            break;
        case badland_str:
            discord_details = badland_details;
            large_image_text = badland_large_image_text;
            large_image_key = level_oreganodesert_link;
            inlevel = true;
            break;
        case graveyard_str:
            discord_details = graveyard_details;
            large_image_text = graveyard_large_image_text;
            large_image_key = level_wasteyard_link;
            inlevel = true;
            break;
        case farm_str:
            discord_details = farm_details;
            large_image_text = farm_large_image_text;
            large_image_key = level_funfarm_link;
            inlevel = true;
            break;
        case saloon_str:
            discord_details = saloon_details;
            large_image_text = saloon_large_image_text;
            large_image_key = level_fastfoodsalon_link;
            inlevel = true;
            break;
        case plage_str:
            discord_details = plage_details;
            large_image_text = plage_large_image_text;
            large_image_key = level_crustcove_link;
            inlevel = true;
            break;
        case forest_str:
            discord_details = forest_details;
            large_image_text = forest_large_image_text;
            large_image_key = level_gnomeforest_link;
            inlevel = true;
            break;
        case space_str:
            discord_details = space_details;
            large_image_text = space_large_image_text;
            large_image_key = level_deepdish9_link;
            inlevel = true;
            break;
        case minigolf_str:
            discord_details = minigolf_details;
            large_image_text = minigolf_large_image_text;
            large_image_key = level_golf_link;
            inlevel = true;
            break;        
        case street_str:
            discord_details = street_details;
            large_image_text = street_large_image_text;
            large_image_key = level_thepigcity_link;
            inlevel = true;
            break;   
        case industrial_str:
            discord_details = industrial_details;
            large_image_text = industrial_large_image_text;
            large_image_key = level_peppibotfactory_link;
            inlevel = true;
            break;           
        case sewer_str:
            discord_details = sewer_details;
            large_image_text = sewer_large_image_text;
            large_image_key = level_ohshit_link;
            inlevel = true;
            break;      
        case freezer_str:
            discord_details = freezer_details;
            large_image_text = freezer_large_image_text;
            large_image_key = level_refrigerator_link;
            inlevel = true;
            break;   
        case chateau_str:
            discord_details = chateau_details;
            large_image_text = chateau_large_image_text;
            large_image_key = level_pizzascare_link;
            inlevel = true;
            break;   
        case kidsparty_str:
            discord_details = kidsparty_details;
            large_image_text = kidsparty_large_image_text;
            large_image_key = level_dontmakesound_link;
            inlevel = true;
            break;   
        case war_str:
            discord_details = war_details;
            large_image_text = war_large_image_text;
            large_image_key = level_war_link;
            inlevel = true;
            break;          
        case exit_str:
            discord_details = exit_details;
            large_image_text = exit_large_image_text;
            large_image_key = level_thecrumblingtowerofpizza_link;
            inlevel = true;
            break;      
        case secretworld_str:
            discord_details = secretworld_details;
            large_image_text = secretworld_large_image_text;
            large_image_key = level_secret_link;
            inlevel = true;
            break;             
        case tutorial_str:
            discord_details = tutorial_details;
            large_image_text = tutorial_large_image_text;
            large_image_key = level_tutorial_link;
            inlevel = true;
            break;       
    }
}

if (display_small_image)
{
    if (is_peppino) {
        small_image_text = peppino_str;
        small_image_key = peppino_icon_link;
    }
    else if (is_gustavo) {
        small_image_text = gustavo_str;
        small_image_key = gustavo_icon_link;
    }
    else {
        small_image_text = noise_str;
        small_image_key = noise_icon_link;
    }
}

if (inlevel && !boss_fight) {
    var current_score = string(global.collect);
    discord_state = combo_str + current_score;
}
else if (boss_fight) {
    var player_hp = string(obj_bosscontroller.player_hp);
    var boss_hp = string(obj_bosscontroller.boss_prevhp);

    discord_state = "HP: " + player_hp + " || Boss HP: " + boss_hp;
}

np_setpresence_more(small_image_text, large_image_text, false)
np_setpresence(discord_state, discord_details, large_image_key, small_image_key)

//Loop it
alarm[0] = fifteen_second; // 15 second delay before updating because of discord limitation
