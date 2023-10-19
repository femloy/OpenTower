spr_dead = spr_ratblock_dead;
depth = 2;
anim = false;
baddie = false;
animy = 0;
sniffsnd = fmod_event_create_instance("event:/sfx/rat/ratsniff");
fmod_event_instance_set_3d_attributes(sniffsnd, x, y);
use_sound = true;
deadsnd = "event:/sfx/rat/ratdead";
if (place_meeting(x + 1, y, object_index) && place_meeting(x - 1, y, object_index))
	use_sound = false;
if (use_sound && place_meeting(x + 1, y, object_index) && !place_meeting(x - 1, y, object_index))
	use_sound = false;
