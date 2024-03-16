function command_add(argument0) //command_add
{
	with obj_editor
	{
		argument0.execute()
		while (command_current < ds_list_size(commands_list))
		{
			ds_list_find_value(commands_list, command_current).destroy()
			ds_list_delete(commands_list, command_current)
		}
		ds_list_add(commands_list, argument0)
		command_current++
	}
}

