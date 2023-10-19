function scr_enemy_ghostpossess()
{
	var _move = 0;
	with (playerid)
	{
		sprite_index = spr_ghostidle;
		x = other.x;
		y = other.y;
		_move = key_left + key_right;
		if (key_up2)
		{
			state = states.ghost;
			vsp = -10;
			other.state = states.stun;
			other.stunned = 50;
			create_particle(x, y, particle.genericpoofeffect, 0);
			visible = true;
		}
	}
	if (sprite_index != spr_forknight_ragestart && sprite_index != spr_forknight_rageloop && sprite_index != spr_cheeseslime_rage && sprite_index != spr_indiancheese_howl)
	{
		image_speed = 0.35;
		if (_move != 0)
			possess_movespeed = Approach(possess_movespeed, 6, 0.5);
		else
			possess_movespeed = 0;
		hsp = _move * possess_movespeed;
		if (hsp != 0)
		{
			image_xscale = sign(hsp);
			if (sprite_index != spr_indiancheese_jump)
				sprite_index = walkspr;
		}
		else if (sprite_index != spr_indiancheese_jump)
			sprite_index = idlespr;
		switch (object_index)
		{
			case obj_forknight:
				if (playerid.key_slap2)
				{
					ragedash = 50;
					flash = true;
					create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
					sprite_index = spr_forknight_ragestart;
					image_index = 0;
					hsp = 0;
				}
				break;
			case obj_cheeseslime:
				if (playerid.key_slap2)
				{
					ragedash = 100;
					sprite_index = spr_cheeseslime_rage;
					image_index = 0;
					flash = true;
					create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
					hsp = 0;
				}
				break;
			case obj_indiancheese:
				if (playerid.key_jump)
					playerid.input_buffer_jump = 0;
				if (playerid.input_buffer_jump < 8 && grounded && vsp > 0)
				{
					playerid.input_buffer_jump = 8;
					vsp = -11;
					sprite_index = spr_indiancheese_jump;
				}
				if (sprite_index == spr_indiancheese_jump)
				{
					if (floor(image_index) == (image_number - 1))
						image_index = image_number - 1;
					if (grounded && vsp > 0)
						sprite_index = idlespr;
				}
				if (playerid.key_slap2)
				{
					sprite_index = spr_indiancheese_howl;
					image_index = 0;
					hsp = 0;
					ragedash = 50;
					shot = false;
					flash = true;
					create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
				}
				break;
		}
	}
	else
	{
		switch (object_index)
		{
			case obj_forknight:
				image_speed = 0.6;
				if (ragedash > 0)
					ragedash--;
				if (sprite_index == spr_forknight_ragestart)
				{
					hsp = 0;
					vsp = 0;
					if (floor(image_index) == (image_number - 1))
						sprite_index = spr_forknight_rageloop;
				}
				if (sprite_index == spr_forknight_rageloop)
				{
					hsp = image_xscale * 8;
					var dir = image_xscale * 8;
					with (instance_place(x + dir, y, obj_destructibles))
						instance_destroy();
					with (instance_place(x + dir, y, obj_baddie))
					{
						if (destroyable)
							instance_destroy();
					}
				}
				if (ragedash <= 0)
					sprite_index = spr_forknight_walk;
				break;
			case obj_cheeseslime:
				image_speed = 0.5;
				if (floor(image_index) > 10)
				{
					hsp = image_xscale * 8;
					with (instance_place(x + (image_xscale * 8), y, obj_baddie))
					{
						if (destroyable)
							instance_destroy();
					}
				}
				else
					hsp = 0;
				if (floor(image_index) == (image_number - 1))
					sprite_index = spr_slimemove;
				break;
			case obj_indiancheese:
				hsp = 0;
				if (ragedash > 0)
					ragedash--;
				else
					sprite_index = spr_indiancheese_walk;
				if (ragedash < 30 && !shot)
				{
					shot = true;
					with (instance_create(x, y, obj_arcprojectile))
					{
						image_xscale = other.image_xscale;
						hsp = image_xscale * 6;
						vsp = -8;
						team = 1;
						baddieID = other.id;
					}
				}
				break;
		}
	}
}
