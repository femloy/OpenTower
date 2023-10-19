if (collide)
{
	if (vsp < 20)
		vsp += grav;
	y += vsp;
	var _maxy = 112;
	if (y > _maxy)
	{
		y = _maxy;
		vsp = 0;
		if (!grounded)
		{
			vsp = -6;
			repeat (8)
				create_debris(irandom_range(bbox_left, bbox_right), bbox_bottom, spr_debris);
			with (obj_camera)
			{
				shake_mag = 3;
				shake_mag_acc = 3 / room_speed;
			}
			grounded = true;
		}
	}
}
