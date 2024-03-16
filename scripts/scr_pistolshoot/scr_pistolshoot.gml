function scr_pistolshoot(required_state, allow_charge = false)
{
	if !ispeppino
	{
		scr_bombshoot();
		exit;
	}
	if !allow_charge && pistolchargeshooting
		exit;
	
	if ((pistolcooldown <= 0 && state == required_state && state != states.bump && instance_number(obj_pistolbullet) < 3) || pistolchargeshooting == 1)
	{
		input_buffer_shoot = 0;
		pistolanim = spr_pistolshot;
		pistolindex = 0;
		pistolcooldown = 10;
		machslideAnim = false;
		landAnim = false;
		jumpAnim = false;
		crouchslideAnim = false;
		crouchAnim = false;
		stompAnim = false;
		if (required_state == states.mach3 || required_state == states.mach2)
			state = states.normal;
		windingAnim = 0;
		with (instance_create(x + (xscale * 35), y, obj_parryeffect))
		{
			if allow_charge && other.pistolchargeshooting
				sprite_index = spr_giantpistoleffect;
			else
				sprite_index = spr_player_pistoleffect;
			image_xscale = other.xscale;
			image_speed = 0.4;
		}
		if allow_charge && pistolchargeshooting
			fmod_event_one_shot_3d("event:/sfx/pep/revolverBIGshot", x + (xscale * 20), y);
		else
			fmod_event_one_shot_3d("event:/sfx/pep/pistolshot", x + (xscale * 20), y);
		with (instance_create(x + (xscale * 20), y, obj_pistolbullet))
		{
			image_xscale = other.xscale;
			if allow_charge && other.pistolchargeshooting
			{
				GamepadSetVibration(0, 1, 1, 0.8);
				sprite_index = spr_peppinobulletGIANT;
				x += 25;
			}
			else
				GamepadSetVibration(0, 0.3, 0.3, 0.6);
		}
	}
}
