function scr_player_handstandjump()
{
	landAnim = false;
	hsp = xscale * movespeed;
	move = key_left + key_right;
	momemtum = true;
	dir = xscale;
	if global.attackstyle != 3
	{
		if movespeed < 10
		{
			if ((sprite_index == spr_player_pistolshot || sprite_index == spr_shotgun_shot) && movespeed < 8)
				movespeed += 0.25;
			else if sprite_index == spr_player_lunge && movespeed < 12
				movespeed += 0.8;
			else if movespeed < 10
				movespeed += 0.5;
		}
	}
	else
	{
		if movespeed < 10
		{
			if ((sprite_index == spr_player_pistolshot || sprite_index == spr_shotgun_shot) && movespeed < 8)
				movespeed += 0.25;
			else if movespeed < 10
				movespeed += 0.5;
		}
		if (global.pummeltest && !instance_exists(lungeattackID))
		{
			with (instance_create(x, y, obj_lungehitbox))
			{
				playerid = other.id;
				other.lungeattackID = id;
			}
		}
	}
	if shoot == 1
		var attackdash = spr_player_pistolshot;
	else
		attackdash = spr_suplexdash;
	if (sprite_index == spr_player_lungestart && floor(image_index) == image_number - 1)
		sprite_index = spr_player_lunge;
	var airattackdash = spr_suplexdashjump;
	var airattackdashstart = spr_suplexdashjumpstart;
	if global.attackstyle == 2
		vsp = 0;
	if !key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0
	{
		vsp /= 20;
		jumpstop = true;
	}
	if input_buffer_jump > 0 && can_jump && !key_down && global.attackstyle != 2
	{
		fmod_event_instance_play(rollgetupsnd);
		input_buffer_jump = 0;
		particle_set_scale(particle.jumpdust, xscale, 1);
		create_particle(x, y, particle.jumpdust, 0);
		jumpstop = false;
		image_index = 0;
		vsp = -11;
		state = states.mach2;
		sprite_index = spr_longjump;
	}
	if sprite_index == attackdash && !grounded
	{
		image_index = 0;
		sprite_index = airattackdashstart;
	}
	if (grounded && sprite_index == airattackdash && (!key_attack || character == "N") && global.attackstyle != 2)
	{
		if global.attackstyle != 3
		{
			state = states.normal;
			if move != xscale
				movespeed = 2;
		}
		else
		{
			sprite_index = attackdash;
			image_index = image_number - 6;
		}
	}
	if grounded && sprite_index == airattackdash && key_attack && character != "N" && global.attackstyle != 2
		state = states.mach2;
	if (floor(image_index) == image_number - 1 && sprite_index == attackdash)
		state = states.normal;
	if (floor(image_index) == image_number - 1 && sprite_index == airattackdashstart)
		sprite_index = airattackdash;
	if (floor(image_index) == image_number - 1 && key_attack && sprite_index == attackdash)
	{
		image_speed = 0.35;
		state = states.mach2;
		grav = 0.5;
	}
	if (scr_mach_check_dive() && grounded && global.attackstyle != 2)
	{
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale;
		movespeed = 12;
		crouchslipbuffer = 25;
		grav = 0.5;
		sprite_index = spr_crouchslip;
		image_index = 0;
		machhitAnim = false;
		state = states.tumble;
		fmod_event_instance_play(snd_crouchslide);
	}
	mask_index = spr_player_mask;
	if ((!grounded && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles)) || (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_metalblock) && scr_slope()))
	{
		var _climb = true;
		if !ispeppino
			_climb = ledge_bump(32, abs(hsp) + 1);
		if _climb
		{
			wallspeed = 6;
			grabclimbbuffer = 10;
			state = states.climbwall;
		}
	}
	if (grounded && scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
	{
		var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
		if _bump
		{
			fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y);
			jumpstop = true;
			state = states.jump;
			vsp = -4;
			sprite_index = spr_suplexbump;
			instance_create(x + (xscale * 10), y + 10, obj_bumpeffect);
		}
	}
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
	{
		with (instance_create(x, y, obj_slidecloud))
			image_xscale = other.xscale;
	}
	image_speed = 0.35;
	if state != states.bump && move != xscale && move != 0
	{
		image_index = 0;
		if !grounded
		{
			fmod_event_one_shot_3d("event:/sfx/pep/grabcancel", x, y);
			sprite_index = spr_suplexcancel;
			jumpAnim = true;
			grav = 0.5;
			state = states.jump;
		}
		else
		{
			state = states.normal;
			movespeed = 2;
			grav = 0.5;
		}
	}
}
