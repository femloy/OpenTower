function DeleteObject(_inst) : Command() constructor
{
	static execute = function()
	{
		deleted = true;
		instance_deactivate_object(inst);
	};
	static undo = function()
	{
		deleted = false;
		instance_activate_object(inst);
	};
	static destroy = function()
	{
		if deleted
			instance_destroy(inst);
	};
	inst = _inst;
	deleted = false;
}
