function scr_farmerpeasanto_projectile(haystack, unknown)
{
	with (haystack)
	{
		if (sprite_index != spr_haystackburning && sprite_index != spr_haystackburningup)
		{
			sprite_index = spr_haystackburningup;
			image_index = 0;
			state = states.normal;
			return true;
		}
	}
	return false;
}
function scr_farmer2_projectile(haystack, projectile)
{
	with (haystack)
	{
		x_to = x + (64 * projectile.image_xscale);
		dir = projectile.image_xscale;
	}
	return true;
}
function scr_farmer3_projectile(haystack, projectile)
{
	with (haystack)
	{
		x_to = x + (64 * -projectile.image_xscale);
		dir = -projectile.image_xscale;
	}
	return true;
}
function scr_shoot_farmerprojectile()
{
	if (global.hasfarmer[farmerpos])
	{
		var inst = obj_farmerpeasantoprojectile;
		if (farmerpos == 1)
			inst = obj_farmer2projectile;
		else if (farmerpos == 2)
			inst = obj_farmer3projectile;
		with (instance_create(x, y, inst))
		{
			image_xscale = other.xscale;
			hsp = 20 * image_xscale;
		}
	}
}
function scr_change_farmers()
{
	var i = 0;
	while (i < 3)
	{
		farmerpos++;
		if (farmerpos > (array_length(global.hasfarmer) - 1))
			farmerpos = 0;
		if (global.hasfarmer[farmerpos])
			break;
	}
	farmer_rearrange();
}
