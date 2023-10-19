hsp = spd * image_xscale;
if (place_meeting(x + sign(hsp), y, obj_solid))
	instance_destroy();
scr_collide();
if (playerid != -4)
{
	with (playerid)
	{
		if (state != states.skateboardnoise)
			other.playerid = -4;
		else
		{
			x = other.x;
			y = other.y;
			hsp = 0;
			vsp = 0;
		}
	}
}
fmod_event_instance_set_3d_attributes(snd, x, y);
