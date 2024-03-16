if global.collectsound < 10
	global.collectsound += 1;
if timetovisible > 0
{
	gotowardsplayer = false;
	timetovisible--;
}
if (distance_to_point(xstart, ystart) > 300)
{
	x = xstart;
	y = ystart;
	visible = false;
	timetovisible = 10;
	gotowardsplayer = false;
}
if timetovisible == 0 && !visible
{
	x = xstart;
	y = ystart;
	visible = true;
	image_alpha = 0;
}
if image_alpha < 1
	image_alpha += 0.1;
if (visible && !gotowardsplayer && distance_to_object(obj_player1) < 25 && !place_meeting(x, y, obj_destructibles) && !place_meeting(x, y, obj_iceblock))
{
	gotowardsplayer = true;
	movespeed = movespeedstart;
}
