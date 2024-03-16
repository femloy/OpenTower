function scr_player_slap()
{
	if !grounded
	{
		fallinganimation++;
		if fallinganimation >= 40 && fallinganimation < 80
		{
			sprite_index = spr_player_facestomp;
			state = states.jump;
		}
	}
	move = key_left + key_right;
	if sprite_index != spr_player_slapdash
	{
		if (!place_meeting(x, y + 1, obj_railparent))
			hsp = move * movespeed;
		else
		{
			var _railinst = instance_place(x, y + 1, obj_railparent);
			hsp = (move * movespeed) + (_railinst.movespeed * _railinst.dir);
		}
	}
	else
		hsp = xscale * movespeed;
	if sprite_index != spr_player_slapdash
	{
		if (move == 0 || scr_solid(x + hsp, y))
			movespeed = 0;
		if move != 0 && movespeed < 4
			movespeed += 0.25;
		if movespeed > 4
			movespeed -= 0.25;
		if (((scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1)) && !place_meeting(x + sign(hsp), y, obj_slope))
			movespeed = 0;
	}
	landAnim = false;
	if key_slap2 && sprite_index != spr_player_slapup && sprite_index != spr_player_slapdash
		slapbuffer = 0;
	if slapbuffer < 8
		slapbuffer++;
	if sprite_index != spr_player_slapup && sprite_index != spr_player_slapdash
	{
		if (floor(image_index) == image_number - 1 && slapbuffer < 8)
		{
			if grounded && move == 0
			{
				if slaphand == 1
					sprite_index = spr_player_slap1;
				if slaphand == -1
					sprite_index = spr_player_slap2;
			}
			else if grounded && move != 0
			{
				if slaphand == 1
					sprite_index = spr_player_slaprun1;
				if slaphand == -1
					sprite_index = spr_player_slaprun2;
			}
			else
			{
				if slaphand == 1
					sprite_index = spr_player_slap1air;
				if slaphand == -1
					sprite_index = spr_player_slap2air;
			}
			image_index = 0;
			slaphand *= -1;
		}
		if grounded && move == 0
		{
			if slaphand == 1
				sprite_index = spr_player_slap1;
			if slaphand == -1
				sprite_index = spr_player_slap2;
		}
		else if grounded && move != 0
		{
			if slaphand == 1
				sprite_index = spr_player_slaprun1;
			if slaphand == -1
				sprite_index = spr_player_slaprun2;
		}
		else
		{
			if slaphand == 1
				sprite_index = spr_player_slap1air;
			if slaphand == -1
				sprite_index = spr_player_slap2air;
		}
	}
	if (floor(image_index) == 1 && !instance_exists(obj_slaphitbox2))
	{
		if sprite_index == spr_player_slapup
		{
			with (instance_create(x, y, obj_slaphitbox2))
				sprite_index = spr_player_hitboxslapup;
		}
		else
			instance_create(x, y, obj_slaphitbox2);
	}
	if (floor(image_index) == image_number - 1 && slapbuffer == 8)
	{
		if mach2 >= 35
			state = states.mach2;
		else if mach2 >= 100
			state = states.mach3;
		else if grounded
		{
			if move != 0
				dir = move;
			state = states.normal;
		}
		else if !grounded
		{
			if move != 0
				dir = move;
			sprite_index = spr_player_fall;
			state = states.jump;
		}
	}
	if (!instance_exists(obj_cloudeffect) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
		instance_create(x, y + 43, obj_cloudeffect);
	image_speed = 0.35;
}
