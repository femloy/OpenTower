if (sprite_index == spr_player_mach)
{
	with (instance_create(x, y, obj_playereffectprop))
	{
		depth = other.depth - 1;
		hsp = other.fake_hsp;
		sprite_index = spr_dashcloud2;
		image_speed = 0.4;
	}
	alarm[1] = 15;
}
else
{
	with (instance_create(x - fake_hsp, y, obj_playereffectprop))
	{
		depth = other.depth - 1;
		hsp = other.fake_hsp;
		sprite_index = spr_superdashcloud;
		image_speed = 0.4;
	}
	alarm[1] = 20;
}
