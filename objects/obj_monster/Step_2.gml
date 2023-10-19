xs = image_xscale;
if (y > (room_height + (sprite_height * 2)))
{
	instance_destroy();
	fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, obj_player1.y);
	with (obj_camera)
	{
		shake_mag = 5;
		shake_mag_acc = 15 / room_speed;
	}
}
