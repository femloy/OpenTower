if state != states.titlescreen && other.grounded && other.key_up2
{
	if other.isgustavo
		isgustavo = true;
	else
		isgustavo = false;
	state = states.titlescreen;
	playerid = other.id;
	other.state = states.actor;
	other.key_up2 = false;
	other.movespeed = 0;
	other.hsp = 0;
	other.sprite_index = other.spr_idle;
	other.image_speed = 0.35;
}
