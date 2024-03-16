function EditorObject(_id, _name, _sprite, _object, _snap_tile_val = 32) constructor
{
	sprite_index = _sprite;
	object_index = _object;
	mask_index = _sprite;
	name = _name;
	ID = _id;
	xoffset = 0;
	yoffset = 0;
	snap_tile_val = _snap_tile_val;
}
