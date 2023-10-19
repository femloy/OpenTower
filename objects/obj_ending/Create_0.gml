state = 0; // not an enum
snd = fmod_event_create_instance("event:/sfx/ending/towercollapse");
credits = [
	[-4, lang_get_value_newline("credits_game")],
	[-4, string_replace_all(lang_get_value_newline("credits_music"), "%", "\"")],
	[-4, string_replace_all(lang_get_value_newline("credits_sfx"), "%", "\"")],
	[-4, string_replace_all(lang_get_value_newline("credits_mort"), "%", "\"")],
	[-4, string_replace_all(lang_get_value_newline("credits_playtester1"), "%", "\"")],
	[-4, string_replace_all(lang_get_value_newline("credits_playtester2"), "%", "\"")],
	[-4, string_replace_all(lang_get_value_newline("credits_playtester3"), "%", "\"")],
	[-4, string_replace_all(lang_get_value_newline("credits_playtester4"), "%", "\"")],
	[0, -4],
	[1, -4],
	[2, -4],
	[3, -4],
	[4, -4],
	[5, -4],
	[6, -4],
	[7, -4],
	[9, -4],
	[10, -4],
	[11, -4],
	[12, -4],
	[-4, lang_get_value_newline("credits_fmod")]
];
for (var i = 0; i < array_length(credits); i++)
{
	if (credits[i][0] == 7)
	{
		if (!global.johnresurrection)
			credits[i][0] = 8;
		break;
	}
}
bgalpha = 3;
credits_pos = 0;
draw_set_font(lang_get_font("creditsfont"));
draw_set_halign(fa_left);
draw_set_valign(fa_top);
skiptext = scr_compile_icon_text(lang_get_value("menu_skip"));
showtext = false;
fade = 0;
whitefade = 0;
image_speed = 0.35;
puffbuffer = 0;
introbuffer = 0;
spawn_arr = [
	spr_forknight_walk,
	spr_slimemove,
	spr_pepgoblin,
	spr_ancho,
	spr_pizzagoblin_walk,
	spr_badrat_walk,
	spr_banditochicken_chase,
	spr_tank_walk,
	spr_bigcheese_walk,
	spr_canongoblin_walk,
	spr_robot_walk,
	spr_coolpinea,
	spr_fencer_charge,
	spr_farmer1_walk,
	spr_farmer2_walk,
	spr_peasanto_walk,
	spr_ghostknight_move,
	spr_ghoul_attack,
	spr_golfburger_walk,
	spr_golfdemon_walk,
	spr_indiancheese_walk,
	spr_kentukybomber_move,
	spr_kentukykenny_walk,
	spr_ufolive,
	spr_archergoblin_walk,
	spr_patroller_walk,
	spr_pepbat_move,
	spr_pickle_walk,
	spr_pizzaball_roll,
	spr_pizzard_walk,
	spr_pizzice_walk,
	spr_robot_walk,
	spr_sausageman_walk,
	spr_pizzaslug_walk,
	spr_newpizzice_walk,
	spr_soldier_walk,
	spr_swedishmonkey_walk,
	spr_shrimp_walk,
	spr_treasureguy_escape
];
with (instance_create(0, 0, obj_introprop))
{
	sprite_index = spr_towerending_bg;
	depth = -3;
}
with (instance_create(0, 0, obj_introprop))
{
	sprite_index = spr_towerending;
	depth = -7;
}
with (instance_create(0, 0, obj_introprop))
{
	sprite_index = spr_towerending_bosses;
	depth = -8;
}
with (instance_create(145, 345, obj_introprop))
{
	sprite_index = spr_towerending_mrstick;
	depth = -8;
}
with (instance_create(369, 409, obj_introprop))
{
	sprite_index = spr_towerending_gustavo;
	depth = -8;
}
with (instance_create(484, 386, obj_introprop))
{
	sprite_index = spr_towerending_brick;
	depth = -8;
}
with (instance_create(288, 408, obj_introprop))
{
	sprite_index = spr_towerending_peppino;
	depth = -9;
}
towerID = instance_create(468, 188, obj_introprop);
with (towerID)
{
	hitY = y - 100;
	depth = -5;
	sprite_index = spr_towerending_tower;
}
with (obj_player)
	state = states.titlescreen;
depth = -10;
