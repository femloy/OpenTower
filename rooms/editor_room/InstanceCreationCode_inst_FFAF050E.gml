ID = 8;
with instance_create_depth(0, 0, depth - 1, obj_itemlist)
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

	on_item_click = function(pos)
	{
		if pos < ds_list_size(items)
		{
			var _room = global.current_level.current_room;
			if _room == noone
				exit;
			
			var _arr = _room.backgrounds;
			for(var i = 0; i < array_length(_arr); i++)
			{
				var b = _arr[i]
				if b.depth == value.depth
				{
					b.sprite_index = ds_list_find_value(items, pos);
					break
				}
			}
		}
	}

	on_item_draw = function(_x, _y, _sprite, _index)
	{
		var a = 1;
		if _index > 0
			a = 0.5;
		draw_sprite_ext(spr_emptybg, 0, _x, _y, sprite_width / 64, item_height / 64, 0, c_white, a);
		var scale = sprite_width / sprite_get_width(_sprite);
		var sx = 0;
		var bb_top = sprite_get_bbox_top(_sprite);
		var bb_bottom = sprite_get_bbox_bottom(_sprite);
		var sy = bb_top + ((bb_bottom - bb_top) / 4);
		draw_sprite_part_ext(_sprite, 0, sx, sy, sprite_width / scale, item_height / scale, _x, _y, scale, scale, c_white, a);
	}
}
