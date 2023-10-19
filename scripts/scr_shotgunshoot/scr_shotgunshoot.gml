function scr_shotgunshoot()
{
	input_buffer_shoot = 0;
	fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
	with (instance_create(x, y, obj_pistoleffect))
		image_xscale = other.xscale;
	sprite_index = spr_shotgunshoot;
	state = states.shotgunshoot;
	if (grounded)
		movespeed = 0;
	jumpAnim = true;
	image_index = 0;
	with (instance_create(x + (xscale * 46), y + 6, obj_shotgunblast))
	{
		image_xscale = other.xscale;
		with (bulletID)
			image_xscale = other.image_xscale;
	}
}
