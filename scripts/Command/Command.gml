function Command() constructor
{
	static execute = function()
	{
		trace("Test cmd execute");
	};
	static undo = function()
	{
		trace("Test cmd undo");
	};
	static destroy = function()
	{
		trace("Test cmd destroy");
	};
}
