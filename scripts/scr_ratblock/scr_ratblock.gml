function scr_piggyblock_destroy()
{
	if (bbox_in_camera(view_camera[0]))
	{
		with other
		{
			if (instakillmove && (place_meeting(x + 1, y, other) || place_meeting(x - 1, y, other) || place_meeting(x, y + 1, other) || place_meeting(x, y - 1, other)))
				instance_destroy(other);
		}
	}
}
function scr_ratblock_destroy()
{
	if (place_meeting(x, y, obj_canonexplosion))
	{
		with (instance_place(x, y, obj_canonexplosion))
		{
			instance_destroy(other);
			if baddie
				notification_push(notifs.ratblock_explode, [room]);
		}
	}
	if (bbox_in_camera(view_camera[0]))
	{
		with obj_player
		{
			if ((other.sprite_index == spr_rattumbleblock || other.sprite_index == spr_rattumbleblock_big) && sprite_index == spr_tumble && (place_meeting(x + 1, y, other) || place_meeting(x - 1, y, other)))
				instance_destroy(other);
			if (state != states.mort && state != states.bombgrab && (!scr_transformationcheck() || state == states.barrel) && (place_meeting(x + 1, y, other) || place_meeting(x - 1, y, other) || place_meeting(x, y + 1, other) || place_meeting(x, y - 1, other)))
			{
				switch state
				{
					case states.barrel:
						if (!place_meeting(x, y - 12, other))
							instance_destroy(other);
						break;
					case states.boxxedpepspin:
						vsp = -6;
						if !ispeppino
						{
							sprite_index = spr_playerN_boxxedhit;
							image_index = 0;
						}
						instance_destroy(other);
						break;
					case states.bombpep:
						if sprite_index != spr_bombpepend && sprite_index != spr_bombpepintro
						{
							instance_create(x, y, obj_bombexplosion);
							instance_destroy(other);
							GamepadSetVibration(0, 1, 1, 0.9);
							hurted = true;
							vsp = -4;
							image_index = 0;
							sprite_index = spr_bombpepend;
							state = states.bombpep;
							bombpeptimer = 0;
						}
						break;
					case states.gotoplayer:
					case states.tube:
					case states.actor:
					case states.boxxedpep:
					case states.mort:
					case states.morthook:
					case states.mortjump:
					case states.boxxedpepjump:
					case states.knightpep:
					case states.knightpepbump:
						break;
					case states.tumble:
						if (other.sprite_index == spr_rattumbleblock || other.sprite_index == spr_rattumbleblock_big)
							instance_destroy(other);
						break;
					default:
						if other.sprite_index != spr_rattumbleblock && other.sprite_index != spr_rattumbleblock_big
							instance_destroy(other);
				}
			}
		}
	}
}
