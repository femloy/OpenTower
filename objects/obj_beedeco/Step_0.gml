var _x = x;
if obj_player.state != states.backbreaker
{
	timer += 20;
	sprite_index = spr_beedeco;
	x = Wave(xstart - disx, xstart + disx, time_x, offset_x, timer);
	y = Wave(ystart - disy, ystart + disy, time_y, offset_y, timer);
	if x != _x
		image_xscale = sign(x - _x);
}
else
	sprite_index = spr_beedecotaunt;
last_current_time = current_time;
