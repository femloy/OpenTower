if (place_meeting(x, y, obj_player) && instance_place(x, y, obj_player).state == states.crouch)
	standbuffer++;
else
	standbuffer = 0;
if standbuffer >= 600
{
	standbuffer = 0;
	notification_push(notifs.crawl_in_shit, [room]);
}
