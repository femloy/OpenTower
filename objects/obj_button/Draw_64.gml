event_inherited()
if text != ""
{
	draw_set_font(fnt_caption)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	draw_text_color((x + 4), (y + (sprite_height / 2)), text, c_white, c_white, c_white, c_white, 1)
}
if icon != -4
	draw_sprite(icon, icon_index, (x + (sprite_width / 2)), (y + (sprite_height / 2)))
if name != "" && hovered
{
	draw_set_font(fnt_caption)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	var w = string_width(name)
	var h = string_height(name)
	draw_rectangle_color((bbox_right + 12), (((y + (sprite_height / 2)) - (h / 2)) - 2), (((bbox_right + 12) + w) + 4), (((y + (sprite_height / 2)) + (h / 2)) + 2), c_black, c_black, c_black, c_black, false)
	draw_text_color((bbox_right + 14), (y + (sprite_height / 2)), name, c_white, c_white, c_white, c_white, 1)
}
