if state != states.dead
{
	captain_y = SCREEN_HEIGHT;
	canon_y = SCREEN_HEIGHT;
}
switch state
{
	case states.normal:
		break;
	
	case states.transition:
		if (floor(canon_index) == (sprite_get_number(canon_sprite) - 1))
		{
			canon_sprite = spr_captaingoblin_canon;
			state = states.normal;
			fmod_event_instance_play(global.snd_captaingoblinshoot);
			GamepadSetVibration(0, 1, 1, 0.8);
			with (instance_create(crosshair_x, camera_get_view_y(view_camera[0]) - 32, obj_frontcanonbomb))
				y_to = other.crosshair_y;
		}
		break;
	
	case states.dead:
		if !destroyed
		{
			if destroybuffer > 0
				destroybuffer--;
			else
				destroyed = true;
		}
		else
		{
			var cy = SCREEN_HEIGHT + sprite_get_height(captain_sprite);
			captain_y = Approach(captain_y, cy, 2);
			canon_y = Approach(canon_y, cy, 1.8);
			if captain_y >= cy
				instance_destroy();
		}
		break;
}
