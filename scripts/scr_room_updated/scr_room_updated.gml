function scr_room_updated(_room)
{
	if (_room == room || (room == live_blank_room && live_live_room == _room))
	{
		with obj_player
		{
			hallway = savedhallway;
			hallwaydirection = savedhallwaydirection;
			vhallwaydirection = savedvhallwaydirection;
			verticalhallway = savedverticalhallway;
		}
		room_goto_live(_room);
	}
}
