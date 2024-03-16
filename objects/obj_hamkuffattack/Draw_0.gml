if state == 0
{
	if ydir == -1
		draw_self()
	var x1 = x
	var y1 = (y + 29)
	if sprite_index == spr_hamkuff_chain2
	{
		x1 = (x + (15 * image_xscale))
		y1 = (y + 33)
	}
	var dis = point_distance(x1, y1, playerid.x, playerid.y)
	var w = 24
	var len = (dis div w)
	var dir = point_direction(x1, y1, playerid.x, (playerid.y + 16))
	var xx = lengthdir_x(w, dir)
	var yy = lengthdir_y(w, dir)
	for (var i = 0; i < len; i++)
		draw_sprite_ext(spr_hamkuff_sausage, -1, (x1 + (xx * i)), (y1 + (yy * i)), 1, 1, dir, image_blend, 1)
	if ydir == 1
		draw_self()
}
else
{
	draw_self()
	if state == 1
		draw_sprite_ext(spr_chargeeffectenemy, chargeindex, (x + (image_xscale * 20)), y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
}
