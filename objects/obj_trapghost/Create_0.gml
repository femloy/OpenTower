snd_loop = fmod_event_create_instance("event:/sfx/kingghost/loop");
snd_move = fmod_event_create_instance("event:/sfx/kingghost/move");
if (instance_number(object_index) > 1)
{
	instance_destroy(id, false);
	exit;
}
alarm[0] = 1;
depth = -7;
image_alpha = 0;
target_alpha = 0.6;
alpha = false;
state = states.normal;
trapid = -4;
image_speed = 0.35;
