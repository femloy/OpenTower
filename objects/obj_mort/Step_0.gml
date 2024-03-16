if (floor(image_index) == image_number - 1 && sprite_index == spr_mortspawn)
	sprite_index = spr_mortfall;
if grounded && sprite_index == spr_mortfall
{
	image_index = 0;
	sprite_index = spr_mortland;
}
if (floor(image_index) == image_number - 1 && sprite_index == spr_mortland)
	sprite_index = spr_mortidle;
scr_collide();
