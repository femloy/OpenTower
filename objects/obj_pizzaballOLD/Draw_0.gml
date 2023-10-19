draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha);
if (state == states.golf)
{
	var _xx = lengthdir_x(128, m_angle);
	var _yy = lengthdir_y(128, m_angle);
	draw_sprite(spr_ball_move, 0, player.x + _xx, player.y + _yy);
	if (meter)
	{
		var _mt = (m_meter / 1) * 100;
		draw_healthbar(player.x - (50 * image_xscale), player.y - 32, player.x - (40 * image_xscale), player.y + 32, _mt, 0, 16711680, 255, 3, true, true);
	}
}
