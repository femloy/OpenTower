event_inherited();
if pizzahead && elitehit <= 0 && destroyable
{
	scr_fakepep_destroy_sounds();
	instance_destroy(obj_fakepephead);
	instance_destroy(obj_fakepepprojectile);
	instance_destroy(obj_fakepepspawner);
	instance_destroy(obj_fakepeptauntspawner);
	with obj_music
	{
		if music != -4
			fmod_event_instance_set_parameter(music.event, "state", 4, true);
	}
	with (instance_create(room_width / 2, room_height + 100, obj_pizzafaceboss_p3))
	{
		state = states.pizzaheadjump;
		vsp = -26;
		hsp = 0;
		sprite_index = spr_pizzahead_intro3;
		with obj_bosscontroller
		{
			boss_hpsprite = spr_bossfight_pizzaheadHP;
			boss_palette = spr_bossfight_pizzaheadpalette
		}
	}
}
