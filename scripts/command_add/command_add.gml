function command_add(command)
{
	with obj_editor
	{
		command.execute()
		while (command_current < ds_list_size(commands_list))
		{
			ds_list_find_value(commands_list, command_current).destroy()
			ds_list_delete(commands_list, command_current)
		}
		ds_list_add(commands_list, command)
		command_current++
	}
}

