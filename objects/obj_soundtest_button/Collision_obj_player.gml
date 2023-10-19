if (other.key_up2 && other.grounded && other.vsp > 0 && func != -4)
{
	fmod_event_one_shot_3d("event:/sfx/fakepep/step", x, y);
	func();
}
