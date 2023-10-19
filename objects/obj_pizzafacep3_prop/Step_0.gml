if (use_collision)
{
	if (!start)
	{
		sprite_index = stunspr;
		if (grounded && vsp > 0)
		{
			with (obj_player1)
				sprite_index = spr_player_gnomecutscene1;
			alarm[1] = -1;
			create_particle(x, y, particle.landcloud);
			fmod_event_one_shot_3d("event:/sfx/pep/step", x, y);
			hsp = 0;
			start = true;
			if (sprite_index == spr_pepperman_scared)
				fmod_event_one_shot_3d("event:/sfx/voice/peppermanscared", x, y);
			if (sprite_index == spr_playerV_hurt)
				fmod_event_one_shot_3d("event:/sfx/voice/vigiangry", x, y);
			if (sprite_index == spr_playerN_hurt)
				fmod_event_one_shot_3d("event:/sfx/voice/noisepositive", x, y);
			if (sprite_index == spr_fakepeppino_stun)
				fmod_event_one_shot_3d("event:/sfx/voice/fakepeppositive", x, y);
		}
	}
	else
	{
		hsp = Approach(hsp, 0, 0.1);
		sprite_index = angryspr;
	}
	scr_collide();
}
else
{
	x += hsp;
	y += vsp;
	if (vsp < 20)
		vsp += grav;
	if (y > 400)
		instance_destroy();
}
