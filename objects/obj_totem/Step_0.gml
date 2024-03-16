totem_clear(id);
var empty = totem_empty(id);
var machslidemax = 70;
if empty
{
	with obj_indiancheese
	{
		if (empty && state == states.walk && x > (other.x - 72) && x < (other.x + 72) && y > (other.y - 74) && y < (other.y + 50) && grounded)
		{
			state = states.totem;
			totemID = other.id;
			totem_add(other.id, id);
			empty = totem_empty(other.id);
			totemdir = (x > other.x) ? -1 : 1;
			image_xscale = totemdir;
			sprite_index = spr_indiancheese_howl;
			image_index = 0;
		}
	}
	if empty
	{
		with obj_player
		{
			if (distance_to_object(other) <= 280 && state == states.machslide && (sprite_index == spr_machslideboost || sprite_index == spr_mach3boost))
			{
				other.machslidecount++;
				other.machslidebuffer = 30;
				if other.machslidecount >= machslidemax
					notification_push(notifs.totem_revive, [room]);
			}
		}
	}
}
if machslidebuffer > 0
	machslidebuffer--;
else
	machslidecount = 0;
active = totem_count(id) > 0 || machslidecount >= machslidemax;
if active
{
	if (!fmod_event_instance_is_playing(snd))
		fmod_event_instance_play(snd);
	sprite_index = spr_totemcheese;
}
else
{
	if (fmod_event_instance_is_playing(snd))
		fmod_event_instance_stop(snd, true);
	sprite_index = spr_totemcheese_inactive;
}
