function scr_enemy_land()
{
	if (vsp > 0)
		hsp = 0;
	sprite_index = landspr;
	image_speed = 0.35;
	if (floor(image_index) == (image_number - 1))
	{
		sprite_index = idlespr;
		state = states.idle;
		image_index = 0;
	}
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		hsp += (_railinst.movespeed * _railinst.dir);
	}
}
