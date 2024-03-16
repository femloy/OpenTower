if bombreset > 0
	bombreset--;
if bombreset <= 0 && sprite_index == spr_invtrash_idle
{
	image_index = 0;
	sprite_index = spr_invtrash_throw;
}
if (floor(image_index) == 2 && sprite_index == spr_invtrash_throw && bombreset <= 0)
{
	with (instance_create(x + (image_xscale * 6), y - 6, obj_cheeseball))
	{
		image_xscale = other.image_xscale;
		hsp = other.image_xscale * 5;
		vsp = -4;
	}
	bombreset = 100;
}
if (sprite_index == spr_invtrash_throw && floor(image_index) == image_number - 1)
	sprite_index = spr_invtrash_idle;
