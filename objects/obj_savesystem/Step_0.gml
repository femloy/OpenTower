if room == hub_loadingscreen && state != 2
{
	with obj_player
	{
		state = states.comingoutdoor;
		sprite_index = spr_walkfront;
		image_index = 0;
	}
	if !fadeoutcreate
	{
		fadeoutcreate = true;
		var grouparr = ["hubgroup"];
		with obj_player
		{
			ini_open_from_string(obj_savesystem.ini_str);
			var _intro = ini_read_real("Tutorial", "finished", false);
			player_paletteselect[0] = ini_read_real("Game", "palette", 1);
			player_paletteselect[1] = ini_read_real("Game", "palette_player2", 1);
			var _texture = ini_read_string("Game", "palettetexture", "none");
			var _texture2 = ini_read_string("Game", "palettetexture_player2", "none");
			player_patterntexture[0] = scr_get_texture_palette(_texture);
			player_patterntexture[1] = scr_get_texture_palette(_texture2);
			ini_close();
			if _intro
			{
				targetRoom = tower_entrancehall;
				targetDoor = "A";
				state = states.victory;
				if other.ispeppino
				{
					with obj_player1
					{
						character = "P";
						ispeppino = true;
						scr_characterspr();
					}
				}
				else
				{
					with obj_player1
					{
						character = "P";
						ispeppino = false;
						scr_characterspr();
					}
				}
			}
			else
			{
				targetRoom = Finalintro;
				targetDoor = "A";
				state = states.titlescreen;
			}
		}
		with (instance_create(x, y, obj_fadeout))
		{
			gamestart = true;
			restarttimer = true;
		}
		icon_alpha = 0;
		with obj_achievementtracker
		{
			achievement_get_steam_achievements(achievements_update);
			achievement_get_steam_achievements(achievements_notify);
		}
		with (instance_create(0, 0, obj_loadingscreen))
		{
			dark = true;
			group_arr = grouparr;
			offload_arr = ["menugroup", "characterselectgroup"];
		}
	}
}
if state != 0
{
	showicon = true;
	icon_alpha = 3;
}
else if showicon
{
	icon_alpha = Approach(icon_alpha, 0, 0.05);
	if icon_alpha <= 0
		showicon = false;
}
if showicon
{
	icon_index += 0.35;
	if (icon_index > (icon_max - 1))
	{
		var t = frac(icon_index);
		icon_index = t;
	}
}
