image_speed = 0.05;
var layid = layer_get_id("Backgrounds_scroll");
layer_set_visible(layid, false);
instance_destroy(obj_introprop);
layid = layer_get_id("Backgrounds_3");
depth = layer_get_depth(layid);
snd = fmod_event_create_instance("event:/sfx/noise/giantballoon1");
fmod_event_instance_play(snd);
