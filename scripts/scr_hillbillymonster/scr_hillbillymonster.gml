function scr_hillbilly_idle()
{
	sprite_index = idlespr;
	if ((global.monsterspeed >= 1 && point_in_camera(x, y, view_camera[0])) || distance_to_pos(x, y, playerinst.x, playerinst.y, 480, 270))
	{
		state = states.chase;
		image_xscale = (playerinst.x > x) ? 1 : -1;
	}
}
function scr_hillbilly_chase()
{
	if hsp != 0
		sprite_index = chasespr;
	else
		sprite_index = chasespr_idle;
	hsp = Approach(hsp, image_xscale * movespeed, accel);
	if (!distance_to_pos(x, y, playerinst.x, playerinst.y, threshold_idle_x, threshold_idle_y))
		state = states.normal;
	if (playerinst.x > (x - 16) && playerinst.x < (x + 16))
		hsp = 0;
	dir = (playerinst.x > x) ? 1 : -1;
	if (dir != image_xscale && playerinst.x > (x - slide_threshold_x) && playerinst.x < (x + slide_threshold_x))
	{
		state = states.machslide;
		hsp = image_xscale * movespeed;
	}
}
function scr_hillbilly_machslide()
{
	sprite_index = skidspr;
	if (abs(hsp) > 0)
	{
		if hsp < 0.5
			hsp += deccel;
		else if hsp > 0.5
			hsp -= deccel;
		else
			hsp = 0;
	}
	else
	{
		image_xscale = (playerinst.x > x) ? 1 : -1;
		state = states.chase;
	}
}
function scr_hillbilly_detect()
{
	hsp = 0;
	sprite_index = idlespr;
	var _col = collision_line(x, y, playerinst.x, playerinst.y, obj_solid, false, true);
	var _player_colX = playerinst.x > (x - threshold_x) && playerinst.x < (x + threshold_x);
	var _player_colY = playerinst.y > (y - threshold_y) && playerinst.y < (y + threshold_y);
	if _col == noone && _player_colX && _player_colY
	{
		image_xscale = (playerinst.x > x) ? 1 : -1;
		state = states.chase;
		sprite_index = chasespr;
		image_index = 0;
	}
}
function scr_hillbilly_destroyables()
{
	with obj_woodenwalls
	{
		if (place_meeting(x - other.hsp, y, other.id))
			instance_destroy();
		if (place_meeting(x, y - other.vsp, other.id))
			instance_destroy();
	}
}
