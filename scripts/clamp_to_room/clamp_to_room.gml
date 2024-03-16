function clamp_to_room(_editor_room)
{
	while bbox_top < _editor_room.y
		y++
	while (bbox_bottom > (_editor_room.y + _editor_room.height))
		y--
	while bbox_left < _editor_room.x
		x++
	while (bbox_right > (_editor_room.x + _editor_room.width))
		x--
}
