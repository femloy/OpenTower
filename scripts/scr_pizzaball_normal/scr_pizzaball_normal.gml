function scr_pizzaball_normal()
{
	if thrown
	{
		hsp = image_xscale * (movespeed + slopespeed);
		with obj_destructibles
		{
			if (place_meeting(x - other.hsp, y, other.id))
				instance_destroy();
			if (place_meeting(x, y - other.vsp, other.id))
				instance_destroy();
		}
		with obj_rollblock
		{
			if (place_meeting(x - other.hsp, y, other.id))
				instance_destroy();
			if (place_meeting(x, y - other.vsp, other.id))
				instance_destroy();
		}
		var num = instance_place_list(x + hsp, y, obj_enemyblock, global.instancelist, false);
		for (var i = 0; i < num; i++)
		{
			var b = ds_list_find_value(global.instancelist, i);
			instance_destroy(b);
		}
		ds_list_clear(global.instancelist);
		if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_destroyablegolf) && (!place_meeting(x + hsp, y, obj_slope) || place_meeting(x + hsp, y - 4, obj_solid)))
		{
			angle = 0;
			image_xscale *= -1;
			movespeed /= 1.3;
			sprite_index = spr_pizzaball_hitwall;
			image_index = 0;
		}
		if grounded && !kicked
		{
			if movespeed > 2
			{
				if jspd > 1 && sprite_index != spr_pizzaball_hitwall
				{
					sprite_index = spr_pizzaball_hitwall2;
					image_index = 0;
				}
				vsp = -jspd;
				jspd /= 2;
				movespeed /= 1.3;
			}
		}
		else if (grounded || kicked)
		{
			if movespeed > 0
				movespeed -= deccel;
			else if slopespeed <= 0
				movespeed = 0;
		}
		if (place_meeting(x, y + 1, obj_current))
		{
			var _currentinst = instance_place(x, y + 1, obj_current);
			movespeed = 8;
			image_xscale = sign(_currentinst.image_xscale);
			hsp = image_xscale * movespeed;
			vsp = 0;
			kicked = true;
		}
	}
	else
	{
		kicked = false;
		hsp = image_xscale * (movespeed + slopespeed);
		var _deccel = 0.1;
		if movespeed > 0
			movespeed -= _deccel;
		else
			movespeed = 0;
	}
	if jspd < 0
		jspd = 0;
	if (floor(image_index) == image_number - 1 && (sprite_index == spr_pizzaball_hitwall || sprite_index == spr_pizzaball_hitwall2))
		sprite_index = spr_pizzaball_idle2;
	if sprite_index != spr_pizzaball_hitwall && sprite_index != spr_pizzaball_hitwall2
	{
		if (thrown || kicked)
			sprite_index = spr_pizzaball_roll;
		else if chair
			sprite_index = spr_pizzaball_idle1;
		else if sprite_index == spr_pizzaball_roll
		{
			if (!scr_slope())
			{
				if sprite_index != spr_pizzaball_hitwall2
				{
					sprite_index = spr_pizzaball_hitwall2;
					image_index = 0;
				}
				image_speed = 0.35;
			}
		}
		else if floor(image_index) == image_number - 1
			sprite_index = spr_pizzaball_idle2;
	}
}
function scr_pizzaball_roll()
{
	kicked = false;
	state = states.normal;
}
