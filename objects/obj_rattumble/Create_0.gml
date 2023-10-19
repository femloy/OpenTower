spr_dead = spr_rattumbleblock_dead;
depth = 2;
anim = false;
animy = 0;
sniffsnd = fmod_event_create_instance("event:/sfx/rat/ratsniff");
fmod_event_instance_set_3d_attributes(sniffsnd, x, y);
deadsnd = "event:/sfx/rat/ratbowling";
use_sound = true;
if (place_meeting(x + 1, y, object_index) && place_meeting(x - 1, y, object_index))
	use_sound = false;
if (use_sound && place_meeting(x + 1, y, object_index) && !place_meeting(x - 1, y, object_index))
	use_sound = false;
