function scr_player_stunned()
{
	hsp = 0;
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
	movespeed = 0;
	turning = false;
	hurted = true;
	turning = false;
	alarm[5] = 2;
	alarm[7] = 60;
	image_speed = 0.35;
	if (floor(image_index) == (image_number - 1))
	{
		mask_index = spr_player_mask;
		state = states.normal;
		sprite_index = spr_idle;
		image_index = 0;
	}
}
