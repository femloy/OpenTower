if obj_editor.editor_state != editor_states.resize_room
{
	visible = false
	exit;
}
with obj_roomresize
{
	if dragged && id != other.id
	{
		other.visible = false
		exit;
	}
}
visible = true
if !dragged
{
	var _room = global.current_level.current_room
	if _room != noone
	{
		switch dock
		{
			case comp_dock.topleft:
				x = _room.x
				y = _room.y
				break
			case comp_dock.top:
				x = (_room.x + (_room.width / 2))
				y = _room.y
				break
			case comp_dock.topright:
				x = (_room.x + _room.width)
				y = _room.y
				break
			case comp_dock.right:
				x = (_room.x + _room.width)
				y = (_room.y + (_room.height / 2))
				break
			case comp_dock.bottomright:
				x = (_room.x + _room.width)
				y = (_room.y + _room.height)
				break
			case comp_dock.bottom:
				x = (_room.x + (_room.width / 2))
				y = (_room.y + _room.height)
				break
			case comp_dock.bottomleft:
				x = _room.x
				y = (_room.y + _room.height)
				break
			case comp_dock.left:
				x = _room.x
				y = (_room.y + (_room.height / 2))
				break
		}

		with obj_editor
		{
			var pos = editor_get_world_pos()
			var xx = pos[0]
			var yy = pos[1]
			if (key_place && (!(editor_is_cursor_on_ui(obj_editorcursor.x, obj_editorcursor.y))) && place_meeting(xx, yy, other))
			{
				other.dragged = true
				other.startx = _room.x
				other.starty = _room.y
				other.startwidth = (_room.x + _room.width)
				other.startheight = (_room.y + _room.height)
			}
		}
	}
}
else
{
	pos = editor_get_world_pos()
	x = pos[0]
	y = pos[1]
	_room = global.current_level.current_room
	var _x = snap_tile(x, 32)
	var _y = snap_tile(y, 32)
	switch dock
	{
		case comp_dock.topleft:
			_room.x = _x
			_room.y = _y
			_room.width = (startwidth - _x)
			_room.height = (startheight - _y)
			if _room.width < 960
			{
				_room.x = ((_room.x + _room.width) - 960)
				_room.width = 960
			}
			if _room.height < 540
			{
				_room.y = ((_room.y + _room.height) - 540)
				_room.height = 540
			}
			break
		case comp_dock.top:
			_room.y = _y
			_room.height = (startheight - _y)
			if _room.height < 540
			{
				_room.y = ((_room.y + _room.height) - 540)
				_room.height = 540
			}
			break
		case comp_dock.topright:
			_room.y = _y
			_room.width = (_x - _room.x)
			_room.height = (startheight - _y)
			if _room.width < 960
				_room.width = 960
			if _room.height < 540
			{
				_room.y = ((_room.y + _room.height) - 540)
				_room.height = 540
			}
			break
		case comp_dock.right:
			_room.width = (_x - _room.x)
			if _room.width < 960
				_room.width = 960
			break
		case comp_dock.bottomright:
			_room.width = (_x - _room.x)
			_room.height = (_y - _room.y)
			if _room.width < 960
				_room.width = 960
			if _room.height < 540
				_room.height = 540
			break
		case comp_dock.bottom:
			_room.height = (_y - _room.y)
			if _room.height < 540
				_room.height = 540
			break
		case comp_dock.bottomleft:
			_room.x = _x
			_room.width = (startwidth - _x)
			_room.height = (_y - _room.y)
			if _room.width < 960
			{
				_room.x = ((_room.x + _room.width) - 960)
				_room.width = 960
			}
			if _room.height < 540
				_room.height = 540
			break
		case comp_dock.left:
			_room.x = _x
			_room.width = (startwidth - _x)
			if _room.width < 960
			{
				_room.x = ((_room.x + _room.width) - 960)
				_room.width = 960
			}
			break
	}
	if obj_editor.key_place_released
		dragged = false
}
