image_xscale = 1;
if sprite_index != spr_pizzahead_haywireattack
	hsp = floatdir * 5;
else
	hsp = 0;
vsp = 0;
var ty = room_height * 0.25;
y = Approach(y, ty, 2);
if (place_meeting(x + floatdir, y, obj_solid))
	floatdir *= -1;
if sprite_index == spr_pizzahead_haywireattack
{
	if floor(image_index) == image_number - 1
		sprite_index = spr_pizzahead_haywire;
	if (floor(image_index) >= 11 && !shot)
	{
		shot = true;
		instance_create(x, y + 38, obj_pizzahead_cog);
	}
}
scr_collide();
