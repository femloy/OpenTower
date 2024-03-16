if global.panic == true || random_secret || (instance_exists(obj_wartimer) && room != war_1)
{
	image_index = 1;
	if !uparrow
	{
		uparrowID = scr_create_uparrowhitbox();
		uparrow = true;
	}
}
else if uparrow
{
	uparrow = false;
	instance_destroy(uparrowID);
}
if drop && global.panic
{
	if dropstate == states.grabbed
	{
		sprite_index = spr_exitgategrabbed;
		if snd == 0
		{
			fmod_event_one_shot_3d("event:/sfx/pep/hitwall", x, y);
			snd = true;
		}
	}
	else
		sprite_index = spr_exitgate;
	
	switch dropstate
	{
		case states.normal:
			if (distance_to_object(obj_player1) < 300)
			{
				dropstate = states.hook;
				handsprite = spr_grabbiehand_fall;
				hand_y = camera_get_view_y(view_camera[0]) - 100;
			}
			break;
		
		case states.hook:
			if (hand_y < (y - 128))
				hand_y += 6;
			else
			{
				handsprite = spr_grabbiehand_catch;
				handindex = 0;
				dropstate = states.grabbed;
			}
			break;
		
		case states.grabbed:
			depth = 150;
			var _ty = drop_y - 100;
			y = Approach(y, _ty, 3);
			hand_y = y - 128;
			if (y == _ty && distance_to_object(obj_player1) < 200)
			{
				dropstate = states.fall;
				handindex = 0;
				handsprite = spr_grabbiehand_release;
				vsp = 0;
			}
			break;
		
		case states.fall:
			if vsp < 20
				vsp += grav;
			y += vsp;
			if y >= drop_y
			{
				depth = 50;
				fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
				y = drop_y;
				dropstate = states.idle;
				handsprite = spr_grabbiehand_idle;
				with obj_camera
				{
					shake_mag = 5;
					shake_mag_acc = 3 / room_speed;
				}
			}
			break;
		
		case states.idle:
			hand_y -= 6;
			break;
	}
	if (handsprite == spr_grabbiehand_release && floor(handindex) == (sprite_get_number(handsprite) - 1))
		handindex = sprite_get_number(handsprite) - 1;
	handindex += 0.35;
}
