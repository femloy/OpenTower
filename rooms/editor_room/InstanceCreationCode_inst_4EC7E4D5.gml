state = states.normal
ID = noone
with (instance_create_depth(0, 0, (depth - 1), obj_button))
{
	icon = spr_editor_objects
	parent = other.id
	name = "Objects"
	on_left_click = function()
	{
		toggle_panel(1)
	}
}
with (instance_create_depth(0, 64, (depth - 1), obj_button))
{
	icon = spr_editor_tiles
	parent = other.id
	name = "Tiles"
	on_left_click = function()
	{
		toggle_panel(3)
	}
}
with (instance_create_depth(0, 128, (depth - 1), obj_button))
{
	icon = spr_editor_bg
	parent = other.id
	name = "Backgrounds"
	on_left_click = function()
	{
		toggle_panel(2)
	}
}
with (instance_create_depth(0, 192, (depth - 1), obj_button))
{
	icon = spr_editor_rooms
	parent = other.id
	name = "Rooms"
	on_left_click = function()
	{
		toggle_panel(5)
	}
}
with (instance_create_depth(0, 256, (depth - 1), obj_button))
{
	parent = other.id
	name = "Settings"
	icon = spr_editor_settings
	on_left_click = function()
	{
		toggle_panel(4)
	}
}
with (instance_create_depth(0, (sprite_height - 64), (depth - 1), obj_button))
{
	name = "Menu"
	icon = spr_editor_menu
	parent = other.id
	on_left_click = function()
	{
		toggle_panel(0)
	}
}
