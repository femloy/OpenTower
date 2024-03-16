if deadbuffer <= 0
{
	dead = true;
	instance_destroy();
	exit;
}
switch state
{
	case states.fall:
		hsp = image_xscale * movespeed;
		if grounded && vsp > 0
		{
			fmod_event_one_shot_3d("event:/sfx/noise/bombbounce", x, y);
			sprite_index = spr_playerN_noisebombland;
			image_index = 0;
			state = states.land;
		}
		break;
	case states.normal:
		hsp = image_xscale * 6;
		if (floor(image_index) == image_number - 1)
		{
			if sprite_index == spr_playerN_noisebombland
				sprite_index = spr_playerN_noisebomb;
			if sprite_index == spr_playerN_noisebombhitwall
				sprite_index = spr_playerN_noisebomb;
		}
		if grounded && vsp > 0
		{
			fmod_event_one_shot_3d("event:/sfx/noise/bombbounce", x, y);
			sprite_index = spr_playerN_noisebombland;
			image_index = 0;
			state = states.land;
		}
		else if (place_meeting(x + sign(hsp), y, obj_solid))
		{
			sprite_index = spr_playerN_noisebombhitwall;
			image_index = 0;
			image_xscale *= -1;
		}
		break;
	case states.land:
		hsp = 0;
		vsp = 0;
		if (floor(image_index) >= 5)
		{
			state = states.normal;
			vsp = -5;
		}
		break;
}
if sprite_index == spr_playerN_noisebomb && countdown <= countdownmax / 2
	sprite_index = spr_playerN_noisebombflash;
if state != states.fall
{
	if countdown > 0
		countdown--;
	else
		instance_destroy();
}
scr_collide();
