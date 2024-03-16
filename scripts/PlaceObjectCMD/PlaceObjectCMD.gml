function PlaceObject(_inst) : Command() constructor
{
	static execute = function()
	{
		placed = true;
		instance_activate_object(inst);
		inst.xscale = 1.5;
		inst.yscale = 1.5;
	};
	static undo = function()
	{
		placed = false;
		instance_deactivate_object(inst);
	};
	static destroy = function()
	{
		if !placed
		{
			instance_destroy(inst);
			with global.current_level.current_room
			{
				for (var i = 0; i < array_length(instances); i++)
				{
					if instances[i] == other.inst
					{
						array_delete(instances, i, 1);
						break;
					}
				}
			}
		}
	};
	inst = _inst;
	placed = false;
}
