if (fall == 0)
{
	if (image_xscale == 1)
		x = Approach(x, 64, 1);
	if (image_xscale == -1)
		x = Approach(x, room_width - 64, 1);
}
if (fall == 1)
	x += (image_xscale * 7);
fmod_event_instance_set_3d_attributes(snd, x, y);
