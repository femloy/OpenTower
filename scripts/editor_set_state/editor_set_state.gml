function editor_set_state(state)
{
	with obj_editor
	{
		ds_map_find_value(editor_states, state)();
		editor_state = state;
	}
}
