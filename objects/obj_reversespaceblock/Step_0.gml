if global.spaceblockswitch == 1
{
	if ((x != xstart || sprite_index != spr_spaceblock_closed) && !place_meeting(xstart, ystart, obj_player) && !place_meeting(xstart, ystart, obj_baddie) && !place_meeting(xstart, ystart, obj_clownmato) && !place_meeting(xstart, ystart, obj_monster))
	{
		x = xstart;
		y = ystart;
		sprite_index = spr_spaceblock_closed;
		mask_index = spr_minipillarwoke;
		image_alpha = 1;
	}
}
else
{
	x = -abs(sprite_width);
	y = -abs(sprite_height);
	sprite_index = spr_spaceblock_open;
	image_alpha = 0.5;
}
with blockid
{
	x = other.x;
	y = other.y;
}
