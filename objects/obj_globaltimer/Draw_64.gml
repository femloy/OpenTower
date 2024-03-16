if (!global.option_timer || room == Realtitlescreen || room == Longintro || room == Finalintro || room == Mainmenu || room == hub_loadingscreen || room == Creditsroom || room == Johnresurrectionroom || room == rank_room || room == characterselect || instance_exists(obj_titlecard) || !global.option_hud)
	exit;
if (!global.option_hud || (instance_exists(obj_debugcontroller) && !obj_debugcontroller.showhud))
	exit;
if (instance_exists(obj_swapunlocked))
	exit;
if (instance_exists(obj_pause) && obj_pause.pause && !global.option_speedrun_timer)
	exit;
draw_set_color(c_white);
var seconds = 0;
var minutes = 0;
if global.option_timer_type == 0
{
	seconds = global.level_seconds;
	minutes = global.level_minutes;
}
else if (global.option_timer_type == 1 || global.option_timer_type == 2)
{
	seconds = global.file_seconds;
	minutes = global.file_minutes;
}
var str = [scr_get_timer_string(minutes, seconds, true)];
if global.option_timer_type == 2
	array_push(str, scr_get_timer_string(global.level_minutes, global.level_seconds, true));
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(global.smallfont);
draw_set_alpha(1);
draw_set_color(c_white);
var yy = 0;
for (var i = array_length(str) - 1; i >= 0; i--)
{
	var b = str[i];
	if !global.option_speedrun_timer
		b = string_copy(b, 0, string_length(b) - 2);
	var len = string_length(b) - 1;
	draw_text(SCREEN_WIDTH - (len * string_width("A")), SCREEN_HEIGHT - 8 - (string_height("A") * yy), b);
	yy++;
}
