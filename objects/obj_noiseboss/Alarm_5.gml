flash = true;
if (sprite_index != spr_doise_deadair && sprite_index != spr_playerN_animatronic && state != states.fightball && state != states.phase1hurt && state != states.ending && !ballooncrash && (!instance_exists(obj_noiseballooncrash) || !obj_player1.ispeppino))
	fmod_event_one_shot_3d("event:/sfx/misc/bossvulnerable", x, y);
