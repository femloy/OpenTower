var _destroyed = false;
if (ds_list_find_index(global.baddieroom, id) != -1)
{
	_destroyed = true;
	instance_destroy();
}
if escape == 1 && !_destroyed
{
	if escapespawnID == noone
	{
		with (instance_create(x, y, obj_escapespawn))
		{
			baddieID = other.id;
			other.escapespawnID = id;
		}
		instance_deactivate_object(id);
	}
}
if elite && object_index != obj_robot
{
	hp += 1;
	elitehp = hp;
}
if object_index == obj_cheeseslime && snotty
{
	if global.panic == true
	{
		ds_list_add(global.baddieroom, id);
		instance_destroy();
	}
	important = true;
	ini_open_from_string(obj_savesystem.ini_str);
	if (ini_read_real("Game", "snotty", false))
	{
		ds_list_add(global.baddieroom, id);
		instance_destroy();
		if !global.panic
			instance_create(x, y, obj_snotty);
	}
	ini_close();
}
