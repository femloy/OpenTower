draw_sprite(spr_mrpinch_body, 0, x, y);
var len = point_distance(x, y, drawhandx, drawhandy);
var dir = point_direction(x, y, drawhandx, drawhandy);
var xx = x;
var yy = y;
var armcount = 4;
for (var i = 0; i < armcount; i++)
{
	if i != 0 && i != armcount
		draw_sprite(spr_mrpinch_arm, -1, xx, yy);
	xx += lengthdir_x(len / armcount, dir);
	yy += lengthdir_y(len / armcount, dir);
}
draw_self();
draw_sprite_ext(spr_hand, hand_index, drawhandx, drawhandy, hand_xscale, 1, 0, c_white, 1);
