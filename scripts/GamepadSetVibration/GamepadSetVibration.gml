function GamepadSetVibration(player, left_motor, right_motor, force)
{
	with (obj_inputAssigner)
		setVibration(player, left_motor, right_motor, force);
}
