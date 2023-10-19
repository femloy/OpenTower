direction = angle_rotate(direction, point_direction(x, y, player.x, player.y), 2);
count++;
image_angle = direction;
if (sprite_index == spr_piraneapple_projectile)
	speed = Approach(speed, 4, 0.1);
else
	speed = Approach(speed, 4, 0.2);
if (sprite_index == spr_piraneapple_projectile && image_angle > 90)
	image_yscale = -1;
else
	image_yscale = 1;
if (sprite_index == spr_bazooka_missile)
{
	if (!fmod_event_instance_is_playing(snd))
		fmod_event_instance_play(snd);
	fmod_event_instance_set_3d_attributes(snd, x, y);
}
