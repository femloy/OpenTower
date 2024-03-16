switch state
{
	case states.normal:
		if obj_player1.x <= x
		{
			state = states.arenaround;
			round_count = 10;
			with obj_arenagate
			{
				sprite_index = spr_arenagate_close;
				image_index = 0;
				block_inst = instance_create(x, y, obj_solid);
				with block_inst
				{
					sprite_index = spr_arenagate_open;
					image_xscale = other.image_xscale;
					image_yscale = other.image_yscale;
				}
			}
		}
		break;
	case states.arenaintro:
		with obj_player
			state = states.gottreasure;
		if cutscene_count > 0
			cutscene_count--;
		else
		{
			with obj_player
			{
				state = states.normal;
				image_index = 0;
			}
			state = states.arenaround;
			round_count = 10;
		}
		break;
	case states.arenaround:
		if round_count > 0
			round_count--;
		else
			state = states.spawnenemy;
		break;
	case states.spawnenemy:
		if (!ds_list_empty(baddielist))
		{
			for (var i = 0; i < ds_list_size(baddielist); i++)
			{
				var b = ds_list_find_value(baddielist, i);
				if b[0] == wave
				{
					instance_activate_object(b[1]);
					if (instance_exists(b[1]))
					{
						with (instance_create(b[1].x, b[1].y, obj_arena_pizzaportal))
						{
							stored_id = b[1];
							alarm[0] = other.round_max;
						}
						instance_deactivate_object(b[1]);
					}
				}
				else
					instance_deactivate_object(b[1]);
			}
		}
		wave_minutes = minutes;
		wave_seconds = seconds;
		round_count = round_max;
		state = states.arena;
		with obj_arenadoor
		{
			wave = other.wave;
			alarm[0] = 10;
			finish = false;
			if objectlist[wave] == noone
			{
				alarm[0] = -1;
				finish = true;
			}
		}
		break;
	case states.arena:
		var _doorfinish = true;
		with obj_arenadoor
		{
			if !finish
				_doorfinish = false;
		}
		if (!instance_exists(obj_baddie) && !instance_exists(obj_arena_pizzaportal) && (!instance_exists(obj_arenadoor) || _doorfinish))
		{
			wave++;
			if wave > maxwave
			{
				instance_destroy();
				instance_destroy(block_inst);
				with obj_arenagate
				{
					image_index = 0;
					sprite_index = spr_arenagate_open;
					instance_destroy(block_inst);
				}
				cutscene_count = outro_max;
				with obj_player
				{
					with obj_music
						arena = false;
				}
			}
			else
			{
				state = states.spawnenemy;
				round_count = round_max;
			}
		}
		break;
	case states.transition:
		if floor(image_index) == image_number - 1
			state = states.victory;
		break;
	case states.victory:
		instance_destroy();
		break;
}
if state != states.normal && state != states.arenaintro
	visible = false;
