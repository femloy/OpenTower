if (bgindex > sprite_get_number(bgsprite))
	bgindex = frac(bgindex);
bgindex += 0.35;
if fadein
{
	fade = Approach(fade, 1, 0.1);
	if fade >= 1
	{
		fadein = false;
		start = true;
	}
}
else
	fade = Approach(fade, 0, 0.1);
if (instance_exists(obj_fadeout))
	fade = obj_fadeout.fadealpha;
if shake_mag > 0
	shake_mag = Approach(shake_mag, 0, shake_mag_acc);
else
{
	shakecount++;
	if (shakecount < (4 + irandom(2)))
	{
		shake_mag = 5;
		shake_mag_acc = 3 / room_speed;
	}
	else
	{
		shakecount = 0;
		shake_mag = 15;
		shake_mag_acc = 5 / room_speed;
	}
}
