if (selected == 0)
{
	if ((obj_player.key_right2 || keyboard_check_pressed(vk_right)) && optionselected < 2)
		optionselected += 1;
	else if ((-obj_player.key_left2 || keyboard_check_pressed(vk_left)) && optionselected > 0)
		optionselected -= 1;
	if ((obj_player.key_jump || keyboard_check_pressed(vk_enter)) && optionselected == 0)
	{
		obj_file1.sprite_index = spr_file1confirm;
		selected = true;
		alarm[0] = 50;
	}
	if ((obj_player.key_jump || keyboard_check_pressed(vk_enter)) && optionselected == 1)
	{
		selected = true;
		alarm[1] = 5;
	}
	if ((obj_player.key_jump || keyboard_check_pressed(vk_enter)) && optionselected == 2)
	{
		selected = true;
		alarm[2] = 5;
	}
}
var lay_id = layer_get_id("Backgrounds_2");
var back_id = layer_background_get_id(lay_id);
layer_background_index(back_id, optionselected);
