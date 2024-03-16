gameframe_update();
if global.option_unfocus_mute
{
	if (window_has_focus())
		fmod_set_parameter("focus", 1, false);
	else
		fmod_set_parameter("focus", 0, false);
}
else
	fmod_set_parameter("focus", 1, false);
