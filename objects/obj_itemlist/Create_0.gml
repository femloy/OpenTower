event_inherited()
requires_level = true
ID = -4
items = ds_list_create()
item_height = 32
item_sprite = spr_button_nineslice
scroll = 0
selected_item = -4
dirty = true
clicked = false
surf = -4

on_item_click = function(item_id)
{
	if (item_id < ds_list_size(items))
	{
		if selected_item == item_id
			on_item_double_click(item_id);
		selected_item = item_id;
	}
	else
		selected_item = -4;
};
on_item_double_click = function(item_id)
{
	trace("double clicked item ", item_id);
};
on_item_draw = function(_x, _y, _item)
{
	if (draw_get_font() != fnt_caption)
		draw_set_font(fnt_caption);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
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
	if yy < 0
		exit;
	clicked = true;
	on_item_click(yy);
};
