function ResizeCMD(_inst, _xscale, _yscale, _oldxscale, _oldyscale) : Command() constructor
{
	static execute = function()
	{
		with inst
		{
			image_xscale = other.xscale;
			image_yscale = other.yscale;
		}
	};
	static undo = function()
	{
		with inst
		{
			image_xscale = other.oldxscale;
			image_yscale = other.oldyscale;
		}
	};
	inst = _inst;
	xscale = _xscale;
	yscale = _yscale;
	oldxscale = _oldxscale;
	oldyscale = _oldyscale;
}
