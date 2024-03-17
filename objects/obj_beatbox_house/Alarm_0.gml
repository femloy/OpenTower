alarm[0] = 40;
with instance_create(x + random_range(-70, 70), y + random_range(-70, 70), obj_notes)
{
	depth = other.depth - 1;
	sprite_index = spr_breakdancenotes_house;
}
