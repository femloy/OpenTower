if (thrown)
{
	sprite_index = spr_headprojectile;
	hsp = hithsp;
	vsp = hitvsp;
	if (place_meeting(x + sign(hsp), y, obj_solid))
	{
		thrown = false;
		image_xscale *= -1;
		hsp = image_xscale * 4;
		vsp = -4;
	}
}
else
{
	if (grounded)
	{
		hsp = Approach(hsp, 0, 0.5);
		sprite_index = spr_headprojectile_idle;
	}
	if (((grounded && vsp > 0) || place_meeting(x, y + 1, obj_solid)) && destroy)
		instance_destroy();
}
scr_collide();
