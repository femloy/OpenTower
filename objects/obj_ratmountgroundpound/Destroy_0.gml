with (instance_create(x, y, obj_brickcomeback))
{
	vsp = -4;
	sprite_index = spr_ratmountgroundpound_dead;
}
with (obj_camera)
{
	shake_mag = 10;
	shake_mag_acc = 30 / room_speed;
}
repeat (3)
{
	with (create_debris(x, y, spr_slapstar))
	{
		hsp = random_range(-5, 5);
		vsp = random_range(-10, 10);
	}
}
instance_create(x, y, obj_bangeffect);
create_particle(x, y + 3, particle.groundpoundeffect, 0);
