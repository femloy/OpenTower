with (instance_place(x - 1, y, obj_player))
{
	if (state == states.mort && other.eaten == 0)
	{
		movespeed = abs(movespeed);
		other.eaten = true;
		grav = 0.5;
		state = states.normal;
	}
}
with (instance_place(x + 1, y, obj_player))
{
	if (state == states.mort && other.eaten == 0)
	{
		movespeed = abs(movespeed);
		other.eaten = true;
		grav = 0.5;
		state = states.normal;
	}
}
if (eaten)
{
	x = -100;
	y = -100;
	sprite_index = spr_corneaten;
	if (ds_list_find_index(global.saveroom, id) == -1)
		ds_list_add(global.saveroom, id);
}
