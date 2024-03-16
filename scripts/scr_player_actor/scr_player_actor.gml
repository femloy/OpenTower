function scr_player_actor()
{
	if (sprite_index == spr_player_givepizza || sprite_index == spr_player_gnomecutscene2)
	{
		if (image_index > image_number - 1)
			image_index = image_number - 1;
	}
	cutscene = true;
	movespeed = 0;
	var _room_x = 0;
	var _room_y = 0;
	var _room_w = room_width;
	var _room_h = room_height;
	if room == custom_lvl_room && cam != -4
	{
		_room_x = cam.x;
		_room_y = cam.y;
		_room_w = cam_width;
		_room_h = cam_height;
	}
	if float
	{
		hsp = 0;
		vsp = 0;
	}
	x = clamp(x, _room_x, _room_w);
	y = clamp(y, _room_y, _room_h);
	if (room == boss_vigilante && (sprite_index == spr_player_pistolshotend || sprite_index == spr_noise_duelend))
	{
		if actorbuffer > 0
			actorbuffer--;
		else
		{
			landAnim = false;
			state = states.normal;
		}
	}
}
