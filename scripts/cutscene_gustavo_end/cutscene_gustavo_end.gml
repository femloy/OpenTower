function cutscene_gustavo_end()
{
	var finish = false;
	with obj_player1
	{
		if sprite_index == spr_player_gnomepizza
		{
			if (image_index > image_number - 1)
			{
				finish = true;
				state = states.normal;
			}
		}
	}
	if finish
	{
		global.showgnomelist = true;
		global.failcutscene = false;
		global.pizzadelivery = true;
		global.hp = 8;
		with obj_gustavo
			state = states.normal;
		if (!instance_exists(obj_gnome_checklist))
			instance_create(0, 0, obj_gnome_checklist);
		cutscene_end_action();
	}
}
