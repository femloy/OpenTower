if !released && global.panic
{
	if (inst != -4 && !instance_exists(inst))
		inst = -4;
	if obj_player.x > x
	{
		released = true;
		image_speed = 0.35;
	}
}
else if (floor(image_index) == 3 && !instance_exists(inst))
{
	inst = instance_create(obj_player1.x, y + 13, obj_policecar);
	inst.targetplayer = obj_player1;
	inst.targetRoom = targetRoom;
	inst.targetDoor = targetDoor;
}
