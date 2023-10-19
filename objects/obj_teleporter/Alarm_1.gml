with (obj_teleporter)
{
	if (trigger == other.trigger && start == 0)
	{
		repeat (8)
			create_particle(x + random_range(50, -50), y + random_range(50, -50), particle.teleporteffect, 0);
	}
}
with (player)
{
	fmod_event_one_shot_3d("event:/sfx/misc/teleporterend", x, y);
	visible = true;
	state = other.storedstate;
	movespeed = other.storedmovespeed;
	grav = other.storedgrav;
	image_index = other.storedimageindex;
	sprite_index = other.storedspriteindex;
	freefallsmash = other.storedfreefallsmash;
	with (instance_create(x, y, obj_parryeffect))
		sprite_index = spr_peppinoteleporteffect;
	if (place_meeting(x, y, obj_solid))
		y--;
	if (freefallsmash >= 12)
	{
		with (instance_place(x, y + 4, obj_metalblock))
			instance_destroy();
	}
}
player = -1;
