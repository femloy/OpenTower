with (other)
{
	var f = 10;
	var _sound = false;
	if (state == states.mach2 || state == states.mach3 || state == states.trashroll || state == states.crouch || state == states.handstandjump || state == states.tumble)
		_sound = true;
	if (hsp != 0 && grounded && vsp > 0)
	{
		if ((floor(image_index) % f) == 0)
			create_debris(x, y + 43, spr_sewerdebris2);
		if (_sound)
		{
			if (steppybuffer > 0)
				steppybuffer--;
			else
			{
				if (state == states.crouch)
					steppybuffer = 16;
				else
					steppybuffer = 10;
				fmod_event_one_shot_3d("event:/sfx/pep/stepinshit", x, y);
			}
		}
	}
}
