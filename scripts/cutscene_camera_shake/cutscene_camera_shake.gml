function cutscene_camera_shake(mag, mag_acc)
{
	with (obj_camera)
	{
		shake_mag = mag;
		shake_mag_acc = mag_acc;
	}
	cutscene_end_action();
}
