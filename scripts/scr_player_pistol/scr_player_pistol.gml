function scr_player_pistol()
{
	move = key_right + key_left;
	hsp = xscale * movespeed;
	if movespeed < 10
		movespeed += 0.15;
	if (floor(image_index) == image_number - 1 && grounded && key_attack)
		state = states.mach2;
	else if floor(image_index) == image_number - 1
		state = states.normal;
	if key_jump && grounded && !key_down
	{
		jumpstop = false;
		vsp = -11;
		state = states.tumble;
		sprite_index = spr_mach2jump;
	}
	if (scr_solid(x + xscale, y) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + xscale, y, obj_destructibles))
	{
		var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
		if _bump
		{
			jumpstop = true;
			state = states.jump;
			vsp = -4;
			sprite_index = spr_suplexbump;
			instance_create(x + (xscale * 10), y + 10, obj_bumpeffect);
		}
	}
	if key_down && grounded && global.attackstyle != 2
	{
		grav = 0.5;
		sprite_index = spr_crouchslip;
		machhitAnim = false;
		state = states.crouchslide;
		movespeed += 3;
	}
	if state != states.bump && move != xscale && move != 0
	{
		image_index = 0;
		if !grounded
		{
			sprite_index = spr_suplexcancel;
			jumpAnim = true;
			grav = 0.5;
			state = states.jump;
		}
		else
		{
			state = states.normal;
			grav = 0.5;
		}
	}
	image_speed = 0.35;
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 4)
		instance_create(x, y, obj_slidecloud);
}
