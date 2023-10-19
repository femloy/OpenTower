if (place_meeting(x, y - 1, obj_player) && sprite_index == spr_toppinwarriorbutton)
{
	alarm[0] = 30;
	sprite_index = spr_toppinwarriorbutton_pressed;
}
