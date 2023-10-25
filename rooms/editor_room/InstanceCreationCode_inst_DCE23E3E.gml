state = 0;
ID = -4;
with (instance_create_depth(0, 0, depth - 1, obj_button))
{
	icon = 183;
	parent = other.id;
	name = "Objects";
	on_left_click = function()
	{
		toggle_panel(1);
	};
}
with (instance_create_depth(0, 64, depth - 1, obj_button))
{
	icon = 3276;
	parent = other.id;
	name = "Tiles";
	on_left_click = function()
	{
		toggle_panel(3);
	};
}
with (instance_create_depth(0, 128, depth - 1, obj_button))
{
	icon = 2557;
	parent = other.id;
	name = "Backgrounds";
	on_left_click = function()
	{
		toggle_panel(2);
	};
}
with (instance_create_depth(0, 192, depth - 1, obj_button))
{
	icon = 2131;
	parent = other.id;
	name = "Rooms";
	on_left_click = function()
	{
		toggle_panel(5);
	};
}
with (instance_create_depth(0, 256, depth - 1, obj_button))
{
	parent = other.id;
	name = "Settings";
	icon = 2219;
	on_left_click = function()
	{
		toggle_panel(4);
	};
}
with (instance_create_depth(0, sprite_height - 64, depth - 1, obj_button))
{
	name = "Menu";
	icon = 815;
	parent = other.id;
	on_left_click = function()
	{
		toggle_panel(0);
	};
}
