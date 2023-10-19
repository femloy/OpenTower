if (sprite_index == spr_tinyslime_jump && vsp > 0)
	sprite_index = spr_tinyslime_fall;
if (grounded && vsp > 0)
{
	hsp = 0;
	sprite_index = spr_tinyslime_idle;
}
if (scr_solid(x + image_xscale, y) && !grounded)
{
	image_xscale *= -1;
	hsp *= -1;
}
scr_collide();
