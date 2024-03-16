switch state
{
	case states.punch:
		if attackbuffer > 0
			attackbuffer--;
		else
			state = states.normal;
		break;
}
if (!place_meeting(x, y, obj_trapghost))
{
	sprite_index = spr_kingghost_spike;
	state = states.normal;
}
if cooldown > 0 && state != states.punch
	cooldown--;
