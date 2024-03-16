function EditorRoom(_x, _y) constructor
{
	x = _x
	y = _y
	
	var _size = 0
	if global.current_level != noone
		_size = ds_list_size(global.current_level.rooms)
	
	name = concat("Room ", _size)
	instances = array_create(0)
	backgrounds = array_create(0)
	tiles = array_create(0)
	width = CAMERA_WIDTH
	height = CAMERA_HEIGHT
}
