with other
{
	if (key_up && ladderbuffer <= 0 && (state == states.normal || state == states.pogo || state == states.machcancel || state == states.mach2 || state == states.mach3 || state == states.mach1 || state == states.punch || state == states.shotgunjump || state == states.jump || state == states.highjump || (state == states.ratmountbounce && !ispeppino)) && state != states.hurt && state != states.machslide && state != states.freefall && state != states.freefallland)
	{
		input_buffer_jump = 0;
		state = states.ladder;
		x = other.x + 16;
		y = floor(y);
		if ((y % 2) == 1)
			y -= 1;
	}
	if (key_up && ladderbuffer <= 0 && isgustavo && (state == states.ratmountjump || state == states.ratmountbounce || state == states.noisecrusher || state == states.ratmount))
	{
		input_buffer_jump = 0;
		state = states.ratmountladder;
		if brick == 1
		{
			with (instance_create(x, y, obj_brickcomeback))
			{
				wait = true;
				instance_create(x, y, obj_genericpoofeffect);
			}
		}
		brick = false;
		x = other.x + 16;
		y = floor(y);
		if ((y % 2) == 1)
			y -= 1;
	}
}
