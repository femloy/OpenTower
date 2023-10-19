if (destroyable && elitehit <= 0)
	scr_vigilante_destroy_sounds();
if (elitehit <= 0 && pizzahead && destroyable)
{
	instance_destroy(obj_johnecheese);
	instance_destroy(obj_johnecheese_spawner);
	instance_destroy(obj_vigilantecrate);
	instance_destroy(obj_vigilantebazooka);
	instance_destroy(obj_vigilantebazookatrail);
	instance_destroy(obj_vigilantecow);
	instance_destroy(obj_cowspawner);
	instance_destroy(obj_cowstampede);
	instance_destroy(obj_cowfall);
	instance_destroy(obj_uziprojectile);
	instance_destroy(obj_vigilantedynamite);
	instance_destroy(obj_vigilanteshot);
	instance_destroy(obj_ladderhorizontal);
	instance_destroy(obj_noisey);
	with (instance_create(room_width / 4, room_height + 100, obj_noiseboss))
	{
		with (obj_bosscontroller)
		{
			boss_hpsprite = spr_bossfight_noiseHP;
			boss_palette = spr_bossfight_noisepalette
		}
		instance_destroy(spotlightID);
		pizzahead = true;
		flickertime = 0;
		state = states.pizzaheadjump;
		sprite_index = spr_playerN_jump;
		image_index = 0;
		image_speed = 0.35;
		hsp = 0;
		vsp = -18;
		elitehit = 4;
		cooldown = 0;
		prevhp = elitehit;
	}
}
event_inherited();
