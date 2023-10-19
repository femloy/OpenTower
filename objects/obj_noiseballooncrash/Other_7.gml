instance_destroy();
fmod_event_one_shot("event:/sfx/noise/giantballoon2");
fmod_event_instance_stop(snd, false);
fmod_event_instance_release(snd);
with (obj_camera)
{
	shake_mag = 3;
	shake_mag_acc = 5 / room_speed;
}
var layid = layer_get_id("Backgrounds_3");
layer_set_visible(layid, true);
with (obj_micnoise)
{
	with (instance_create(x, y, obj_sausageman_dead))
		sprite_index = spr_noisey_dead;
	instance_create(x, y, obj_bangeffect);
	instance_destroy();
}
