function scr_player_revolver()
{
	hsp = xscale * movespeed;
	landAnim = false;
	if grounded
	{
		if movespeed > 0
			movespeed -= 0.1;
	}
	if (floor(image_index) == image_number - 1 && sprite_index == spr_playerV_revolverstart)
		sprite_index = spr_playerV_revolverhold;
	if ((sprite_index == spr_playerV_revolverhold || sprite_index == spr_playerV_airrevolverstart || sprite_index == spr_playerV_revolverstart) && !key_slap)
	{
		if grounded
			sprite_index = spr_playerV_revolvershoot;
		else
			sprite_index = spr_playerV_airrevolver;
		image_index = 0;
		with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
		{
			is_solid = false;
			image_xscale = other.xscale;
		}
	}
	if (floor(image_index) == image_number - 1 && sprite_index == spr_playerV_revolvershoot)
	{
		image_index = 0;
		state = states.normal;
		sprite_index = spr_playerV_revolverend;
		movespeed = 2;
	}
	if ((sprite_index == spr_playerV_airrevolverend || sprite_index == spr_playerV_airrevolver || sprite_index == spr_playerV_airrevolverstart) && grounded)
	{
		if key_attack && movespeed >= 6
			state = states.mach2;
		else
			state = states.normal;
	}
	if (floor(image_index) == image_number - 1 && sprite_index == spr_playerV_airrevolver)
	{
		if key_attack && movespeed >= 6
			state = states.mach2;
		else
		{
			image_index = 0;
			state = states.normal;
		}
	}
	image_speed = 0.4;
}
