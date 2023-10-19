if (!instance_exists(baddieID))
{
	instance_destroy();
	exit;
}
x = baddieID.x + (xoffset * baddieID.image_xscale);
y = baddieID.y + yoffset;
if (baddieID.image_xscale > 0)
	image_angle = 0;
else
	image_angle = 180;
patrolalert_index += 0.35;
if (patrolalert_index > 2)
	patrolalert_index = frac(patrolalert_index);
var points = get_triangle_points(x, y, image_angle, len, size);
var _col = false;
if (!instance_exists(obj_jumpscare))
{
	with (obj_player)
	{
		if (rectangle_in_triangle(bbox_left, bbox_top, bbox_right, bbox_bottom, other.x, other.y, points[0], points[1], points[2], points[3]))
			_col = true;
	}
}
collision = _col;
