ID = 3
var _buttons = [
	["Add", function() {room_layer_add(1)}],
	["Remove", function() {room_layer_delete(1)}],
	["Move Up", function() {room_layer_move_up(1)}],
	["Move Down", function() {room_layer_move_down(1)}]
];
for (var i = 0; i < array_length(_buttons); i++)
{
	var b = _buttons[i]
	with instance_create_depth(0, 32 * i, depth - 1, obj_button)
	{
		name = b[0]
		parent = other.id
		icon = spr_editor_utilicons
		icon_index = i
		image_xscale = 0.5
		image_yscale = 0.5
		on_left_click = b[1]
	}
}
with instance_create_depth(32, 0, depth - 1, obj_itemlist)
{
	image_yscale = other.image_yscale
	image_xscale = ((other.sprite_width - 32) / 64)
	parent = other.id
	ID = 1
	search_depth = -100
	on_dirty = function()
	{
		if global.current_level.current_room == noone
			return;
		dirty = false
		room_layer_item_dirty(global.current_level.current_room.tiles)
	}

	on_item_draw = function(_x, _y, _item)
	{
		if draw_get_font() != 0
			draw_set_font(fnt_caption)
		draw_set_halign(fa_left)
		draw_set_valign(fa_middle)
		draw_text_color(_x + 12, _y + item_height / 2, _item.name, c_white, c_white, c_white, c_white, 1)
	}
}
