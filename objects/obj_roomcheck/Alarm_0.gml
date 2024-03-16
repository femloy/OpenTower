alarm[0] = 5;
if (room_pos < (array_length(room_arr) - 1))
{
	with obj_player
		trapid = -4;
	instance_destroy(obj_trapghost);
	trace("Testing room: ", room_get_name(room_arr[room_pos]));
	room_goto(room_arr[room_pos]);
	room_pos++;
}
else
	instance_destroy();
