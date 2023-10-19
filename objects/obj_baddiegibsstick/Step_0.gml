if (!collisioned)
{
	if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x, y, obj_solid))
		hsp *= -1;
	if (grounded)
	{
		image_speed = 0.35;
		collisioned = true;
		hsp = 0;
		vsp = 0;
		ds_list_add(global.baddietomb, [room, x, y]);
	}
}
scr_collide();
