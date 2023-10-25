event_inherited()
requires_level = 1
ID = -4
items = ds_list_create()
item_height = 32
item_sprite = spr_button_nineslice
scroll = 0
selected_item = -4
dirty = 1
clicked = 0
surf = -4

on_item_click = function(argument0)
{
	if (argument0 < ds_list_size(items))
	{
		if (selected_item == argument0)
			on_item_double_click(argument0);
		selected_item = argument0;
	}
	else
		selected_item = -4;
};
on_item_double_click = function(argument0)
{
	trace("double clicked item ", argument0);
};
on_item_draw = function(_x, _y, _item)
{
	if (draw_get_font() != fnt_caption)
		draw_set_font(fnt_caption);
	draw_set_halign(0);
	draw_set_valign(1);
	draw_text_color(_x + 12, _y + (item_height / 2), _item.name, c_white, c_white, c_white, c_white, 1);
};
on_dirty = function()
{
	trace("list dirty");
	dirty = false;
};
on_left_click = function()
{
	var yy = get_list_pos(obj_editorcursor.y);
	if (yy < 0)
		exit;
	clicked = true;
	on_item_click(yy);
};
