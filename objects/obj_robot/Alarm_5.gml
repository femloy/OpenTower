if elitehit == 1
{
	repeat (irandom_range(1, 3))
		create_heatpuff(x + irandom_range(-24, 24), y + 40);
	alarm[5] = 15 + irandom_range(-2, 5);
}
else
	alarm[5] = 10;
