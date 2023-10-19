if (escape == 0 || (escape == 1 && global.panic == true))
{
	with (instance_create(x, y, obj_sausageman_dead))
		sprite_index = spr_meatball_dead;
}
