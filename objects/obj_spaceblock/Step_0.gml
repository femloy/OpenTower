if global.spaceblockswitch == 1
{
	x = -abs(sprite_width);
	y = -abs(sprite_height);
	sprite_index = spr_spaceblock_open;
	image_alpha = 0.5;
}
else if (global.spaceblockswitch == 0 && (x != xstart || sprite_index != spr_spaceblock_closed) && !place_meeting(xstart, ystart, obj_player) && !place_meeting(xstart, ystart, obj_baddie) && !place_meeting(xstart, ystart, obj_clownmato) && !place_meeting(xstart, ystart, obj_monster))
{
	mask_index = spr_spaceblock_closed;
	sprite_index = spr_spaceblock_closed;
	x = xstart;
	y = ystart;
	image_alpha = 1;
}
with blockid
{
	x = other.x;
	y = other.y;
}
