function command_add(editor_command)
{
	with obj_editor
	{
		editor_command.execute();
		while command_current < ds_list_size(commands_list)
		{
			ds_list_find_value(commands_list, command_current).destroy();
			ds_list_delete(commands_list, command_current);
		}
		ds_list_add(commands_list, editor_command);
		command_current++;
	}
}
