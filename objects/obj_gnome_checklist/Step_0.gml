if start
{
	yy -= start_spd;
	if yy <= 326
	{
		yy = 326;
		start = false;
	}
}
else if finish
{
	yy += finish_spd;
	if yy >= 755
		instance_destroy();
}
if global.panic == true
	finish = true;
var hide = false;
with obj_player
{
	if (x > (room_width - 215) && y > (room_height - 215))
		hide = true;
}
if (camera_get_view_x(view_camera[0]) >= (room_width - camera_get_view_width(view_camera[0])))
	hide = true;
if hide
{
	if image_alpha > 0.5
		image_alpha -= 0.1;
	else
		image_alpha = 0.5;
}
else if image_alpha < 1
	image_alpha += 0.1;
else
	image_alpha = 1;
if (room == timesuproom || !global.showgnomelist)
	visible = false;
else
	visible = true;
