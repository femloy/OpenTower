if active
{
	var hdeccel = abs(h_velocity) / 24;
	if hdir != hscale
	{
		hmovespeed = Approach(hmovespeed, 0, hdeccel);
		if hmovespeed <= 0
		{
			hscale *= -1;
			hdir = hscale;
		}
	}
	else
		hmovespeed = Approach(hmovespeed, h_velocity, hdeccel);
	var vdeccel = abs(v_velocity) / 24;
	if vdir != vscale
	{
		vmovespeed = Approach(vmovespeed, 0, vdeccel);
		if vmovespeed <= 0
		{
			vscale *= -1;
			vdir = vscale;
		}
	}
	else
		vmovespeed = Approach(vmovespeed, v_velocity, vdeccel);
	hsp = hmovespeed * hscale;
	vsp = vmovespeed * vscale;
	x += hsp;
	y += vsp;
	with (instance_place(x, y - (2 + abs(v_velocity)), obj_player))
	{
		var v = 0;
		if (abs(other.vsp) > 2)
			v = abs(other.vsp);
		if (!place_meeting(x, y - 6, other) && vsp >= -grav)
		{
			platformid = other.id;
			hsp_carry = other.hsp;
			if (abs(other.vsp) > 2)
				vsp_carry = other.vsp;
		}
	}
	if (changing_vdir && !place_meeting(x, y, obj_moving_vstop))
		changing_vdir = false;
	if (changing_hdir && !place_meeting(x, y, obj_moving_hstop))
		changing_hdir = false;
}
else if (place_meeting(x, y - 1, obj_player))
{
	with obj_player
	{
		if (place_meeting(x, y + 1, other) && !place_meeting(x, y, other))
		{
			other.active = true;
			platformid = other.id;
			other.vmovespeed = 0;
		}
	}
}
