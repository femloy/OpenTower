draw_set_font(lang_get_font("bigfont"));
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white);

var c = (key_select == -1 ? c_white : c_gray);
draw_text_colour((SCREEN_WIDTH / 2) - 250, 50, lang_get_value("option_back"), c, c, c, c, 1);

var i1 = 0;
if controller
	i1 = 4;

for (var i = i1; i < array_length(input); i++)
{
	var b = input[i];
	
	var val;
	if !controller
		val = variable_global_get(b[0]);
	else
		val = variable_global_get(concat(b[0], "C"));
	if selecting && key_select == i
		val = -1;
	
	c = (key_select == i ? c_white : c_gray);
	var yy = 50 + (50 * (i - i1));
	var i2 = i;
	if controller && i >= 8
		i2++;
	draw_sprite_ext(spr_controlicons, i2, ((SCREEN_WIDTH / 2) - 60), yy, 1, 1, 0, c, 1);
	
	if !controller
	{
		if val != -4
			draw_text_color((SCREEN_WIDTH / 2) + 100, yy, scr_keyname(val), c, c, c, c, 1);
	}
	else if val != -4
	{
		var index = scr_get_gamepadicon(val);
		if index != -4
			draw_sprite_ext(spr_tutorialgamepad, index, (SCREEN_WIDTH / 2) + 90, yy - 16, 1, 1, 0, c, 1);
		else
			draw_text_color((SCREEN_WIDTH / 2) + 100, yy, lang_get_value("option_press"), c, c, c, c, 1);
	}
	else
		draw_text_color((SCREEN_WIDTH / 2) + 100, yy, lang_get_value("option_none"), c, c, c, c, 1);
}
