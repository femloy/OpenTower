if other.hp > 0
{
	array_push(baddie_arr, [other.id, other.object_index]);
	instance_destroy();
}
