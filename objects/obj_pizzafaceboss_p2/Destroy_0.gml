if destroyable && elitehit <= 0
{
	global.pistol = false;
	scr_pizzaface_p2_destroy_sounds();
	with obj_player
	{
		sprite_index = spr_idle;
		pistolanim = -4;
	}
	instance_destroy(obj_pizzaheadswordstone);
	instance_destroy(obj_pizzahead_haywire);
	instance_destroy(obj_pizzahead_cog);
	instance_destroy(obj_forknightspawner);
	instance_destroy(obj_forknight_pizzahead);
	instance_destroy(obj_medievalprojectile);
	instance_destroy(obj_pizzaheadportrait, false);
	instance_destroy(obj_pizzaheadminigun);
	instance_destroy(obj_pizzaheadbullet);
	instance_create(x, y, obj_pizzahead_whitefade);
	with (instance_create(room_width * 0.6, 369, obj_pizzafaceboss_p3intro))
	{
		image_xscale = -1;
		state = states.arenaintro;
		sprite_index = spr_pizzahead_phase3_intro1;
		image_index = 0;
		introbuffer = 120;
	}
	with obj_player
	{
		hsp = 0;
		vsp = 0;
		x = room_width * 0.3;
		y = 402;
		state = states.actor;
		xscale = 1;
		sprite_index = spr_idle;
		image_speed = 0.35;
	}
}
else
	event_inherited();
