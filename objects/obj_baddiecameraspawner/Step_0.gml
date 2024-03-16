if (!instance_exists(baddieID))
	refresh--;
if (refresh <= 0 && !point_in_camera_ext(x, y, view_camera[0], 100, 100))
{
	with (instance_create(x, y - 20, content))
	{
		if other.platformid != -4
			platformid = other.platformid;
		image_xscale = other.image_xscale;
		state = states.stun;
		stunned = 10;
		vsp = -2;
		other.baddieID = id;
		important = true;
	}
	refresh = 50;
}
scr_collide();
