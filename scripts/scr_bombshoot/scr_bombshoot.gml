function scr_bombshoot(_state)
{
	if (pistolcooldown <= 0 && state != states.bombkick && state != states.punch && instance_number(obj_playerbomb) < 2)
	{
		movespeed = -movespeed;
		input_buffer_shoot = 0;
		image_index = 0;
		sprite_index = spr_playerN_noisebombkick;
		fmod_event_one_shot_3d("event:/sfx/playerN/bombthrow", x, y);
		savedgrounded = grounded;
		state = states.bombkick;
		pistolcooldown = 50;
		machslideAnim = false;
		landAnim = false;
		jumpAnim = false;
		crouchslideAnim = false;
		crouchAnim = false;
		stompAnim = false;
		windingAnim = 0;
		bombthrow = false;
		jumpstop = true;
		if (_state == states.mach2 || _state == states.mach3)
			state = 0;
	}
}
function scr_bomb_do_boss_phase2(boss_inst)
{
	with boss_inst
	{
		fmod_event_one_shot("event:/sfx/misc/blackoutpunch");
		instance_create_unique(0, 0, obj_blackoutline);
		instance_create_unique(0, 0, obj_superattackeffect);
		state = states.phase1hurt;
		hsp = 0;
		vsp = 0;
		buildup = 100;
	}
}
