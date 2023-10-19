scene = 0;
timer = 0;
loop = false;
if (string_letters(room_get_name(room)) != "forest")
{
	if (instance_number(object_index) > 1)
		instance_destroy();
}
