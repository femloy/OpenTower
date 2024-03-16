draw_self();
if (!surface_exists(surf))
	surf = surface_create(sprite_width, sprite_height);
surface_set_target(surf);
draw_clear(0);
var _pos = get_list_pos(obj_editorcursor.y);
if !hovered
	_pos = -1;
for (var i = 0; i < ds_list_size(items); i++)
{
	var _index = 0;
	if _pos == i
	{
		_index = 1;
		if clicked
		{
			_index = 2;
			clicked = false;
		}
	}
	if selected_item == i
		_index = 2;
	var yy = (i * item_height) + scroll;
	draw_sprite_ext(item_sprite, _index, 0, yy, image_xscale, item_height / sprite_get_height(item_sprite), 0, c_white, image_alpha);
	on_item_draw(0, yy, ds_list_find_value(items, i), _index);
	if (yy > (sprite_height + item_height))
		break;
}
surface_reset_target();
draw_surface(surf, x, y);
