function scr_player_stringfling()
{
	sprite_index = spr_mrpinch;
	hsp = move * movespeed;
	movespeed = 2;
	vsp = 2;
	move = key_left + key_right;
	if move != 0
		xscale = move;
	image_speed = 0.35;
}
