var a = 0.008;
var _max = 0.5;
var _min = 0;
if (fadein)
{
	image_alpha = Approach(image_alpha, _max, a);
	if (image_alpha >= _max)
		fadein = false;
}
else
{
	image_alpha = Approach(image_alpha, _min, a);
	if (image_alpha <= _min)
		fadein = true;
}
x = camera_get_view_x(view_camera[0]) * 0.2;
x += xoffset;
xoffset += 1;
y = camera_get_view_y(view_camera[0]) * 0.2;
