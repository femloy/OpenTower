y = Approach(y, y_to, 2);
x = xstart;
if (y == y_to)
{
	if (room != tower_5)
	{
		with (instance_create(x, y, obj_bossdoor))
		{
			sprite_index = other.sprite_index;
			bgsprite = other.bgsprite;
			targetRoom = other.targetRoom;
			group_arr = other.group_arr;
			event_perform(ev_other, ev_room_start);
		}
	}
	else
	{
		with (instance_create(x, y, obj_door))
		{
			sprite_index = spr_pizzafacedoor;
			targetRoom = other.targetRoom;
		}
	}
	instance_destroy();
}
with (obj_camera)
{
	shake_mag = 3;
	shake_mag_acc = 5 / room_speed;
}
fmod_event_instance_set_3d_attributes(snd, x, y);
