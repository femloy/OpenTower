function scr_player_slipnslide()
{
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	hsp = xscale * movespeed;
	alarm[5] = -1;
	alarm[8] = 60;
	alarm[7] = 120;
	hurted = true;
	machhitAnim = false;
	crouchslideAnim = true;
	if (movespeed <= 0)
	{
		state = states.normal;
		movespeed = 0;
		mach2 = 0;
		image_index = 0;
	}
	if (scr_solid(x + xscale, y) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		state = states.jump;
		vsp = -14;
		jumpstop = true;
	}
	if (scr_slope() && movespeed <= 0)
		movespeed = 2;
	image_speed = 0.35;
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 1.5 && sprite_index == spr_slipnslide)
	{
		with (instance_create(x, y, obj_slidecloud))
			image_xscale = other.xscale;
	}
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 1.5 && place_meeting(x, y + 1, obj_current))
	{
		with (instance_create(x, y, obj_slidecloud))
		{
			image_xscale = other.xscale;
			sprite_index = spr_watereffect;
			fmod_event_one_shot_3d("event:/sfx/misc/waterslidesplash", x, y);
		}
	}
	if (sprite_index == spr_currentplayer && !place_meeting(x, y + 1, obj_current))
	{
		fmod_event_one_shot_3d("event:/sfx/misc/waterslidesplash", x, y);
		fmod_event_one_shot_3d("event:/sfx/pep/slip", x, y);
		vsp = -5;
		sprite_index = spr_slipbanan1;
		image_index = 0;
		state = states.slipbanan;
	}
	if (sprite_index == spr_slipnslide && place_meeting(x, y + 1, obj_current))
		sprite_index = spr_currentplayer;
}
