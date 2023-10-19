var _hide = false;
wave_timer += 20;
with (obj_tutorialbook)
{
	if (text_state != states.titlescreen)
		_hide = true;
}
if (instance_exists(obj_mrsticknotification))
	_hide = true;

switch (text_state)
{
	case states.titlescreen:
		repeat (_hide + 1)
			text_y = Approach(text_y, -(text_sprite_height * text_yscale), 5);
		if (place_meeting(x, y, obj_player) && !_hide)
		{
			text_state = states.fall;
			text_vsp = 0;
		}
		break;
	
	case states.fall:
		text_y += text_vsp;
		if (text_vsp < 20)
			text_vsp += 0.5;
		if (text_y > text_ystart)
			text_state = states.normal;
		break;
	
	case states.normal:
		text_y = Approach(text_y, text_ystart, 2);
		if (!place_meeting(x, y, obj_player) || _hide)
			text_state = states.titlescreen;
		break;
}
text_wave_x = Wave(-5, 5, 2, 10, wave_timer);
text_wave_y = Wave(-1, 1, 4, 0, wave_timer);
