var spr = spr_characterselectP;
if !global.swapmode
{
	if ready
		spr = spr_characterselectPselected;
	if selected == 1
	{
		spr = spr_characterselectN;
		if ready
			spr = spr_characterselectNselected;
	}
}
else
{
	spr = spr_player1cursor;
	if ready
		spr = spr_player1cursorselected;
}

var x1 = 344;
var x2 = 528;
var xx = x1;
var yy = 94;
if selected == 1
	xx = x2;

draw_set_font(lang_get_font("bigfont"));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var txt = lang_get_value_newline("swap_press_start");
txt = string_replace_all(txt, "%", lang_get_value("start_button_steam"));

if global.swapmode && obj_inputAssigner.player_input_device[0] == -2
	tdp_draw_text(xx + irandom_range(-1, 1), yy + irandom_range(-1, 1), txt);
else
	draw_sprite(spr, -1, xx, yy);

if global.swapmode
{
	spr = spr_player2cursor;
	if ready
		spr = spr_player2cursorselected;
	if obj_inputAssigner.player_input_device[0] == obj_inputAssigner.player_input_device[1]
	{
		spr = spr_player1cursor;
		if ready
			spr = spr_player1cursorselected;
	}
	
	xx = x2;
	if selected == 1
		xx = x1;
	
	if obj_inputAssigner.player_input_device[0] >= -1 && obj_inputAssigner.player_input_device[1] == -2
		tdp_draw_text(xx + irandom_range(-1, 1), yy + irandom_range(-1, 1), txt);
	else if obj_inputAssigner.player_input_device[1] >= -1
		draw_sprite(spr, -1, xx, yy);
}
tdp_text_commit(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
