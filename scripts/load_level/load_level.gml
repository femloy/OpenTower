function load_level() //load_level
{
	saved_editor_state = editor_state
	editor_state = editorstates.loading
	save_step = -1
	ds_list_clear(global.current_level.rooms)
}

