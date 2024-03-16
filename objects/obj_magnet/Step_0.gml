image_speed = 0.35;
switch state
{
	case states.normal:
		if cooldown > 0
		{
			sprite_index = spr_sirnose_cooldown;
			cooldown--;
		}
		else
		{
			sprite_index = spr_sirnose_idle;
			with obj_pizzaball
			{
				if (state != states.golf && distance_to_pos(x, y, other.x, other.y, 200, 150))
				{
					state = states.magnet;
					other.state = states.magnet;
					other.hsp = hsp;
					other.vsp = vsp;
					other.ballID = id;
				}
			}
		}
		break;
	case states.magnet:
		with ballID
		{
			depth = 0;
			sprite_index = spr_pizzaball_roll;
			sit = false;
			x = Approach(x, other.x, 8);
			y = Approach(y, other.y, 8);
			if state != states.golf
			{
				other.hsp = Approach(hsp, 0, 1);
				other.vsp = Approach(vsp, 0, 1);
			}
			else
				sprite_index = spr_pizzaball_stun;
			hsp = other.hsp;
			vsp = other.vsp;
			if state != states.magnet && state != states.golf
			{
				other.state = states.normal;
				other.cooldown = 200;
			}
			if (x != other.x || y != other.y)
			{
				if x != other.x
					other.image_xscale = sign(other.x - x);
				other.sprite_index = spr_sirnose_suck;
			}
			else
			{
				if other.sprite_index == spr_sirnose_suck
					fmod_event_one_shot_3d("event:/sfx/misc/sniffbump", other.x, other.y);
				other.sprite_index = spr_sirnose_idle;
			}
		}
		break;
}
if sprite_index == spr_sirnose_suck
{
	if (!fmod_event_instance_is_playing(snd))
	{
		fmod_event_instance_play(snd);
		fmod_event_instance_set_3d_attributes(snd, x, y);
	}
}
else
	fmod_event_instance_stop(snd, true);
