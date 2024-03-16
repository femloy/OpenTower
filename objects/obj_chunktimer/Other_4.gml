if room != rank_room
{
	var r = string_letters(room_get_name(room));
	if (r == "towertutorial" || r == "towertutorialN")
		global.tutorial_room = true;
	else
		global.tutorial_room = false;
}
