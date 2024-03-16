if !debug
{
	instance_destroy()
	exit;
}
if (!instance_exists(obj_debugcontroller) && !obj_debugcontroller.DEBUG)
{
	instance_destroy();
	exit;
}

depth = -999;
commands = array_create(0);
state = 0;
movebuffer = 0;
create_command = function(_name, _args, _func)
{
	var b = 
	{
		name: _name,
		func: _func,
		args: _args
	};
	array_push(commands, b);
};

var rooms = scr_getallrooms();
for (var i = 0; i < array_length(rooms); i++)
	rooms[i] = room_get_name(rooms[i]);

create_command("NOCLIP", [], function()
{
	with obj_player1
		state = states.debugstate;
});
create_command("CHANGE_CHARACTER", [], function()
{
	with obj_player1
	{
		if character == "P"
			character = "N";
		else
			character = "P";
		scr_characterspr();
	}
});
create_command("ROOM GOTO", [rooms, ["A", "B", "C", "D", "E", "F", "G"]], function(_room, _door)
{
	_room = asset_get_index(_room);
	with obj_player
	{
		targetDoor = _door;
		lastroom = room;
		targetRoom = _room;
	}
	if (!instance_exists(obj_fadeout))
		instance_create(0, 0, obj_fadeout);
});
create_command("UNLOCK WORLD", [[1, 2, 3, 4, 5]], function(_world)
{
	ini_open_from_string(obj_savesystem.ini_str);
	for (var i = 0; i < _world; i++)
	{
		var save = concat("w", i + 1, "stick");
		ini_write_real(save, "door", true);
		ini_write_real(save, "bosskey", true);
	}
	obj_savesystem.ini_str = ini_close();
	gamesave_async_save();
});
create_command("DEBUG OVERLAY", [["TRUE", "FALSE"]], function(_toggle)
{
	if _toggle == "TRUE"
		show_debug_overlay(true);
	else
		show_debug_overlay(false);
});
create_command("SWITCH CHAR", [["NOISE", "PEP"]], function(_char)
{
	with obj_player1
	{
		character = "P";
		if _char == "NOISE"
			ispeppino = false;
		else
			ispeppino = true;
		scr_characterspr();
	}
});
selected = 0;
arg_select = 0;
