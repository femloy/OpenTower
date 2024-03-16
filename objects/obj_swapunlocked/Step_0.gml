if fadein
{
	fade = Approach(fade, 1, 0.05);
	if fade >= 1
		instance_destroy();
}
else
	fade = Approach(fade, 0, 0.1);
