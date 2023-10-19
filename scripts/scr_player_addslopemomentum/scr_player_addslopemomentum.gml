function scr_player_addslopemomentum(slow_acc, fast_acc)
{
	with (instance_place(x, y + 1, obj_slope))
	{
		if (sign(image_xscale) == -sign(other.xscale))
		{
			if abs(image_yscale) < abs(image_xscale) // wide slope
				other.movespeed += slow_acc;
			else // normal slope
				other.movespeed += fast_acc;
		}
	}
}
function scr_pizzaball_addslopemomentum(slow_acc, fast_acc)
{
	with (instance_place(x, y + 1, obj_slope))
	{
		if (sign(image_xscale) == -sign(other.image_xscale))
		{
			if (abs(image_yscale) < abs(image_xscale))
				other.slopespeed += slow_acc;
			else
				other.slopespeed += fast_acc;
		}
		else if (abs(image_yscale) < abs(image_xscale))
			other.slopespeed -= slow_acc;
		else
			other.slopespeed -= fast_acc;
	}
	if (slopespeed < 0)
		slopespeed = 0;
	if (slopespeed > 10)
		slopespeed = 10;
	if (movespeed < 1)
		slopespeed = 0;
}
