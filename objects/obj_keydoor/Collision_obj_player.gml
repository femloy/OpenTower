var _actor = false;
with obj_player
{
	if state == states.actor
		_actor = true;
}
if _actor
	exit;
if global.horse
	exit;
if (!place_meeting(x, y, obj_doorblocked))
{
	with other
	{
		if (key_up && !instance_exists(obj_jumpscare) && other.sprite_index == spr_doorkeyopen && grounded && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep) && ((character != "M" && y == (other.y + 50)) || (character == "M" && y == (other.y + 55))) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
		{
			obj_player1.lastroom = room;
			obj_player2.lastroom = room;
			fmod_event_one_shot("event:/sfx/misc/door");
			obj_camera.chargecamera = 0;
			ds_list_add(global.saveroom, id);
			if object_index == obj_player1
				obj_player1.sprite_index = obj_player1.spr_lookdoor;
			if object_index == obj_player2
				obj_player2.sprite_index = obj_player2.spr_lookdoor;
			obj_player1.targetDoor = other.targetDoor;
			obj_player1.targetRoom = other.targetRoom;
			obj_player2.targetDoor = other.targetDoor;
			obj_player2.targetRoom = other.targetRoom;
			obj_player.image_index = 0;
			obj_player.state = states.door;
			obj_player.mach2 = 0;
			if (instance_exists(obj_player2) && global.coop == 1)
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
			}
			other.visited = true;
			instance_create(x, y, obj_fadeout);
		}
	}
}
