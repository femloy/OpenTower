function EditorLevel() constructor
{
	static destroy = function()
	{
		ds_list_destroy(rooms);
	};
	rooms = ds_list_create();
	current_room = -4;
	previous_room = -4;
	name = "Default";
}
function new_empty_level()
{
	var l = new EditorLevel();
	var r = new EditorRoom(0, 0);
	ds_list_add(l.rooms, r);
	l.current_room = r;
	return l;
}
function get_current_room()
{
	return global.current_level.current_room;
}
