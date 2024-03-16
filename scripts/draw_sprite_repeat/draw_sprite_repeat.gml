function draw_sprite_repeat(argument0, argument1, argument2, argument3, argument4, argument5)
{
	var spr_w = sprite_get_width(argument0)
	var spr_h = sprite_get_height(argument0)
	var nx = floor((argument4 / spr_w))
	var ny = floor((argument5 / spr_h))
	var dx = 0
	var dy = 0
	if (nx == 0 || ny == 0)
	{
		draw_sprite_part(argument0, argument1, 0, 0, argument4, argument5, argument2, argument3)
		if ny == 0
		{
			dy = 0
			for (var xx = 0; xx < nx; xx++)
			{
				draw_sprite_part(argument0, argument1, 0, 0, spr_w, argument5, (argument2 + dx), (argument3 + dy))
				dx += spr_w
				if (xx == (nx - 1))
					draw_sprite_part(argument0, argument1, 0, 0, (argument4 - dx), argument5, (argument2 + dx), (argument3 + dy))
			}
		}
		if nx == 0
		{
			dx = 0
			for (var yy = 0; yy < ny; yy++)
			{
				draw_sprite_part(argument0, argument1, 0, 0, argument4, argument5, argument2, (argument3 + dy))
				dy += spr_h
				if (yy == (ny - 1))
					draw_sprite_part(argument0, argument1, 0, 0, argument4, (argument5 - dy), argument2, (argument3 + dy))
			}
		}
	}
	else
	{
		for (yy = 0; yy < ny; yy++)
		{
			dx = 0
			for (xx = 0; xx < nx; xx++)
			{
				draw_sprite_ext(argument0, argument1, (argument2 + dx), (argument3 + dy), 1, 1, 0, c_white, draw_get_alpha())
				if (yy == (ny - 1))
					draw_sprite_part(argument0, argument1, 0, 0, spr_w, (argument5 - (dy + spr_h)), (argument2 + dx), (argument3 + (dy + spr_h)))
				dx += spr_w
				var dp = xx == (nx - 1)
				if dp
				{
					draw_sprite_part(argument0, argument1, 0, 0, (argument4 - dx), spr_h, (argument2 + dx), (argument3 + dy))
					if (yy == (ny - 1))
						draw_sprite_part(argument0, argument1, 0, 0, (argument4 - dx), (argument5 - (dy + spr_h)), (argument2 + dx), (argument3 + (dy + spr_h)))
				}
			}
			dy += spr_h
		}
	}
}
