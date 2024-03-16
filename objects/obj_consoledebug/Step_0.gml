scr_menu_getinput()
var _dvc = obj_inputAssigner.player_input_device[0]
if movebuffer > 0
	movebuffer--
if state > 0
{
	if (key_down2 || key_up2)
		movebuffer = 10
	if movebuffer > 0
		var move = (key_down2 - key_up2)
	else
		move = (key_down - key_up)
}
switch state
{
	case 0:
		if (gamepad_button_check(_dvc, gp_stickl) && gamepad_button_check(_dvc, gp_stickr))
		{
			state = 1
			selected = 0
		}
		break
	case 1:
		selected += move
		if selected < 0
			selected = (array_length(commands) - 1)
		else if (selected > (array_length(commands) - 1))
			selected = 0
		if key_jump
		{
			state = 2
			arg_select = 0
			args = array_create(0)
		}
		else if key_back
			state = 0
		break
	case 2:
		var cmd = commands[selected]
		if (array_length(args) >= array_length(cmd.args))
		{
			var real_args = array_create(0)
			for (var i = 0; i < array_length(cmd.args); i++)
				array_push(real_args, cmd.args[i][args[i]])
			function_overload(real_args, cmd.func)
			state = 0
			break;
		}
		else
		{
			var arg = cmd.args[array_length(args)]
			arg_select += move
			if arg_select < 0
				arg_select = (array_length(arg) - 1)
			else if (arg_select > (array_length(arg) - 1))
				arg_select = 0
			if key_jump
			{
				array_push(args, arg_select)
				arg_select = 0
			}
			else if key_back
			{
				if (array_length(args) > 0)
					arg_select = array_pop(args)
				else
					state = 1
			}
		}
}

