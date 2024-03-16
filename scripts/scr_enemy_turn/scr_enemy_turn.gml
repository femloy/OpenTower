function scr_enemy_turn()
{
	sprite_index = turnspr;
	image_speed = 0.35;
	if floor(image_index) == image_number - 1
	{
		if object_index != obj_tank
		{
			state = states.idle;
			image_index = 0;
			sprite_index = idlespr;
		}
		else
		{
			state = states.walk;
			image_index = 0;
			sprite_index = walkspr;
		}
	}
}
