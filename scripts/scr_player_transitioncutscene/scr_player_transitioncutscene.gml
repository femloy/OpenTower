function scr_player_transitioncutscene()
{
	costumercutscenetimer--;
	global.heattime = 60;
	if (sprite_index == spr_player_knock && costumercutscenetimer < 0)
	{
		xscale *= -1;
		hsp = 5;
		sprite_index = spr_player_move;
		costumercutscenetimer = 35;
	}
	if (sprite_index == spr_player_move && costumercutscenetimer < 0)
	{
		with (obj_costumerdoor)
		{
			image_index = 1;
			instance_create(x, y, obj_costumer);
		}
		image_index = 0;
		hsp = 0;
		xscale *= -1;
		sprite_index = spr_player_givepizza;
	}
	if (sprite_index == spr_player_levelcomplete && costumercutscenetimer < 0)
	{
		if (grounded && (x > (other.x + 32) && x < (other.x + 160)) && key_up && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3))
		{
			if (global.collect >= global.srank)
				global.rank = "s";
			else if (global.collect > global.arank)
				global.rank = "a";
			else if (global.collect > global.brank)
				global.rank = "b";
			else if (global.collect > global.crank)
				global.rank = "c";
			else
				global.rank = "d";
			ini_open("saveData.ini");
			if (!instance_exists(obj_endlevelfade))
				instance_create(x, y, obj_endlevelfade);
			if (state != states.door)
			{
				audio_stop_all();
				stop_music();
				state = states.door;
				obj_endlevelfade.alarm[0] = 235;
				image_index = 0;
			}
		}
	}
	if (sprite_index == spr_player_givepizza && floor(image_index) == (image_number - 1))
		image_speed = 0;
	if (sprite_index == spr_player_levelcomplete && floor(image_index) == (image_number - 1))
		image_speed = 0;
}
