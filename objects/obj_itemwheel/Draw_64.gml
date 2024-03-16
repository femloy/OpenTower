event_inherited()
var _angle = 45 / 2
var _len = (sprite_height / 4)
for (var i = 0; i < array_length(items); i++)
{
	var b = items[i]
	var lenx = lengthdir_x(_len, _angle)
	var leny = lengthdir_y(_len, _angle)
	if b != noone
		draw_sprite(b.sprite_index, 0, (((x + lenx) - sprite_get_xoffset(b.sprite_index)) - (sprite_get_height(b.sprite_index) / 2)), (((y + leny) - sprite_get_yoffset(b.sprite_index)) - (sprite_get_height(b.sprite_index) / 2)))
	_angle += 45
}
