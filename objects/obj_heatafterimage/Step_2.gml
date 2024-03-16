if room == rank_room
	visible = false;
mask_index = obj_player1.mask_index;
if (place_meeting(x, y + 1, obj_slope) && scr_solid(x, y + 1))
	y = obj_player1.y;
x += (Vspeed + obj_player1.hsp);
y += ((Hspeed + obj_player1.vsp) - 1);
if is_visible
{
	visible = obj_player1.visible;
	if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
		visible = false;
}
if (!instance_exists(obj_pizzaface_thunderdark))
	visible = false;
