if (place_meeting(x, y, obj_file1))
{
	sprite_index = spr_santasleightpep;
	with obj_file1
	{
		visible = false;
		santaed = true;
	}
}
if go == 1
{
	hsp = 10;
	vsp -= 0.05;
}
x += hsp;
y += vsp;
