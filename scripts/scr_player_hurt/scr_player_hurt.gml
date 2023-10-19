function scr_player_hurt()
{
	if (sprite_index == spr_hurtjump)
		hsp = xscale * movespeed;
	if (sprite_index == spr_hurt)
		hsp = -xscale * movespeed;
	freefallsmash = 0;
	combo = 0;
	mach2 = 0;
	bounce = false;
	jumpAnim = true;
	dashAnim = true;
	if (grounded)
		landAnim = false;
	else
		landAnim = true;
	jumpstop = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	hit_connected = false;
	hurted = true;
	turning = false;
	skateboarding = false;
	alarm[5] = 2;
	alarm[7] = 80;
	if (grounded && vsp > 0)
	{
		movespeed = 0;
		state = states.normal;
	}
	if (scr_solid(x + hsp, y))
		movespeed = 0;
	image_speed = 0.35;
}
