enum editor_states
{
	empty,				// This state is rarely used and is only used when initalizing the objects.
	instance_edit,
	unknownvalue_2,
	resize_room,
	saving,
	loading
}
enum inst_states
{
	idle,
	dragging,
	placing				// Not 100% sure about this one, theres not much referencing it.
}
enum comp_state
{
	undocked,
	docked
}
enum comp_dock
{
	topleft,		// 0
	left,			// 1
	bottomleft,		// 2
	topright,		// 3
	right,			// 4
	bottomright,	// 5
	top,			// 6
	bottom			// 7
}