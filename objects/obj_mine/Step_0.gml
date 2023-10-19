if (place_meeting(x, y, obj_player) && image_speed == 0)
{
	fmod_event_one_shot_3d("event:/sfx/misc/mine", x, y);
	image_speed = 0.35;
}
if (floor(image_index) == (image_number - 1))
	instance_destroy();
