if (!instance_exists(objectID))
{
	instance_destroy();
	exit;
}
x = objectID.x;
y = objectID.y;
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var cw = camera_get_view_width(view_camera[0]);
var ch = camera_get_view_height(view_camera[0]);
var edge_x = abs(sprite_width) / 2;
var edge_y = abs(sprite_height) / 2;
var pad = 12;
yoffset = Wave(-4, 4, 2, 8);
var l = cx + edge_x + pad;
var t = cy + edge_y + pad;
var r = (cx + cw) - edge_x - pad;
var b = (cy + ch) - edge_y - pad;
x = clamp(x, l, r);
y = clamp(y, t, b);
if (!collision_rectangle(l - edge_x, t - edge_y, r + edge_x, b + edge_y, objectID, false, false))
	visible = true;
else
	visible = false;
