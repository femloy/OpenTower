with (obj_player)
	state = other.savedstate;
var func = dialog[currentdialog][2];
if (func != -4)
{
	if (npcID != -4 && instance_exists(npcID))
	{
		with (npcID)
			method(id, func)();
	}
	else
		method(id, func)();
}
