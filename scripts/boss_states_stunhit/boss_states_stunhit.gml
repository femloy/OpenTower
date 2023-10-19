function state_boss_stun()
{
	stunned -= 1;
	if (stuntouchbuffer > 0)
		stuntouchbuffer--;
	sprite_index = stunfallspr;
	image_speed = 0.35;
	if ((grounded || (grounded && !place_meeting(x, y, obj_platform))) && vsp > 0)
	{
		if (thrown == 1 && hp <= 0 && destroyable)
			instance_destroy();
		grav = 0.5;
		hsp = 0;
	}
	if (place_meeting(x, y + 1, obj_railh))
		hsp = -5;
	else if (place_meeting(x, y + 1, obj_railh2))
		hsp = 5;
	if (place_meeting(x - image_xscale, y, obj_solid) && !place_meeting(x - image_xscale, y, obj_destructibles))
	{
		particle_set_scale(particle.impact, -image_xscale, 1);
		create_particle(x, y, particle.impact, 0);
		if (thrown == 1 && hp <= 0 && destroyable)
			instance_destroy();
		grav = 0.5;
		image_xscale *= -1;
		var mv = movespeed;
		hsp = -image_xscale * mv;
	}
	if (grounded && vsp > 0)
	{
		image_index = 0;
		sprite_index = walkspr;
		state = states.walk;
	}
}
