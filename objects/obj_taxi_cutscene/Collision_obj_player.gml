if (targetplayer.id != other.id)
	exit;
obj_player1.visible = false;
obj_player1.sprite_index = obj_player1.spr_idle;
obj_player1.hsp = 0;
obj_player1.vsp = 0;
obj_player1.state = states.taxi;
playerid = obj_player1;
sprite_index = spr_taximove;
hsp = 10;
obj_player1.cutscene = true;
if (global.coop == 1)
{
	obj_player2.sprite_index = obj_player2.spr_idle;
	playerid = obj_player2;
	sprite_index = spr_taximove;
	hsp = 10;
	obj_player2.visible = false;
	obj_player2.hsp = 0;
	obj_player2.vsp = 0;
	obj_player2.state = states.taxi;
	obj_player2.cutscene = true;
}
if (pickedup == 0)
	instance_create(x, y, obj_genericpoofeffect);
pickedup = true;
