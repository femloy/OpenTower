function scr_player_morthook()
{
	jumpstop = true;
	doublejump = false;
	hsp = 0;
	vsp = 0;
	if (!instance_exists(morthookID))
	{
		state = states.mortjump;
		sprite_index = spr_fall;
		exit;
	}
	image_speed = 0.35;
	x = Approach(x, morthookID.x, movespeed);
	y = Approach(y, morthookID.y, movespeed);
	if (floor(x) == morthookID.x && floor(y) == morthookID.y)
	{
		fmod_event_one_shot_3d("event:/sfx/mort/doublejump", x, y);
		state = states.mortjump;
		sprite_index = spr_mortdoublejumpstart;
		image_index = 0;
		vsp = -14;
		repeat 4
			create_debris(x, y, spr_feather);
		with (instance_create(x, y, obj_speedlinesup))
			playerid = other.id;
		movespeed = xscale * 12;
		with morthookID
			projectilebuffer = 20;
	}
	if (sprite_index == spr_playerN_mortthrow && floor(image_index) == image_number - 1)
		image_index = image_number - 1;
}
