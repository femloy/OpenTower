if room == rank_room
	visible = false;
else
	visible = true;
for (var i = 0; i < array_length(monster_alarm); i++)
{
	if monster_active[i]
	{
		if (i != 4 || effect_buffer <= 0)
		{
			if (monster_room[i] != room_get_name(room))
			{
				if alarm[i] < 0
					alarm[i] = monster_alarm[i];
			}
			else
				alarm[i] = monster_alarm[i];
		}
	}
}
monster_active[4] = global.panic;
if player_posX == -1 && player_posY == -1
	effect_buffer = 0;
if effect_buffer > 0
	effect_buffer--;
else if pineapple_effect != 0
{
	pineapple_effect = 0;
	with obj_monster
	{
		if fake
			instance_destroy();
	}
	with obj_pizzakinpineapple
	{
		sprite_index = choose(spr_monsterpineapple_pose1, spr_monsterpineapple_pose2, spr_monsterpineapple_pose3);
		image_index = 0;
	}
}
if player_posX != -1 && player_posY != -1
{
	if (scr_monster_audio_check())
	{
		sound_buffer = 600;
		sound_pos.x = player_posX;
		sound_pos.y = player_posY;
	}
}
if sound_buffer > 0
{
	for (i = 0; i < array_length(monster_alarm); i++)
	{
		if monster_active[i]
		{
			var t = floor(monster_alarm[i] / 3);
			if i == 2
				t = 1;
			if alarm[i] > t
				alarm[i] = t;
		}
		if i != 4 && monster_pos[i].x == sound_pos.x && monster_pos[i].y == sound_pos.y
			sound_buffer = 0;
	}
}
else
{
	sound_pos.x = -1;
	sound_pos.y = -1;
}
