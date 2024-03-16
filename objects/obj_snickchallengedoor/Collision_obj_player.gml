with other
{
	if (key_up && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3 || state == states.Sjumpprep) && y == (other.y + 50) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
	{
		lastroom_x = other.x;
		lastroom_y = other.y;
		lastroom = room;
		obj_camera.chargecamera = 0;
		ds_list_add(global.saveroom, id);
		obj_player1.sprite_index = obj_player1.spr_lookdoor;
		obj_player1.targetDoor = other.targetDoor;
		obj_player1.targetRoom = other.targetRoom;
		obj_player1.image_index = 0;
		obj_player1.state = states.door;
		obj_player1.mach2 = 0;
		if (instance_exists(obj_player2))
		{
			if object_index == obj_player2
			{
				obj_player1.x = obj_player2.x;
				obj_player1.y = obj_player2.y;
			}
			if object_index == obj_player1
			{
				obj_player2.x = obj_player1.x;
				obj_player2.y = obj_player1.y;
			}
			obj_player2.sprite_index = obj_player2.spr_lookdoor;
			obj_player2.targetDoor = other.targetDoor;
			obj_player2.targetRoom = other.targetRoom;
			obj_player2.image_index = 0;
			obj_player2.state = states.door;
			obj_player2.mach2 = 0;
		}
		other.visited = true;
		instance_create(x, y, obj_fadeout);
	}
}
