if (sprite_index == spr_taximove && pickedup)
{
	with (obj_player)
	{
		obj_player1.lastroom = room;
		obj_player2.lastroom = room;
		obj_camera.chargecamera = 0;
		ds_list_add(global.saveroom, id);
		obj_player1.targetDoor = other.targetDoor;
		obj_player1.targetRoom = other.targetRoom;
		obj_player2.targetDoor = other.targetDoor;
		obj_player2.targetRoom = other.targetRoom;
		obj_player.image_index = 0;
		obj_player.mach2 = 0;
		if (instance_exists(obj_player2) && global.coop == 1)
		{
			if (object_index == obj_player2)
			{
				obj_player1.x = obj_player2.x;
				obj_player1.y = obj_player2.y;
			}
			if (object_index == obj_player1)
			{
				obj_player2.x = obj_player1.x;
				obj_player2.y = obj_player1.y;
			}
		}
		if (!instance_exists(obj_fadeout))
			instance_create(x, y, obj_fadeout);
	}
}
