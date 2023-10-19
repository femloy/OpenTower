depth = -600;
if (instance_number(object_index) > 1)
{
	instance_destroy();
	exit;
}
dirty = false;
savegame = false;
saveoptions = false;
fadeoutcreate = false;
showicon = false;
ini_str = "";
state = 0;
icon_index = 0;
icon_max = sprite_get_number(spr_pizzaslice);
ini_open("saveData.ini");
ini_str_options = ini_close();
