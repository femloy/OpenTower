scene = -2;
scenebuffer = 0;
instance_destroy(obj_pigtotal);
draw_set_font(lang_get_font("creditsfont"));
draw_set_halign(fa_left);
draw_set_valign(fa_top);
text = scr_compile_icon_text(lang_get_value("menu_skip"));
showtext = false;
skipbuffer = 0;
startbuffer = false;
with (instance_create(room_width / 2, room_height / 2, obj_logoprop))
{
	depth = -1;
	sprite_index = spr_intro_tourdepizza;
}
with obj_player
	state = states.titlescreen;
