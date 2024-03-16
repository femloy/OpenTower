function scr_player_mort()
{
	move = key_right + key_left;
	hsp = movespeed;
	mort = false;
	doublejump = false;
	jumpstop = false;
	if move != 0
	{
		if move == xscale
			movespeed = Approach(movespeed, xscale * 8, 0.8);
		else
			movespeed = Approach(movespeed, 0, 0.8);
		if movespeed <= 0
			xscale = move;
	}
	else
		movespeed = Approach(movespeed, 0, 0.8);
	if move != 0 && grounded && vsp > 0
	{
		if steppybuffer > 0
			steppybuffer--;
		else
		{
			create_particle(x, y + 43, particle.cloudeffect, 0);
			steppybuffer = 16;
		}
	}
	if (abs(movespeed) < 3 && move != 0)
		image_speed = 0.35;
	else if (abs(movespeed) > 3 && movespeed < 6)
		image_speed = 0.45;
	else
		image_speed = 0.6;
	if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope))
	{
		movespeed = 0;
		if sprite_index == spr_player_barrelmove
			sprite_index = spr_player_barrelidle;
	}
	if !landAnim
	{
		if move != 0
			sprite_index = spr_playermortwalk;
		else
		{
			sprite_index = spr_playermortidle;
			image_speed = 0.35;
		}
	}
	else if floor(image_index) == image_number - 1
	{
		landAnim = false;
		if move != 0
			sprite_index = spr_playermortwalk;
		else
			sprite_index = spr_playermortidle;
	}
	if !grounded
	{
		state = states.mortjump;
		sprite_index = spr_playermortjump;
	}
	else if input_buffer_jump > 0
	{
		input_buffer_jump = 0;
		state = states.mortjump;
		doublejump = false;
		vsp = -11;
		sprite_index = spr_playermortjumpstart;
		image_index = 0;
		scr_fmod_soundeffect(jumpsnd, x, y);
		create_particle(x, y, particle.highjumpcloud2, 0);
	}
	mort_attack();
}
function mort_attack()
{
	if !ispeppino
	{
		if input_buffer_slap > 0
		{
			input_buffer_slap = 0;
			state = states.mortattack;
			sprite_index = spr_playerN_mortthrow;
			image_index = 0;
			if move != 0
				xscale = move;
			targethsp = hsp;
			targetvsp = vsp;
			mortprojectileID = instance_create(x, y, obj_mortprojectile);
			fmod_event_one_shot_3d("event:/sfx/mort/throw", x, y);
		}
		exit;
	}
	if input_buffer_slap > 0
	{
		input_buffer_slap = 0;
		state = states.mortattack;
		sprite_index = spr_player_mortattackfront;
		image_index = 0;
		if move != 0
			xscale = move;
		var _angle = 0;
		if key_up
		{
			_angle = 90;
			sprite_index = spr_player_mortattackup;
		}
		else if key_down && !grounded
		{
			if !grounded
				vsp = 3;
			_angle = 270;
			sprite_index = spr_player_mortattackdown;
		}
		else
			movespeed = xscale * 10;
		var xsc = xscale;
		var spr = sprite_index;
		with (instance_create(x, y, obj_morthitbox))
		{
			playerid = other.id;
			if _angle == 0
				image_xscale = other.xscale;
			image_angle = _angle;
			with (instance_create(x, y, obj_parryeffect))
			{
				follow = true;
				if spr == spr_player_mortattackup
					sprite_index = spr_mortswingup;
				else if spr == spr_player_mortattackdown
					sprite_index = spr_mortswingdown;
				else
					sprite_index = spr_mortswing;
				image_xscale = xsc;
			}
			alarm[0] = 15;
		}
	}
	if (sprite_index == spr_player_mortattackdown || sprite_index == spr_player_mortattackup || sprite_index == spr_player_mortattack)
	{
		if punch_afterimage > 0
			punch_afterimage--;
		else
		{
			punch_afterimage = 5;
			with (create_mach3effect(x, y, sprite_index, image_index, true))
			{
				image_xscale = other.xscale;
				playerid = other.id;
			}
		}
	}
	if sprite_index == spr_player_mortattackfront
		fmod_event_one_shot_3d("event:/sfx/mort/side", x + hsp, y);
	else if sprite_index == spr_player_mortattackup
		fmod_event_one_shot_3d("event:/sfx/mort/up", x, y + vsp);
	else if sprite_index == spr_player_mortattackdown
		fmod_event_one_shot_3d("event:/sfx/mort/down", x, y + vsp);
}
function Mort_DownMovement()
{
	if image_angle == 270
	{
		with playerid
		{
			if ispeppino
			{
				doublejump = false;
				vsp = -14;
			}
		}
	}
}
