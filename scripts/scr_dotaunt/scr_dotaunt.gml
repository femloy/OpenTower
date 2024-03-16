function scr_dotaunt()
{
	if ((key_taunt2 || input_finisher_buffer > 0 || (state == states.backbreaker && key_up && supercharged)) && !skateboarding)
	{
		input_finisher_buffer = 0;
		pistolanim = -4;
		flash = false;
		notification_push(notifs.taunt, [room]);
		if ((!key_up || !supercharged) && room != war_1 && global.tauntcount < 10 && place_meeting(x, y, obj_exitgate) && (global.panic == true || instance_exists(obj_wartimer) || (instance_exists(obj_randomsecret) && obj_randomsecret.start)) && global.combotime > 0)
		{
			global.tauntcount++;
			notification_push(notifs.gate_taunt, []);
			global.collect += 25;
			with (instance_create(x + 16, y, obj_smallnumber))
				number = string(25);
			create_collect(x, y, spr_taunteffect, 25);
			scr_sound_multiple("event:/sfx/misc/collect", x, y);
		}
		if !finisher
		{
			taunttimer = 20;
			if state != states.backbreaker && sprite_index != spr_supertaunt1 && sprite_index != spr_supertaunt2 && sprite_index != spr_supertaunt3 && sprite_index != spr_supertaunt4 && sprite_index != spr_player_ratmountsupertaunt
			{
				tauntstoredmovespeed = movespeed;
				tauntstoredvsp = vsp + grav;
				tauntstoredsprite = sprite_index;
				tauntstoredstate = state;
			}
			state = states.backbreaker;
			if supercharged && key_up
			{
				ini_open_from_string(obj_savesystem.ini_str);
				ini_write_real("Game", "supertaunt", true);
				obj_savesystem.ini_str = ini_close();
				fmod_event_one_shot_3d("event:/sfx/pep/supertaunt", x, y);
				image_index = 0;
				sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4);
				if isgustavo
					sprite_index = spr_player_ratmountsupertaunt;
			}
			else
			{
				scr_create_parryhitbox();
				fmod_event_one_shot_3d("event:/sfx/pep/taunt", x, y);
				taunttimer = 20;
				sprite_index = spr_taunt;
				image_index = random_range(0, 11);
			}
			with (instance_create(x, y, obj_taunteffect))
				player = other.id;
		}
	}
}
function scr_create_parryhitbox()
{
	parrytimer = taunt_to_parry_max;
	instance_destroy(parry_inst);
	parry_inst = instance_create(x, y, obj_parryhitbox);
	var _playerid = 1;
	if object_index == obj_player2
		_playerid = 2;
	with parry_inst
	{
		player_id = _playerid;
		image_xscale = other.xscale;
	}
}
