flash = true;
if (state != states.fightball && state != states.phase1hurt && state != states.finale && !ballooncrash && !instance_exists(obj_noiseballooncrash))
	fmod_event_one_shot_3d("event:/sfx/misc/bossvulnerable", x, y);
