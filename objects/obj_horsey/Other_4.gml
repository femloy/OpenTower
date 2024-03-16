var flag = false;
if (ds_list_find_index(global.baddieroom, id) != -1)
{
	state = states.finishingblow;
	flag = true;
}
else if (ds_list_find_index(global.saveroom, id) != -1)
{
	state = states.dead;
	flag = true;
}
if flag
{
	with obj_raceend
	{
		other.x = x + (sprite_width / 2);
		other.y = (y + sprite_height) - 32;
	}
}
