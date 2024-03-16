function cutscene_superpinball_start()
{
	var _finish = false;
	with obj_player1
	{
		if state != states.door && state != states.comingoutdoor
			_finish = true;
	}
	if _finish
	{
		with obj_player
		{
			if (check_player_coop())
			{
				state = states.actor;
				sprite_index = spr_idle;
			}
		}
		cutscene_end_action();
	}
}
function cutscene_superpinball_middle()
{
	var t = -4;
	with obj_superpinballmachine
	{
		x -= other.movespeed;
		t = id;
	}
	movespeed += 0.25;
	with obj_player
	{
		if (check_player_coop())
		{
			x = t.x + (t.sprite_width / 2);
			y = t.bbox_top - 46;
		}
	}
	if t.x < 96
		cutscene_end_action();
}
function cutscene_superpinball_middle2()
{
	with obj_player
	{
		if (vsp >= 0 && check_player_coop())
		{
			vsp = -12;
			hsp = -10;
		}
	}
	if obj_player1.x < 0
		cutscene_end_action();
}
function cutscene_superpinball_middle3()
{
	with obj_player
	{
		if (check_player_coop())
		{
			vsp = -12;
			hsp = -10;
		}
	}
	cutscene_end_action();
}
function cutscene_superpinball_middle4()
{
	if obj_player1.y > 540
		cutscene_end_action();
}
function cutscene_superpinball_middle5()
{
	with obj_player
	{
		if (check_player_coop())
		{
			vsp = 20;
			hsp = 0;
		}
	}
	cutscene_end_action();
}
function cutscene_superpinball_end()
{
	with obj_player
	{
		if (check_player_coop())
			state = states.normal;
	}
	global.pubcutscene = true;
	quick_ini_write_real(get_savefile_ini(), "cutscene", "pub", true);
	cutscene_end_action();
}
function check_player_coop()
{
	return object_index != obj_player2 || global.coop;
}
