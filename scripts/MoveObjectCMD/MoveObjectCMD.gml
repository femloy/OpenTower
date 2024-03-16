function MoveObjectCMD(_inst, _x, _y, _oldx, _oldy) : Command() constructor
{
	static execute = function()
	{
		with inst
		{
			x = other.x;
			y = other.y;
		}
	};
	static undo = function()
	{
		with inst
		{
			x = other.oldx;
			y = other.oldy;
		}
	};
	inst = _inst;
	x = _x;
	y = _y;
	oldx = _oldx;
	oldy = _oldy;
}
