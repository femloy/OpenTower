function scr_player_ratmounttumble()
{
	hsp = xscale * movespeed;
	move = key_left + key_right;
	sprite_index = spr_player_ratmountwalljump;
	image_speed = -abs(movespeed) / 15;
	if !key_attack
		movespeed = Approach(movespeed, 0, 1);
	if (scr_slope() && hsp != 0)
		scr_player_addslopemomentum(0.25, 0.25);
	if (abs(hsp) <= 2)
		state = states.ratmount;
	if ((place_meeting(x + hsp, y, obj_solid) && !scr_solid_slope(x + hsp, y) && !place_meeting(x + hsp, y, obj_rollblock) && !place_meeting(x + hsp, y, obj_rattumble) && !place_meeting(x + hsp, y, obj_destructibles)) || place_meeting(x, y, obj_timedgate))
	{
		state = states.ratmounthurt;
		vsp = -5;
		movespeed = 3;
	}
	if !jumpstop && vsp < 0.5 && !key_jump2
	{
		vsp /= 10;
		jumpstop = true;
	}
	if key_jump && brick && key_up
	{
		state = states.ratmountgroundpound;
		sprite_index = spr_lonegustavo_jumpstart;
		image_index = 0;
		image_speed = 0.35;
		gustavokicktimer = 5;
		brick = false;
		movespeed = hsp;
		with (instance_create(x, y + 50, obj_ratmountgroundpound))
		{
			image_xscale = other.xscale;
			image_index = 0;
		}
	}
	if input_buffer_jump > 0 && can_jump
	{
		input_buffer_jump = 0;
		particle_set_scale(particle.highjumpcloud2, xscale, 1);
		create_particle(x, y, particle.highjumpcloud2, 0);
		scr_fmod_soundeffect(jumpsnd, x, y);
		vsp = -11;
		jumpstop = false;
	}
}
