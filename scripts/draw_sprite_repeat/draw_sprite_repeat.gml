function draw_sprite_repeat(sprite, subimg, _x, _y, width, height)
{
	var spr_w = sprite_get_width(sprite), spr_h = sprite_get_height(sprite);
	var nx = floor(width / spr_w), ny = floor(height / spr_h);
	var dx = 0, dy = 0;
	
	if nx == 0 || ny == 0
	{
		draw_sprite_part(sprite, subimg, 0, 0, width, height, _x, _y);
		
		// Loop horizontally
		if ny == 0
		{
			dy = 0;
			for (var xx = 0; xx < nx; xx++)
			{
				draw_sprite_part(sprite, subimg, 0, 0, spr_w, height, _x + dx, _y + dy);
				dx += spr_w;
				if xx == (nx - 1)
					draw_sprite_part(sprite, subimg, 0, 0, width - dx, height, _x + dx, _y + dy);
			}
		}
		
		// Loop vertically
		if nx == 0
		{
			dx = 0;
			for (var yy = 0; yy < ny; yy++)
			{
				draw_sprite_part(sprite, subimg, 0, 0, width, height, _x, _y + dy);
				dy += spr_h;
				if yy == (ny - 1)
					draw_sprite_part(sprite, subimg, 0, 0, width, height - dy, _x, _y + dy);
			}
		}
	}
	else
	{
		// Loop both ways
		for (yy = 0; yy < ny; yy++)
		{
			dx = 0;
			for (xx = 0; xx < nx; xx++)
			{
				draw_sprite_ext(sprite, subimg, _x + dx, _y + dy, 1, 1, 0, c_white, draw_get_alpha());
				if yy == (ny - 1)
					draw_sprite_part(sprite, subimg, 0, 0, spr_w, height - dy + spr_h, _x + dx, _y + dy + spr_h);
				dx += spr_w;
				
				var dp = xx == (nx - 1);
				if dp
				{
					draw_sprite_part(sprite, subimg, 0, 0, width - dx, spr_h, _x + dx, _y + dy);
					if yy == (ny - 1)
						draw_sprite_part(sprite, subimg, 0, 0, width - dx, height - dy + spr_h, _x + dx, _y + dy + spr_h);
				}
			}
			dy += spr_h;
		}
	}
}
