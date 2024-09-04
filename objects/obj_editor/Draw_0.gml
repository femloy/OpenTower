if current_room == -4
	exit;
array_sort(current_room.backgrounds, function()
{
	return argument1.depth - argument0.depth;
});
var arr = current_room.backgrounds;
for (var i = 0; i < array_length(arr); i++)
{
	if arr[i].depth >= 0
		draw_set_alpha(1);
	else
		draw_set_alpha(0.1);
	arr[i].draw(current_room);
}
draw_set_alpha(1);
draw_set_color(c_ltgray);
var w = 1 * zoom;
for (var yy = 0; yy < current_room.height; yy += 32)
	draw_line_width(current_room.x, current_room.y + yy, current_room.x + current_room.width, current_room.y + yy, w);
for (var xx = 0; xx < current_room.width; xx += 32)
	draw_line_width(current_room.x + xx, current_room.y, current_room.x + xx, current_room.y + current_room.height, w);
draw_set_color(c_white);
w = 2 * zoom;
draw_line_width(current_room.x, current_room.y, current_room.x + current_room.width, current_room.y, w);
draw_line_width(current_room.x, current_room.y, current_room.x, current_room.y + current_room.height, w);
draw_line_width(current_room.x, current_room.y + current_room.height, current_room.x + current_room.width, current_room.y + current_room.height, w);
draw_line_width(current_room.x + current_room.width, current_room.y, current_room.x + current_room.width, current_room.y + current_room.height, w);
with obj_editorobject
	event_perform(ev_draw, ev_draw_normal);
with obj_component
	event_perform(ev_draw, ev_draw_normal);
