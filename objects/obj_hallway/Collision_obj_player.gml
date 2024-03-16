if obj_player1.state == states.debugstate
	exit;
if obj_player1.state == states.backtohub
	exit;
if obj_player1.state == states.titlescreen
	exit;
if (instance_exists(obj_jumpscare))
	exit;

var hall = id;
with other
{
	if !other.savedposition
	{
		other.savedposition = true;
		other.savedx = x;
		other.savedy = y;
	}
	x = other.savedx;
	y = other.savedy;
	if (!instance_exists(obj_fadeout))
	{
		obj_player1.lastroom = room;
		obj_player2.lastroom = room;
		obj_player1.targetDoor = other.targetDoor;
		obj_player1.targetRoom = other.targetRoom;
		obj_player1.hallway = true;
		obj_player1.hallwaydirection = other.image_xscale;
		if (instance_exists(obj_player2))
		{
			obj_player2.targetDoor = other.targetDoor;
			obj_player2.targetRoom = other.targetRoom;
			obj_player2.hallway = true;
			obj_player2.hallwaydirection = other.image_xscale;
		}
		other.visited = true;
		fmod_event_one_shot("event:/sfx/misc/door");
		with (instance_create(x, y, obj_fadeout))
		{
			offload_arr = hall.offload_arr;
			group_arr = hall.group_arr;
		}
	}
}
