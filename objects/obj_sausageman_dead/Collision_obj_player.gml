if (buffer == 0 && other.instakillmove == 1)
{
	vsp = random_range(-10, -18);
	hsp = sign(x - obj_player.x) * random_range(10, 18);
	grav = 0.4;
	angle = 0;
	randomize();
	spinspeed = choose(0, 0, 0, 10, 20);
	alarm[0] = 5;
	cigar = false;
	stomped = false;
	instance_create(x, y, obj_bangeffect);
	buffer = 10;
	if (x != obj_player.x)
		image_xscale = -sign(x - obj_player.x);
}
