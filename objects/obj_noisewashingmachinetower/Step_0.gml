if (grounded && vsp > 0)
{
	fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y);
	fmod_event_one_shot_3d("event:/sfx/pep/jump", x, y);
	vsp = -11;
	image_index = 0;
	instance_create(x, y + 43, obj_bangeffect);
	create_particle(x, y, particle.highjumpcloud1);
}
if (floor(image_index) == (image_number - 1))
	image_index = image_number - 1;
mask_index = spr_player_mask;
scr_collide();
