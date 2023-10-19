if (playerid != -4)
{
	with (playerid)
	{
		if (floor(image_index) >= 9)
		{
			if (global.noisejetpack == 1)
			{
				fmod_event_one_shot_3d("event:/sfx/misc/cow", x, y);
				global.noisejetpack = false;
			}
		}
		if (floor(image_index) == (image_number - 1))
		{
			state = states.normal;
			landAnim = false;
			with (other)
			{
				playerid = -4;
				if (ds_list_find_index(global.saveroom, id) == -1)
				{
					ds_list_add(global.saveroom, id);
					global.collect += 1000;
					global.combotime = 60;
					with (instance_create(x, y, obj_smallnumber))
						number = string(1000);
				}
			}
		}
	}
}
if (sprite_index == spr_freemilksuprised && floor(image_index) == (image_number - 1))
	sprite_index = spr_freemilk;
