if room == rm_editor
{
	mask_index = spr_minipillarwoke;
	exit;
}
if player < 2
{
	if (place_meeting(xstart, ystart, obj_player1) && obj_player1.state != states.chainsaw)
		player = 1;
	else if (global.panic && !place_meeting(xstart, ystart, obj_player1))
		player = 2;
}
if (global.panic == false || player <= 1)
{
	x = -100;
	y = -100;
	sprite_index = spr_minipillarsleep;
	mask_index = spr_minipillarsleep;
}
else
{
	mask_index = spr_minipillarwoke;
	sprite_index = spr_minipillarwoke;
	x = xstart;
	y = ystart;
}
