function scr_player_crouch()
{
	move = key_left + key_right;
	if (!place_meeting(x, y + 1, obj_railparent))
		hsp = move * movespeed;
	else
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		hsp = (move * movespeed) + (_railinst.movespeed * _railinst.dir);
	}
	movespeed = 4;
	mask_index = spr_crouchmask;
	turning = false;
	if !grounded && !key_jump
	{
		jumpAnim = false;
		state = states.crouchjump;
		movespeed = 4;
		crouchAnim = true;
		image_index = 0;
	}
	if (grounded && !key_down && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && !key_jump)
	{
		state = states.normal;
		movespeed = 0;
		crouchAnim = true;
		jumpAnim = true;
		image_index = 0;
		mask_index = spr_player_mask;
	}
	if crouchAnim == 0
	{
		if move == 0
		{
			if shotgunAnim == 0
				sprite_index = spr_crouch;
			else
				sprite_index = spr_shotgunduck;
		}
		if move != 0
		{
			if shotgunAnim == 0
				sprite_index = spr_crawl;
			else
				sprite_index = spr_shotguncrawl;
		}
	}
	if crouchAnim == 1
	{
		if move == 0
		{
			if shotgunAnim == 0
				sprite_index = spr_couchstart;
			else
				sprite_index = spr_shotgungoduck;
			if floor(image_index) == image_number - 1
				crouchAnim = false;
		}
	}
	if move != 0
	{
		xscale = move;
		crouchAnim = false;
	}
	if (key_jump && grounded && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
	{
		scr_fmod_soundeffect(jumpsnd, x, y);
		vsp = -8;
		state = states.crouchjump;
		movespeed = 4;
		image_index = 0;
		crouchAnim = true;
		jumpAnim = true;
	}
	if (key_shoot2 && character == "V" && !instance_exists(dynamite_inst))
	{
		if move == 0
			movespeed = 0;
		state = states.dynamite;
		image_index = 0;
		sprite_index = spr_playerV_dynamitethrow;
		with (instance_create(x, y, obj_dynamite))
		{
			image_xscale = other.xscale;
			movespeed = 0;
			vsp = -6;
			other.dynamite_inst = id;
			playerid = other.id;
		}
	}
	if key_slap2 && character == "V"
	{
		if move == 0
			movespeed = 0;
		state = states.revolver;
		image_index = 0;
		sprite_index = spr_playerV_revolverstart;
	}
	image_speed = 0.45;
}
