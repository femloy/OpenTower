enum editorstates
{
	none,
	normal,
	UNKNOWN_1, // Toggles layer 1, but is never used.
	resize_room,
	saving,
	loading
}
enum editor_instance_states
{
	normal,
	dragging,
	resizing
}
enum editor_panel_states
{
	undocked,
	docked
}
enum editor_direction
{
	topleft,
	left,
	bottomleft,
	topright,
	right,
	bottomright,
	top,
	bottom,
	
	enum_length
}
enum editor_layer_types
{
	background,
	tile
}
