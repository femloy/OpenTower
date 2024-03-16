boss_maxhp = boss_hp;
boss_prevhp = boss_maxhp;
player_maxhp = player_hp;
persistent = false;
if boss_func != -4
	boss_func();
boss_prevhp = boss_hp;
if (bossspr == spr_vsnoise && (!obj_player1.ispeppino || global.swapmode))
{
	bossspr = spr_vsdoise;
	vstitle = spr_vstitle_doise;
}
playerx = -sprite_get_width(playerspr);
bossx = SCREEN_WIDTH + sprite_get_width(bossspr);
instance_destroy(obj_pigtotal);
if !global.bossintro
	global.bossintro = true;
else if room != rank_room
{
	state = states.normal;
	with obj_player1
	{
		state = states.normal;
		hsp = 0;
		movespeed = 0;
		flash = false;
		x = roomstartx;
	}
	with obj_player2
		visible = false;
	alarm[4] = 2;
	with obj_pepperman
		skipintro = true;
	with obj_vigilanteboss
		skipintro = true;
	with obj_noiseboss
		skipintro = true;
	with obj_fakepepboss
		skipintro = true;
	with obj_pizzafaceboss
		skipintro = true;
}
