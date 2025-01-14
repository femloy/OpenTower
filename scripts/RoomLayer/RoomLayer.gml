enum layertype
{
	background,
	tile
}

function room_layer_add(rm)
{
	with obj_itemlist
	{
		if ID == rm
		{
			if global.current_level.current_room == -4
				exit;
			var arr = global.current_level.current_room.backgrounds;
			if rm == 1
				arr = global.current_level.current_room.tiles;
			var lowest_depth = -100;
			if (array_length(arr) > 0)
			{
				for (var i = 0; i < array_length(arr); i++)
				{
					var b = arr[i];
					if b.depth > lowest_depth
						lowest_depth = b.depth;
				}
			}
			else
				lowest_depth = 0;
			var _layer = new RoomLayer();
			_layer.depth = lowest_depth + 1;
			if _layer.depth == 0
				_layer.depth++;
			if rm == 1
				_layer.layer_type = layertype.tile;
			array_push(arr, _layer);
			dirty = true;
		}
	}
}
function room_layer_delete(rm)
{
	with obj_itemlist
	{
		if ID == rm && selected_item != -4
		{
			if global.current_level.current_room == -4
				exit;
			var arr = global.current_level.current_room.backgrounds;
			if rm == 1
				arr = global.current_level.current_room.tiles;
			for (var i = 0; i < array_length(arr); i++)
			{
				var b = arr[i];
				if (b.depth == ds_list_find_value(items, selected_item).depth)
				{
					array_delete(arr, i, 1);
					delete b;
					break;
				}
			}
			dirty = true;
		}
	}
}
function room_layer_move_up(rm)
{
	with obj_itemlist
	{
		if ID == rm && selected_item != -4
		{
			var _room = global.current_level.current_room;
			if _room == -4
				exit;
			var _arr = _room.backgrounds;
			if rm == 1
				_arr = _room.tiles;
			for (var i = 0; i < array_length(_arr); i++)
			{
				var b = _arr[i];
				if (b.depth == ds_list_find_value(items, selected_item).depth)
				{
					b.move_up(_arr);
					search_depth = b.depth;
					break;
				}
			}
			dirty = true;
		}
	}
}
function room_layer_move_down(rm)
{
	if global.current_level.current_room == -4
		exit;
	with obj_itemlist
	{
		if ID == rm && selected_item != -4
		{
			var _room = global.current_level.current_room;
			var _arr = _room.backgrounds;
			if rm == 1
				_arr = _room.tiles;
			for (var i = 0; i < array_length(_arr); i++)
			{
				var b = _arr[i];
				if (b.depth == ds_list_find_value(items, selected_item).depth)
				{
					b.move_down(_arr);
					search_depth = b.depth;
					break;
				}
			}
			dirty = true;
		}
	}
}
function room_layer_item_dirty(rm)
{
	if global.current_level.current_room == -4
		exit;
	ds_list_clear(items);
	var _arr = array_create(0);
	with global.current_level.current_room
	{
		for (var i = 0; i < array_length(rm); i++)
		{
			var b = rm[i]
			var _name = ""
			switch b.layer_type
			{
				case layertype.tile:
					_name = "Tile "
					if b.depth < 0
						_name = "Tile FG "
					break
				case layertype.background:
					_name = "Background "
					if b.depth < 0
						_name = "Foreground "
					break
			}

			_name += string(abs(b.depth))
			array_push(_arr, 
			{
				name: _name,
				depth: b.depth
			});
		}
	}
	array_sort(_arr, function(_a, _b)
	{
		return _a.depth - _b.depth;
	});
	for (i = 0; i < array_length(_arr); i++)
	{
		ds_list_add(items, _arr[i]);
		if (ds_list_find_value(items, i).depth == search_depth)
			selected_item = i;
	}
}
function RoomLayer() constructor
{
	static move_up = function(rm = noone)
	{
		var old_depth = depth;
		depth--;
		if depth == 0
			depth--;
		if rm != -4
		{
			for (var i = 0; i < array_length(rm); i++)
			{
				var b = rm[i];
				if b != self
				{
					if (sign(depth) == sign(old_depth))
					{
						if b.depth == depth
						{
							b.move_down();
							break;
						}
						continue;
					}
					if (sign(b.depth) == sign(old_depth))
						b.move_up();
					else if (sign(b.depth) == sign(depth))
						b.move_up();
				}
			}
		}
	};
	static move_down = function(rm = noone)
	{
		var old_depth = depth;
		depth++;
		if depth == 0
			depth++;
		if rm != -4
		{
			for (var i = 0; i < array_length(rm); i++)
			{
				var b = rm[i];
				if b != self
				{
					if (sign(depth) == sign(old_depth))
					{
						if b.depth == depth
						{
							b.move_up();
							break;
						}
						continue;
					}
					if (sign(b.depth) == sign(old_depth))
						b.move_down();
					else if (sign(b.depth) == sign(depth))
						b.move_down();
				}
			}
		}
	};
	static draw = function(rm)
	{
		switch layer_type
		{
			case layertype.background:
				draw_sprite_repeat(sprite_index, image_index, rm.x, rm.y, rm.width, rm.height);
				break;
		}
	};
	layer_type = layertype.background;
	sprite_index = noone;
	image_index = 0;
	depth = 1;
}
