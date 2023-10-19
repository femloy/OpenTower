function create_afterimage(_x, _y, _sprite, _image_index)
{
	var q = 
	{
		x: _x,
		y: _y,
		sprite_index: _sprite,
		image_index: _image_index,
		image_angle: 0,
		alarm: [15, 6, -1],
		image_blend: choose(global.afterimage_color1, global.afterimage_color2),
		image_xscale: 1,
		image_yscale: 1,
		identifier: afterimage.simple,
		visible: true,
		alpha: 1
	};
	ds_list_add(global.afterimage_list, q);
	return q;
}
function create_mach3effect(_x, _y, _sprite, _image_index, _afterimage = false)
{
	var q = 
	{
		x: _x,
		y: _y,
		sprite_index: _sprite,
		image_index: _image_index,
		image_angle: 0,
		alarm: [15, 6, -1],
		image_blend: choose(global.mach_color1, global.mach_color2),
		image_xscale: 1,
		image_yscale: 1,
		visible: true,
		identifier: afterimage.mach3effect,
		playerid: obj_player1,
		alpha: 1
	};
	if (_afterimage)
		q.identifier = afterimage.simple;
	ds_list_add(global.afterimage_list, q);
	return q;
}
function create_heatattack_afterimage(_x, _y, _sprite, _image_index, _xscale)
{
	var _velocity = 6;
	with (create_afterimage(_x, _y, _sprite, _image_index))
	{
		identifier = afterimage.heatattack;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[0] = 8;
		image_xscale = _xscale;
		hsp = _velocity;
		vsp = 0;
		image_blend = global.afterimage_color1;
	}
	with (create_afterimage(_x, _y, _sprite, _image_index))
	{
		identifier = afterimage.heatattack;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[0] = 8;
		image_xscale = _xscale;
		hsp = -_velocity;
		vsp = 0;
		image_blend = global.afterimage_color1;
	}
	with (create_afterimage(_x, _y, _sprite, _image_index))
	{
		identifier = afterimage.heatattack;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[0] = 8;
		image_xscale = _xscale;
		hsp = 0;
		vsp = _velocity;
		image_blend = global.afterimage_color1;
	}
	with (create_afterimage(_x, _y, _sprite, _image_index))
	{
		identifier = afterimage.heatattack;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[0] = 8;
		image_xscale = _xscale;
		hsp = 0;
		vsp = -_velocity;
		image_blend = global.afterimage_color1;
	}
}
function create_firemouth_afterimage(_x, _y, _sprite, _image_index, _xscale)
{
	var b = create_afterimage(_x, _y, _sprite, _image_index);
	with (b)
	{
		fadeout = false;
		fadeoutstate = -4;
		identifier = afterimage.firemouth;
		alarm[0] = -1;
		alarm[1] = -1;
		alarm[2] = -1;
		image_xscale = _xscale;
		image_blend = make_color_rgb(248, 112, 24);
		alpha = 0.8;
		basealpha = 1;
		playerid = -4;
		vertical = false;
		maxmovespeed = 10;
	}
	return b;
}
function create_blue_afterimage(_x, _y, _sprite, _image_index, _xscale)
{
	var b = create_afterimage(_x, _y, _sprite, _image_index);
	with (b)
	{
		fadeout = false;
		fadeoutstate = -4;
		identifier = afterimage.blue;
		alarm[0] = -1;
		alarm[1] = -1;
		alarm[2] = -1;
		image_xscale = _xscale;
		image_blend = make_color_rgb(44, 126, 228);
		alpha = 0.8;
		basealpha = 1;
		playerid = -4;
		vertical = false;
		maxmovespeed = 10;
	}
	return b;
}
function create_red_afterimage(_x, _y, _sprite, _image_index, _xscale)
{
	var b = create_blue_afterimage(_x, _y, _sprite, _image_index, _xscale);
	with (b)
		identifier = afterimage.enemy;
	return b;
}
function create_blur_afterimage(_x, _y, _sprite, _image_index, _xscale)
{
	var b = create_afterimage(_x, _y, _sprite, _image_index);
	with (b)
	{
		fadeout = false;
		fadeoutstate = -4;
		identifier = afterimage.blur;
		alarm[0] = -1;
		alarm[1] = -1;
		alarm[2] = -1;
		image_blend = c_white;
		image_xscale = _xscale;
		alpha = 0.8;
		playerid = -4;
		spd = 0.15;
		hsp = 0;
		vsp = 0;
	}
	return b;
}
