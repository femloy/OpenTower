if !global.option_vibration
	exit;
with obj_player
{
	var _pindex = (object_index == obj_player1) ? 0 : 1;
	var _dvc = other.player_input_device[_pindex];
	if state != other.prevstate[_pindex]
	{
		switch state
		{
			case states.tackle:
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.6);
				break;
			case states.tumble:
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.8);
				break;
			case states.machcancel:
				GamepadSetVibration(_pindex, 0.5, 0.5, 0.5);
				break;
			case states.fireass:
				GamepadSetVibration(_pindex, 1, 1, 0.85);
				break;
			case states.shotgunshoot:
				GamepadSetVibration(_pindex, 0.9, 0.9, 0.85);
				break;
			case states.firemouth:
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.85);
				break;
			case states.hurt:
				GamepadSetVibration(_pindex, 1, 1, 0.85);
				break;
			case states.bombpep:
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.6);
				if sprite_index == spr_bombpepend
					GamepadSetVibration(_pindex, 1, 1, 0.9);
				break;
			case states.Sjump:
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.85);
				break;
			case states.Sjumpprep:
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.6);
				break;
			case states.Sjumpland:
				GamepadSetVibration(_pindex, 1, 1, 0.9);
				break;
			case states.knightpep:
				if sprite_index == spr_knightpepthunder
					GamepadSetVibration(_pindex, 1, 1, 0.9);
				break;
			case states.parry:
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.65);
				break;
			case states.freefallland:
				GamepadSetVibration(_pindex, 1, 1, 0.85);
				break;
			case states.chainsaw:
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.6);
				break;
			case states.bump:
				if sprite_index != spr_hitwall
					GamepadSetVibration(_pindex, 0.8, 0.8, 0.6);
				else
					GamepadSetVibration(_pindex, 1, 1, 0.85);
				break;
			case states.grab:
				GamepadSetVibration(_pindex, 0.2, 0.2, 0.8);
				break;
			case states.ratmountpunch:
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.65);
				break;
			case states.barrel:
				GamepadSetVibration(_pindex, 0.4, 0.4, 0.65);
				break;
			case states.barrelslide:
				GamepadSetVibration(_pindex, 0.4, 0.4, 0.65);
				break;
			case states.barrelclimbwall:
				GamepadSetVibration(_pindex, 0.4, 0.4, 0.65);
				break;
			case states.antigrav:
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.65);
				break;
			case states.ratmountclimbwall:
				GamepadSetVibration(_pindex, 0.2, 0.2, 0.8);
				break;
			case states.cheesepepstick:
				GamepadSetVibration(_pindex, 0.4, 0.4, 0.8);
				break;
			case states.cheesepepstickside:
				GamepadSetVibration(_pindex, 0.4, 0.4, 0.8);
				break;
			case states.cheesepepstickup:
				GamepadSetVibration(_pindex, 0.4, 0.4, 0.8);
				break;
			case states.stringfall:
				GamepadSetVibration(_pindex, 0.7, 0.7, 0.8);
				break;
			case states.stringjump:
				GamepadSetVibration(_pindex, 0.7, 0.7, 0.8);
				break;
			case states.stringfling:
				GamepadSetVibration(_pindex, 0.7, 0.7, 0.8);
				break;
			case states.jetpackjump:
				GamepadSetVibration(_pindex, 0.9, 0.9, 0.8);
				break;
			default:
				other.setVibration(_pindex, 0, 0);
				break;
		}
		if other.prevstate[_pindex] == states.stringfall
			GamepadSetVibration(_pindex, 0.7, 0.7, 0.8);
		other.prevstate[_pindex] = state;
	}
}
_dvc = player_input_device[player_index];
vibration[0][0] *= vibration[0][2];
vibration[0][1] *= vibration[0][2];
if vibration[0][0] < 0
	vibration[0][0] = 0;
if vibration[0][1] < 0
	vibration[0][1] = 0;
gamepad_set_vibration(_dvc, vibration[0][0], vibration[0][1]);
if player_input_device[!player_index] != _dvc
	gamepad_set_vibration(player_input_device[!player_index], 0, 0);
