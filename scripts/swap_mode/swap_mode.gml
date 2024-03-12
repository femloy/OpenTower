function swap_is_player2()
{
	return global.swapmode && obj_player1.ispeppino != obj_savesystem.ispeppino;
}
function swap_player(argument0 = false, argument1 = false)
{
	if (global.swapmode)
	{
		if (!argument1 && (instance_exists(obj_noiseanimatroniceffect) || obj_swapmodefollow.animatronic > 0))
			return false;
		with (obj_bosscontroller)
		{
			if ((player_hp - 1) <= 0)
				return false;
		}
		if (argument0 && instance_exists(obj_bosscontroller) && global.swap_boss_damage + 1 < 3)
			return false;
		if (argument0)
			global.swap_boss_damage = -1;
		state = 0;
		if (ispeppino)
		{
			if (isgustavo)
			{
				scr_switchpeppino();
				noisecrusher = true;
			}
			if (global.noisejetpack)
				noisepizzapepper = true;
			else if (global.leveltosave == "freezer")
				global.noisejetpack = true;
		}
		ispeppino = !ispeppino;
		if (ispeppino)
		{
			if (noisecrusher)
			{
				noisecrusher = false;
				scr_switchgustavo(true, false);
			}
			if (global.noisejetpack && !noisepizzapepper)
				global.noisejetpack = false;
		}
		if (!ispeppino)
			tauntstoredisgustavo = false;
		scr_characterspr();
		pistolcharge = 0;
		pistolchargeshooting = false;
		pistolanim = -4;
		global.pistol = false;
		if ((ispeppino && (room == boss_vigilante || instance_exists(obj_pizzafaceboss_p2))) || (instance_exists(obj_bosscontroller) && !ispeppino))
			global.pistol = true;
		with (obj_bosscontroller)
		{
			if (other.ispeppino)
				player_hpsprite = spr_bossfight_playerhp;
			else
				player_hpsprite = spr_bossfight_noiseHP;
		}
		with (obj_gustavoswitch)
		{
			x = xstart;
			y = ystart;
			create_particle(x, y, 9);
			var _esc = escape;
			event_perform(0, 0);
			escape = _esc;
		}
		with (obj_peppinoswitch)
		{
			x = xstart;
			y = ystart;
			create_particle(x, y, 9);
			_esc = escape;
			event_perform(0, 0);
			escape = _esc;
			event_perform(7, 4);
		}
		with (obj_playerbomb)
		{
			dead = true;
			instance_destroy(id);
		}
		with (obj_swapmodefollow)
		{
			taunttimer = 0;
			if (ispeppino == obj_player1.ispeppino)
			{
				ispeppino = !obj_player1.ispeppino;
				if (!obj_player1.ispeppino && obj_player1.noisecrusher)
					isgustavo = true;
				get_character_spr(true);
			}
		}
		with (obj_tv)
		{
			if (state == 0 && !argument0)
			{
				if (idleanim < 60)
					idleanim = 60;
				sprite_index = other.ispeppino ? spr_tv_idle : spr_tv_idleN;
				if (sprite_index == spr_tv_idle && other.isgustavo)
					sprite_index = spr_tv_idleG;
			}
		}
		return true;
	}
	return false;
}
