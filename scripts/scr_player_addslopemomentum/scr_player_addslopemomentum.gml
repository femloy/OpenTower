function scr_player_addslopemomentum(slopeaccel, slopedeccel)
{
	with (instance_place(x, y + 1, obj_slope))
	{
		if (sign(image_xscale) == -sign(other.xscale))
		{
			if abs(image_yscale) < abs(image_xscale)
				other.movespeed += slopeaccel;
			else
				other.movespeed += slopedeccel;
		}
	}
}
function scr_pizzaball_addslopemomentum(slopeaccel, slopedeccel)
{
	with (instance_place(x, y + 1, obj_slope))
	{
		if (sign(image_xscale) == -sign(other.image_xscale))
		{
			if (abs(image_yscale) < abs(image_xscale))
				other.slopespeed += slopeaccel;
			else
				other.slopespeed += slopedeccel;
		}
		else if (abs(image_yscale) < abs(image_xscale))
			other.slopespeed -= slopeaccel;
		else
			other.slopespeed -= slopedeccel;
	}
	if slopespeed < 0
		slopespeed = 0;
	if slopespeed > 10
		slopespeed = 10;
	if movespeed < 1
		slopespeed = 0;
}
