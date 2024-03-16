direction = angle_rotate(direction, point_direction(x, y, player.x, player.y), 1.5);
if x != player.x
	image_xscale = sign(player.x - x);
fmod_event_instance_set_3d_attributes(snd, x, y);
