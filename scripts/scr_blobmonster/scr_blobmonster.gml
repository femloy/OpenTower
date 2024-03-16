function scr_blob_normal()
{
	sprite_index = walkspr;
	hsp = image_xscale * movespeed;
	var _calc = 32 * obstacle_max * sign(image_yscale);
	var _col1 = collision_line(x, y, x, y - _calc, obj_solid, false, true);
	if _col1 != -4
	{
		var _side = (image_yscale > 0) ? (_col1.bbox_bottom + 8) : (_col1.bbox_top - 8);
		_calc = abs(y - _side) * sign(image_yscale);
	}
	var _col = collision_line(x, y - _calc, x + (16 * image_xscale), y - _calc, obj_solid, false, true);
	if (place_meeting(x + hsp, y, obj_solid))
	{
		if (_col != -4 || changeside_buffer > 0)
			image_xscale *= -1;
		else
		{
			image_yscale *= -1;
			y -= (46 * image_yscale);
			state = states.fall;
		}
	}
	else if (place_meeting(x + hsp, y, obj_hallway))
		image_xscale *= -1;
}
function scr_blob_fall()
{
	hsp = 0;
	sprite_index = fallspr;
	if grounded
	{
		changeside_buffer = 20;
		state = states.normal;
	}
}
function scr_blob_chase()
{
	if ((playerinst.x - x) != 0)
	{
		image_xscale = sign(playerinst.x - x);
		hsp = image_xscale * movespeed_chase;
	}
	if (playerinst.x > (x - 16) && playerinst.x < (x + 16))
		hsp = 0;
	if hsp != 0
		sprite_index = chasespr;
	else
		sprite_index = idlespr;
	if (place_meeting(x + hsp, y, obj_solid) && !scr_slope() && grounded)
	{
		image_xscale *= -1;
		state = states.normal;
	}
}
