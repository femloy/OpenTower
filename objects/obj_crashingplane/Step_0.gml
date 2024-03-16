if y > 750
{
	with obj_camera
	{
		shake_mag = 20;
		shake_mag_acc = 40 / room_speed;
	}
	instance_destroy();
}
