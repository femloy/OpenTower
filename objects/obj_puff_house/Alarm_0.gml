var x1 = 60;
var x2 = x1 + 120;
alarm[0] = 10;
with (create_heatpuff(random_range(x1, x2), room_height + 20))
{
	image_speed = 0.25;
	vsp = -irandom_range(8, 11);
}
