if obj_player.state != states.bossintro
{
	with (instance_create(x, y - 75, obj_press))
		ID = other.id;
}
with obj_player
{
	hsp = 0;
	if other.drop == 0
	{
		if state != states.bossintro
		{
			sprite_index = spr_player_hurt;
			instance_create(x, y, obj_spikehurteffect);
		}
		if (key_jump || key_attack2 || key_slap2)
		{
			if grounded
			{
				vsp = -4;
				other.press += 2;
			}
		}
		state = states.bossintro;
	}
}
if (floor(image_index) == 0)
	image_speed = 0.35;
if floor(image_index) == image_number - 1
	image_speed = 0;
if press < 8
	closed = true;
