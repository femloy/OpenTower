function scr_player_ratmountgroundpound()
{
	if sprite_index == spr_player_ratmountgroundpound
	{
		if floor(image_index) == image_number - 1
			sprite_index = spr_player_ratmountgroundpoundfall;
	}
	move = key_left + key_right;
	hsp = movespeed;
	if brick == 1
	{
		state = states.ratmountjump;
		sprite_index = spr_player_ratmountfall;
	}
	if gustavokicktimer > 0
		gustavokicktimer--;
	if gustavokicktimer == 0
	{
		if sprite_index == spr_lonegustavo_jumpstart
		{
			vsp = -11;
			instance_create(x, y - 20, obj_bangeffect);
		}
		else
			instance_create(x + (xscale * 50), y + 20, obj_bangeffect);
		gustavokicktimer = -1;
	}
	if sprite_index == spr_lonegustavo_jumpstart && gustavokicktimer > 0
	{
		vsp = 0;
		hsp = 0;
	}
	if move != 0
	{
		if sprite_index == spr_lonegustavo_groundpoundland
			movespeed = Approach(movespeed, move * ratmount_movespeed, 0.25);
		else
			movespeed = Approach(movespeed, move * ratmount_movespeed, 0.5);
	}
	else
		movespeed = Approach(movespeed, 0, 0.5);
	if (sprite_index == spr_lonegustavo_groundpoundstart && floor(image_index) == image_number - 1)
	{
		image_index = 0;
		sprite_index = spr_lonegustavo_groundpound;
	}
	if (sprite_index == spr_lonegustavo_groundpound || sprite_index == spr_lonegustavo_groundpoundstart)
	{
		vsp++;
		if (grounded && vsp > 0 && !place_meeting(x, y + vsp + 2, obj_grindrail) && !place_meeting(x, y + 10, obj_grindrail) && !place_meeting(x, y + vsp, obj_destructibles) && !place_meeting(x, y + vsp + 2, obj_destructibles) && !place_meeting(x, y + 10, obj_destructibles))
		{
			if (scr_slope())
			{
				with (instance_place(x, y + 1, obj_slope))
				{
					other.xscale = -sign(image_xscale);
					other.state = states.ratmount;
					other.movespeed = other.xscale * 8;
					with (instance_create(other.x, other.y, obj_jumpdust))
						image_xscale = -sign(other.image_xscale);
				}
			}
			else
			{
				if move != 0
					movespeed = xscale * 3;
				fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
				sprite_index = spr_lonegustavo_groundpoundland;
				image_index = 0;
				jumpAnim = true;
				jumpstop = false;
				with obj_camera
				{
					shake_mag = 5;
					shake_mag_acc = 15 / room_speed;
				}
				if freefallsmash >= 10
				{
					with obj_baddie
					{
						if (shakestun && grounded && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0 && !invincible && groundpound)
						{
							state = states.stun;
							if stunned < 60
								stunned = 60;
							vsp = -11;
							image_xscale *= -1;
							hsp = 0;
							momentum = 0;
						}
					}
					with obj_camera
					{
						shake_mag = 10;
						shake_mag_acc = 30 / room_speed;
					}
					combo = 0;
					bounce = false;
				}
				create_particle(x, y + 3, particle.groundpoundeffect, 0);
			}
		}
	}
	if (sprite_index == spr_lonegustavo_groundpoundland && floor(image_index) == image_number - 1)
	{
		if (sign(hsp) != 0)
			xscale = sign(hsp);
		sprite_index = spr_lonegustavo_idle;
		state = states.ratmount;
	}
	if ((sprite_index == spr_lonegustavo_kick || sprite_index == spr_lonegustavo_jumpstart) && floor(image_index) == image_number - 1)
	{
		if (sign(hsp) != 0)
			xscale = sign(hsp);
		if sprite_index == spr_lonegustavo_kick
			sprite_index = spr_player_ratmountgroundpoundfall;
		else
			sprite_index = spr_lonegustavo_jump;
		state = states.ratmount;
	}
	image_speed = 0.35;
	if punch_afterimage > 0
		punch_afterimage--;
	else
	{
		punch_afterimage = 5;
		with (create_mach3effect(x, y, sprite_index, image_index, true))
			image_xscale = other.xscale;
	}
}
