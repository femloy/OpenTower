x -= 3;
fmod_event_instance_set_3d_attributes(snd, x, y);
if x < -140
{
	instance_destroy();
	instance_destroy(obj_noiseboss);
	layer_set_visible(layer_get_id("Assets_2"), false);
}
