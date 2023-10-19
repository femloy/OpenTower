showtext = place_meeting(x, y, obj_player);
if (instance_exists(obj_transfotip))
	showtext = false;
if (showtext)
	alpha = Approach(alpha, 1, 0.1);
else
	alpha = Approach(alpha, 0, 0.1);
