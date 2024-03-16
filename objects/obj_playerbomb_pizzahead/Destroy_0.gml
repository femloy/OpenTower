with (instance_create(targetx, targety, obj_explosioneffect))
{
	image_speed = 0.4;
	sprite_index = spr_bombexplosion;
	depth = other.depth - 1;
	scr_sound_multiple("event:/sfx/playerN/rushdownhit", x, y);
	if other.punchcount <= 0
		fmod_event_one_shot_3d("event:/sfx/playerN/rushdownend", x, y);
}
with target
{
	hsp = (10 * other.image_xscale) * other.image_yscale;
	if other.subhpshot == 0
		pizzahead_subhp--;
}
with obj_camera
{
	shake_mag = 10;
	shake_mag_acc = 15 / room_speed;
}
