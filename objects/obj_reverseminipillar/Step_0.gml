if player < 2
{
	if (place_meeting(xstart, ystart, obj_player1) && obj_player1.state != states.chainsaw)
		player = 1
	else if (!global.panic && !place_meeting(xstart, ystart, obj_player1))
		player = 2
}
if global.panic == false && player != 1
{
	x = xstart;
	y = ystart;
	sprite_index = spr_minipillarwoke;
	mask_index = spr_minipillarwoke;
}
else
{
	x = -100;
	y = -100;
	sprite_index = spr_minipillarsleep;
}
