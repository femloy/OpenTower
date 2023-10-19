with (instance_create(x, y, obj_sausageman_dead))
	sprite_index = other.sprite_index;
with (obj_player)
{
	if (state == states.supergrab)
		state = states.normal;
	state = states.normal;
	targetRoom = tower_finalhallway;
	targetDoor = "A";
	instance_create_unique(0, 0, obj_fadeout);
}
