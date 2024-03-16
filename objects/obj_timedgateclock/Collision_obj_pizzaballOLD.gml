if sprite_index != spr_button_pressed && sprite_index != spr_button_goingpressed
	timedgate_trigger();
with obj_timedgateclock
{
	if sprite_index != spr_button_pressed && sprite_index != spr_button_goingpressed
	{
		sprite_index = spr_button_goingpressed;
		image_index = 0;
	}
}
global.timedgatetimer = true;
global.timedgatetime = time;
