var tx = playerid.x
var ty = (playerid.y - 60)
var acc = 0.2

switch state
{
	case 0:
		if place_meeting(x, y, obj_player)
		{
			playerid = obj_player1.id
			state++
			global.combotime = 60
			ds_list_add(global.saveroom, id)
			xoffset = (x - tx)
			yoffset = (y - ty)
		}
		break
	case 1:
		depth = -99
		x = (tx + xoffset)
		y = (ty + yoffset)
		xoffset = Approach(xoffset, 0, 4)
		yoffset = Approach(yoffset, 0, 4)
		if xoffset == 0 && yoffset == 0
		{
			alarm[0] = 1
			alarm[1] = 2
			state++
		}
		break
	case 2:
		x = lerp(x, tx, 0.2)
		y = lerp(y, ty, 0.2)
		if value <= 0
			state++
		break
	case 3:
		x += 4
		y -= 8
		if (!bbox_in_camera(view_camera[0], 10))
			instance_destroy()
		break
}

