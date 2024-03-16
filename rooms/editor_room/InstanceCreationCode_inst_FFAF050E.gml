ID = 8;
with (instance_create_depth(0, 0, depth - 1, obj_itemlist))
{
	parent = other.id;
	ID = 8;
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
	value = noone;
	item_height = 32;
	on_dirty = function()
	{
		dirty = false;
		ds_list_clear(items);
		ds_list_copy(items, obj_editor.backgrounds_list);
	}

	on_item_click = function(argument0)
	{
		if (argument0 < ds_list_size(items))
		{
			var _room = global.current_level.current_room
			if (_room == noone)
				exit;
			var _arr = _room.backgrounds
			for(var i = 0; i < array_length(_arr); i++)
			{
				var b = _arr[i]
				if (b.depth == value.depth)
				{
					b.sprite_index = ds_list_find_value(items, argument0)
					break
				}
			}
		}
	}

	on_item_draw = function(argument0, argument1, argument2, argument3)
	{
		var a = 1
		if (argument3 > 0)
			a = 0.5
		draw_sprite_ext(spr_emptybg, 0, argument0, argument1, (sprite_width / 64), (item_height / 64), 0, c_white, a)
		var scale = (sprite_width / sprite_get_width(argument2))
		var sx = 0
		var bb_top = sprite_get_bbox_top(argument2)
		var bb_bottom = sprite_get_bbox_bottom(argument2)
		var sy = (bb_top + ((bb_bottom - bb_top) / 4))
		draw_sprite_part_ext(argument2, 0, sx, sy, (sprite_width / scale), (item_height / scale), argument0, argument1, scale, scale, c_white, a)
	}
}
