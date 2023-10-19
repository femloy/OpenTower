function sprite_set_size(width, height)
{
	image_xscale = width / sprite_get_width(sprite_index);
	image_yscale = height / sprite_get_width(sprite_index);
}
function snap_tile(value, snap)
{
	return floor(value / snap) * snap;
}
function add_object(lay, name, sprite, object, xoffset = 0, yoffset = 0)
{
	var s = 1;
	if (sprite_get_width(sprite) >= 64 || sprite_get_height(sprite) >= 64)
		s = min(64 / sprite_get_width(sprite), 64 / sprite_get_height(sprite));
	ds_list_add(object_list[lay], 
	{
		name: name,
		sprite_index: sprite,
		image_xscale: s,
		image_yscale: s,
		object_index: object,
		image_xoffset: xoffset,
		image_yoffset: yoffset,
		place_xoffset: 0,
		place_yoffset: 0,
		layerdepth: 0
	});
}
function set_object_place_offset(lay, xoffset, yoffset)
{
	var b = ds_list_find_value(array_get(object_list, lay), ds_list_size(objectlist) - 1);
	b.place_xoffset = xoffset;
	b.place_yoffset = xoffset;
}
function set_object_layerdepth(lay, depth)
{
	var b = ds_list_find_value(array_get(object_list, lay), ds_list_size(objectlist) - 1);
	b.layerdepth = depth;
}
function objectlist_calculate_scrollsize()
{
	var xx = 0;
	var yy = 0;
	for (var i = 0; i < ds_list_size(object_list); i++)
	{
		xx += 64;
		if (xx >= sprite_width)
		{
			xx = 0;
			yy += 64;
		}
	}
	scroll_ymax = yy - sprite_height;
	if (scroll_ymax < 0)
		scroll_ymax = 0;
}
function create_buttons_array(x, y, width, height, array)
{
	var xsize = 0;
	draw_set_font(global.editorfont);
	for (var i = 0; i < array_length(array); i++)
	{
		var b = array[i];
		var t = string_width(b[0]);
		if (t > xsize)
			xsize = t + width;
	}
	for (i = 0; i < array_length(array); i++)
	{
		b = array[i];
		with (instance_create_depth(x, y + (i * height), depth, obj_textbutton))
		{
			buttonid = i;
			sprite_index = spr_bigbutton;
			sprite_set_size(xsize, height);
			label = b[0];
			if (b[1] != -4)
				OnSelect = method(id, b[1]);
			if (b[2] != -4)
				OnDeselect = method(id, b[2]);
			parent = other.id;
		}
	}
}
