if vsp < 20
	vsp += grav;
if buffer > 0
	buffer--;
if d > 150
	d -= 20;
make_colour_hsv(255, 255, d);
x += hsp;
y += floor(vsp);
if buffer <= 0
{
	var p = obj_player1.id;
	if (p.instakillmove && place_meeting(x, y, p))
	{
		vsp = random_range(-10, -18);
		hsp = sign(x - p.x) * random_range(10, 18);
		grav = 0.4;
		angle = 0;
		spinspeed = choose(0, 0, 0, 10, 20);
		alarm[0] = 5;
		cigar = false;
		stomped = false;
		instance_create(x, y, obj_bangeffect);
		buffer = 10;
		if x != p.x
			image_xscale = -sign(x - p.x);
	}
}
