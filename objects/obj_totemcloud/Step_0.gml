var found_active = false;
with (obj_totem)
{
	if (trigger == other.trigger)
	{
		if (active)
			found_active = true;
	}
}
if (!active && found_active)
{
	active = true;
	sprite_index = spr_totemcloud_spawn;
	image_index = 0;
	image_speed = 0.35;
}
if (active && !found_active)
{
	active = false;
	sprite_index = spr_totemcloud_end;
	image_index = 0;
	image_speed = 0.35;
	var b = false;
	with (obj_totemcloud)
	{
		if (bbox_in_camera(view_camera[0], 50))
			b = true;
	}
}
if (!active)
	fmod_event_instance_stop(snd, true);
if (sprite_index == spr_totemcloud_spawn && floor(image_index) == (image_number - 1))
{
	sprite_index = spr_totemcloud_idle;
	alarm[0] = 40;
	shot = false;
}
if (sprite_index == spr_totemcloud_attack)
{
	if (floor(image_index) == (image_number - 1))
	{
		sprite_index = spr_totemcloud_idle;
		shot = false;
	}
	if (floor(image_index) == 11 && !shot)
	{
		shot = true;
		with (instance_create(x, y, obj_totemthunder))
		{
			cloudID = other.id;
			depth = other.depth + 1;
			alarm[0] = 25;
		}
	}
}
if (sprite_index != spr_totemcloud_end)
	image_speed = 0.35;
else if (floor(image_index) == (image_number - 1))
{
	image_index = image_number - 1;
	image_speed = 0;
}
else
	image_speed = 0.35;
