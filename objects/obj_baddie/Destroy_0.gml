if room == rm_editor
	exit;
if (ds_list_find_index(global.baddieroom, id) == -1 && (!elite || elitehit <= 0) && destroyable)
{
	if object_index != obj_peppinoclone && object_index != obj_ghoul && object_index != obj_bazookabaddie && object_index != obj_snowman
	{
		with (instance_create(x, y, obj_sausageman_dead))
		{
			sprite_index = other.spr_dead;
			spr_palette = other.spr_palette;
			paletteselect = other.paletteselect;
			usepalette = other.usepalette;
			if other.object_index == obj_swapplayergrabbable
			{
				oldpalettetexture = other.patterntexture;
				if other.spr_dead == spr_player_ratmountgameover && !other.gusrat
					create_debris(x, y, spr_ratblock_dead);
			}
			if !usepalette
				paletteselect = 0;
			image_alpha = other.image_alpha;
			if other.object_index == obj_ghostknight
				image_alpha = 0.3;
			if other.object_index == obj_noiseboss && other.pizzahead && !obj_player1.ispeppino
			{
				sprite_index = spr_doise_deadair;
				hsp = 0;
				vsp = 0;
			}
		}
	}
	else if object_index == obj_peppinoclone
	{
		with (instance_create(x, y, obj_explosioneffect))
		{
			image_speed = 0.35;
			depth = other.depth;
			sprite_index = spr_pepclone_death;
			image_xscale = other.image_xscale;
		}
	}
	else if object_index == obj_ghoul
	{
		var i = 0;
		repeat (sprite_get_number(spr_ghoul_gibs))
		{
			with (create_debris(x, y, spr_ghoul_gibs))
			{
				image_index = i;
				vsp = -irandom_range(10, 14);
			}
			i++;
		}
	}
	if object_index == obj_sausageman && whoopass == 1
	{
		with (instance_create(x, y, obj_whoop))
		{
			create_particle(x, y, particle.genericpoofeffect);
			vsp = -11;
		}
	}
	if object_index == obj_tank
	{
		repeat 3
		{
			with (instance_create(x, y, obj_sausageman_dead))
				sprite_index = other.spr_content_dead;
		}
	}
	if object_index == obj_bazookabaddie
	{
		with (instance_create(x, y, obj_sausageman_dead))
			sprite_index = spr_tank_dead;
		repeat 4
		{
			with (instance_create(x, y, obj_sausageman_dead))
				sprite_index = spr_tank_wheel;
		}
	}
	if object_index == obj_cheeseslime && snotty
	{
		ini_open_from_string(obj_savesystem.ini_str);
		ini_write_real("Game", "snotty", true);
		obj_savesystem.ini_str = ini_close();
		gamesave_async_save();
	}
	notification_push(notifs.baddie_kill, [room, id, object_index]);
}
if (ds_list_find_index(global.baddieroom, id) == -1 && important == 0)
{
	if global.prank_cankillenemy && !global.prank_enemykilled
	{
		global.prank_enemykilled = true;
		trace("P Rank started!");
	}
	if (!instance_exists(obj_bosscontroller))
	{
		if (!elite || elitehit <= 0)
		{
			with obj_player1
				supercharge += 1;
		}
		if (!elite || elitehit <= 0)
		{
			global.combo += 1;
			global.enemykilled += 1;
			global.combotime = 60;
		}
		if (instance_exists(obj_hardmode))
			global.heatmeter_count++;
		if (!elite || elitehit <= 0)
		{
			var combototal = 10 + floor(global.combo * 0.5);
			global.collect += combototal;
			global.comboscore += combototal;
		}
	}
	fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
	repeat 3
	{
		with (create_debris(x, y, spr_slapstar))
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
		}
	}
	instance_create(x, y, obj_bangeffect);
	with obj_camera
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}
	if object_index == obj_miniufo
		instance_create(x, y, obj_playerexplosion);
	ds_list_add(global.baddieroom, id);
	if escape
		ds_list_add(global.escaperoom, id);
}
else if (ds_list_find_index(global.baddieroom, id) == -1 && important == 1)
{
	trace("destroy unimportant");
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_baddiegibs);
	fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
	with obj_camera
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}
	ds_list_add(global.baddieroom, id);
}
