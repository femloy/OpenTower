y += vsp;
if (vsp < 20)
	vsp += grav;
if (vsp > 0 && place_meeting(x, y + vsp, obj_solid))
{
	while (!place_meeting(x, y + sign(vsp), obj_solid))
		y += sign(vsp);
	instance_destroy();
}
