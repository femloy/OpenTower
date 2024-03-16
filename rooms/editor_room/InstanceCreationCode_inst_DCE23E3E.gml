ID = 5
with (instance_create_depth(0, 0, (depth - 1), obj_button))
{
	image_xscale = other.image_xscale
	image_yscale = 0.5
	parent = other.id
	icon = spr_editor_utilicons
	icon_index = 0
	on_left_click = function()
	{
		ds_list_add(global.current_level.rooms, new EditorRoom(0, 0))
		with (obj_itemlist)
		{
			if (ID == 3)
				dirty = true;
		}
	}

}
with (instance_create_depth(0, 32, (depth - 1), obj_itemlist))
{
	image_xscale = other.image_xscale
	image_yscale = ((other.sprite_height - 32) / 64)
	ID = 3
	parent = other.id
	on_dirty = function()
	{
		if (global.current_level == noone)
			exit;
		dirty = 0
		ds_list_clear(items)
		ds_list_copy(items, global.current_level.rooms)
	}

	on_item_click = function(argument0)
	{
		if (argument0 < ds_list_size(items))
		{
			change_room(ds_list_find_value(items, argument0))
			toggle_panel(obj_banditochicken_dynamite)
		}
	}

	on_item_draw = function(argument0, argument1, argument2)
	{
		if (draw_get_font() != 0)
			draw_set_font(fnt_caption)
		draw_set_halign(fa_left)
		draw_set_valign(fa_middle)
		draw_text_color((argument0 + 12), (argument1 + (item_height / 2)), argument2.name, c_white, c_white, c_white, c_white, 1)
	}

}
