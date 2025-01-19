function save_level()
{
	with obj_editor
	{
		saved_editor_state = editor_state
		editor_state = editorstates.saving
		save_step = -1
	}
}
