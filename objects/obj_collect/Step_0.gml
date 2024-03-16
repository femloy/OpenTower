if room == rm_editor
	exit;
if global.collectsound < 10
	global.collectsound += 1;
if (place_meeting(x, y, obj_secretbigblock) || place_meeting(x, y, obj_shotgunblock))
	visible = false;
else
	visible = true;
if global.timeattack == 1
	instance_destroy();
if (place_meeting(x, y, obj_destructibles) || place_meeting(x, y, obj_iceblock_breakable))
	depth = 102;
else
	depth = 2;
if (abs(distance_to_object(obj_player1)) < 25 && !place_meeting(x, y, obj_destructibles) && !place_meeting(x, y, obj_iceblock_breakable) && !place_meeting(x, y, obj_iceblock) && !place_meeting(x, y, obj_ghostblock))
{
	if !gotowardsplayer
		scr_ghostcollectible();
	gotowardsplayer = true;
}
if gotowardsplayer == 1
{
	move_towards_point(obj_player.x, obj_player.y, movespeed);
	movespeed++;
}
