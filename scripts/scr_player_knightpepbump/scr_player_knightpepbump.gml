function scr_player_knightpepbump()
{
	alarm[5] = 2;
	alarm[7] = 60;
	hsp = -xscale * movespeed;
	if grounded && vsp > 0
	{
		state = states.knightpep;
		sprite_index = spr_knightpepland;
		image_index = 0;
		fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
		create_particle(x, y, particle.landcloud, 0);
		if hurted
			hurted = false;
	}
	if floor(image_index) == image_number - 1
		image_index = image_number - 1;
}
