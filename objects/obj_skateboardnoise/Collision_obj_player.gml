if (playerid == noone && other.state != states.actor && !instance_exists(obj_bossplayerdeath))
{
	playerid = other.id;
	other.state = states.skateboardnoise;
	other.sprite_index = other.spr_bump;
	other.hsp = 0;
	other.vsp = 0;
}
