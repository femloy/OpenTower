ID = 7
with (instance_create_depth(0, 0, (depth - 1), obj_button))
{
	parent = other.id
	image_xscale = other.image_xscale
	image_yscale = 0.5
	text = "Test Room"
	on_left_click = function()
	{
		
	}
}
with (instance_create_depth(0, 32, (depth - 1), obj_button))
{
	parent = other.id
	image_xscale = other.image_xscale
	image_yscale = 0.5
	text = "Resize Room"
	on_left_click = function()
	{
		toggle_panel(7)
		with (obj_editor)
			editor_state = (3 << 0)
		with (obj_editorobject)
			selected = 0
	}
}
