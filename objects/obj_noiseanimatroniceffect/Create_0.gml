image_speed = 0.35;

var _y = ystart;
while !scr_solid(x, ystart + 1)
{
	ystart++;
	if ystart > room_height + 50
	{
		ystart = _y;
		break;
	}
}

if !global.swapmode
	y = camera_get_view_y(view_camera[0]) - 200;
else
{
	sprite_index = spr_playerN_animatronic;
	if !scr_solid(x, y + 1)
		sprite_index = spr_doise_deadair;
}

vsp = 0;
depth = -20;
