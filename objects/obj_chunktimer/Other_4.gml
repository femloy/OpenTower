if (room != rank_room)
{
	if (string_letters(room_get_name(room)) == "towertutorial")
		global.tutorial_room = true;
	else
		global.tutorial_room = false;
}
