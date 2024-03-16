scr_collide();
if grounded && vsp > 0
	hsp = Approach(hsp, 0, 0.5);
grabindex += 0.35;
if (!obj_player1.ispeppino || (global.swapmode && global.pistol))
{
	create_particle(x, y, particle.genericpoofeffect);
	instance_destroy(id, false);
	if room == boss_pizzaface
	{
		with obj_music
		{
			if music != noone
				fmod_event_instance_set_parameter(music.event, "state", 1.4, true);
		}
	}
}
