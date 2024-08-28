key_select = -1;
select_visual = 0;
selecting = false;
player = 0;
depth = -200;
scr_init_input();
stickpressed = false;
key_back = false;
startbuffer = 2;
addbuffer = 0;
draw_set_font(lang_get_font("creditsfont"));
draw_set_halign(fa_left);
draw_set_valign(fa_top);
tip = scr_compile_icon_text(lang_get_value_newline("option_binding_tip"));
input = [
	["player_up"],
	["player_down"],
	["player_right"],
	["player_left"],
	["player_jump"],
	["player_slap"],
	["player_attack"],
	["player_taunt"],
	["menu_start"],
	["player_superjump"],
	["player_groundpound"],
	["menu_up", "control_menu_up"],
	["menu_down", "control_menu_down"],
	["menu_right", "control_menu_right"],
	["menu_left", "control_menu_left"],
	["menu_select", "control_menu_confirm"],
	["menu_back", "control_menu_back"],
	["menu_quit", "control_menu_quit"],
	["menu_delete", "control_menu_delete"]
];
menu = false;
controller = false;
