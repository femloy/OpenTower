function scr_player_pistolaim()
{
	mach2 = 0;
	move = key_left + key_right;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	hsp = 0;
	movespeed = 0;
	if (!key_up)
	{
		state = states.normal;
		image_index = 0;
	}
	if (move != 0)
		sprite_index = spr_player_aimdiagonal;
	else
		sprite_index = spr_player_aimup;
	if (key_shoot2 && !key_up)
	{
		sprite_index = spr_player_pistol;
		image_index = 0;
		state = states.pistol;
		shoot = true;
	}
	if (key_shoot2 && sprite_index == spr_player_aimup)
	{
		sprite_index = spr_player_shootup;
		image_index = 0;
		state = states.pistol;
		shoot = true;
	}
	if (key_shoot2 && sprite_index == spr_player_aimdiagonal)
	{
		sprite_index = spr_player_shootdiagonal;
		image_index = 0;
		state = states.pistol;
		shoot = true;
	}
	if (!grounded)
	{
		sprite_index = spr_player_fall;
		state = states.jump;
	}
	if (move != 0)
		xscale = move;
	if (floor(image_index) != (image_number - 1))
		image_speed = 0.45;
	else
		image_speed = 0;
}
