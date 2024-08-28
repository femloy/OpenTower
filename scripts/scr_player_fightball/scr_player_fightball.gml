function scr_player_fightball()
{
	image_speed = 0.4;
	if (noisecrusher || isgustavo)
		instance_create_unique(x, y, obj_swapgusfightball);
	if place_meeting(x, y + 1, obj_railparent)
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		railmovespeed = _railinst.movespeed;
		raildir = _railinst.dir;
	}
	hsp = (xscale * movespeed) + (railmovespeed * raildir);
	if movespeed <= 20
		movespeed += 0.1;
	if (place_meeting(x + sign(hsp), y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock)
	{
		instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
		fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
		fmod_event_one_shot_3d("event:/sfx/playerN/fightball", x, y);
		xscale *= -1;
		if key_jump2_p2 || key_jump2
		{
			scr_fmod_soundeffect(jumpsnd, x, y);
			jumpstop = false;
			vsp = -14;
		}
	}
	if !key_attack || !key_fightball
	{
		if !key_attack
			swap_player(false);
		state = states.mach3;
		sprite_index = spr_mach4;
		if isgustavo
		{
			state = states.ratmount;
			ratmount_movespeed = abs(movespeed);
			if ratmount_movespeed < 12
				ratmount_movespeed = 12;
			movespeed = ratmount_movespeed * xscale;
		}
		with obj_tv
		{
			state = states.tv_whitenoise;
			tv_trans = 0;
			expressionsprite = -4;
		}
	}
	if !jumpstop && vsp < 0 && ((jump_p2 && !key_jump2_p2) || (!jump_p2 && !key_jump2))
	{
		jumpstop = true;
		vsp /= 20;
	}
	if key_jump_p2 || key_jump
	{
		if key_jump_p2
			jump_p2 = true;
		else
			jump_p2 = false;
		input_buffer_jump = 10;
	}
	if can_jump && input_buffer_jump > 0
	{
		input_buffer_jump = 0;
		vsp = -11;
		jumpstop = false;
		scr_fmod_soundeffect(jumpsnd, x, y);
		particle_set_scale(particle.jumpdust, xscale, 1);
		create_particle(x, y, particle.jumpdust, 0);
	}
	var b = false;
	with obj_hamkuff
	{
		if state == states.blockstance && playerid == other.id
			b = true;
	}
	if !instance_exists(dashcloudid) && grounded && !b
	{
		var water = place_meeting(x, y + 1, obj_water);
		with instance_create(x, y, obj_superdashcloud)
		{
			instance_create(obj_player.x, obj_player.y, obj_slapstar);
			image_xscale = other.xscale;
			if water
				sprite_index = spr_watereffect;
			other.dashcloudid = id;
		}
	}
	if !instance_exists(chargeeffectid)
	{
		with instance_create(x, y, obj_chargeeffect)
		{
			playerid = other.object_index;
			other.chargeeffectid = id;
		}
	}
	if fightball_snd_buffer > 0
		fightball_snd_buffer--;
	else
	{
		fightball_snd_buffer = 15;
		fmod_event_one_shot_3d("event:/sfx/playerN/fightball", x, y);
	}
	if fightball_buffer1 > 0
		fightball_buffer1--;
	else
	{
		fightball_buffer1 = 20 + irandom(8);
		repeat irandom(4) + 1
			instance_create(x + irandom_range(-60, 60), y + irandom_range(-20, 60), obj_gusbrickcloud);
	}
	if fightball_buffer2 > 0
		fightball_buffer2--;
	else
	{
		fightball_buffer2 = 8 + irandom(5);
		with create_debris(x, y, spr_slapstar)
			vsp = -irandom_range(5, 10);
		with create_debris(x, y, spr_baddiegibs)
			vsp = -irandom_range(5, 10);
	}
}
