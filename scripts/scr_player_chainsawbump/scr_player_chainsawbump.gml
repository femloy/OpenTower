function scr_player_chainsawbump()
{
	hsp = xscale * movespeed;
	move = key_right + key_left;
	if (hsp != 0 && movespeed > 0 && (sprite_index == spr_player_chainsawrev || sprite_index == spr_player_chainsawidle) && grounded)
		movespeed--;
	if sprite_index == spr_player_chainsawidle && move != 0
		xscale = move;
	if (floor(image_index) == image_number - 1 && sprite_index == spr_player_chainsawrev)
		sprite_index = spr_player_chainsawidle;
	if !key_chainsaw && sprite_index == spr_player_chainsawidle
	{
		vsp = -5;
		sprite_index = spr_player_chainsawdashstart;
	}
	if (floor(image_index) == image_number - 1 && sprite_index == spr_player_chainsawdashstart)
	{
		with (instance_create(x, y, obj_superdashcloud))
			image_xscale = other.xscale;
		particle_set_scale(particle.crazyrunothereffect, xscale, 1);
		create_particle(x, y, particle.crazyrunothereffect, 0);
		image_index = 0;
		sprite_index = spr_player_chainsawdash;
		if movespeed < 12
			movespeed = 12;
	}
	if sprite_index == spr_player_chainsawdash && movespeed < 20
		movespeed += 0.1;
	if (place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + xscale, y, obj_destructibles))
	{
		if sprite_index != spr_player_chainsawhitwall
		{
			with obj_camera
			{
				shake_mag = 10;
				shake_mag_acc = 30 / room_speed;
			}
			vsp = -6;
			movespeed = -4;
			sprite_index = spr_player_chainsawhitwall;
			image_index = 0;
		}
	}
	if key_jump && grounded
	{
		jumpstop = false;
		vsp = -11;
		state = states.mach2;
		sprite_index = spr_mach2jump;
	}
	if (!instance_exists(obj_chainsawpuff))
		instance_create(x, y, obj_chainsawpuff);
	if (floor(image_index) == image_number - 1 && (sprite_index == spr_player_chainsawhit || sprite_index == spr_player_chainsawdash))
	{
		if key_attack
			state = states.mach2;
		else
			state = states.normal;
	}
	if (floor(image_index) == image_number - 1 && sprite_index == spr_player_chainsawhitwall)
		state = states.normal;
	if sprite_index == spr_player_chainsawdash
		image_speed = 0.4 + (movespeed * 0.01);
	else
		image_speed = 0.4;
}
