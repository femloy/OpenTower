depth = -100;
image_speed = 0.35;
sprite = -4;
static_index = 0;
static_max = 15;
static_dir = 1;
use_static = true;
alarm[0] = 80;
noise = false;
fmod_event_one_shot("event:/sfx/ui/tvswitch");
with obj_player
	state = states.actor;
