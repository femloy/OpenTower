if (floor(image_index) == (image_number - 1))
{
	if (sprite_index == spr_cheeseblock)
	{
		sprite_index = spr_cheeseblock_falling;
		falling = true;
		x = -100;
		y = -100;
	}
	else if (sprite_index == spr_cheeseblock_reform)
	{
		falling = false;
		sprite_index = spr_cheeseblock;
		image_index = 0;
		image_speed = 0;
	}
}
if (falling && sprite_index == spr_cheeseblock && image_speed == 0)
	image_speed = 0.35;
if (sprite_index == spr_cheeseblock_falling && reset > 0)
	reset--;
if (reset <= 0 && !place_meeting(xstart, ystart, obj_player) && !place_meeting(xstart, ystart, obj_pizzaball) && !place_meeting(xstart, ystart, obj_clownmato) && !place_meeting(xstart, ystart, obj_monster))
{
	reset = 100;
	sprite_index = spr_cheeseblock_reform;
	image_index = 0;
	image_speed = 0.35;
	falling = false;
	x = xstart;
	y = ystart;
}
