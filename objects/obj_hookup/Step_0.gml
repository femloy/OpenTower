fmod_event_instance_set_3d_attributes(snd, x, y);
if appear > 0
	appear--;
else if appear == 0
{
	appear = -1;
	create_particle(x, y, particle.genericpoofeffect);
}
else if hooked
{
	if (place_meeting(x, y - 50, obj_solid))
		instance_destroy();
	if (!blinking && place_meeting(x, y - 200, obj_solid))
	{
		blinking = true;
		alarm[0] = 1;
	}
	if blinking
	{
		movespeed = Approach(movespeed, 0, 0.35);
		if movespeed <= 0
			instance_destroy();
	}
	y -= movespeed;
	with obj_player
	{
		if (state == states.ladder && place_meeting(x, y, other))
			y -= 5;
	}
	if y < -50
		instance_destroy();
	with obj_player1
	{
		if (hooked && state == states.ladder && place_meeting(x, y, other))
		{
			x = other.x + 16;
			y = other.y + 40;
		}
	}
}
