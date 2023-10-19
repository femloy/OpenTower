layer_set_visible("Backgrounds_tower1", true);
layer_set_visible("Backgrounds_tower2", true);
layer_set_visible("Backgrounds_tower3", true);
layer_set_visible("Backgrounds_tower4", true);
layer_set_visible("Backgrounds_tower5", true);
layer_set_visible("Backgrounds_towermeteor", true);
layer_vspeed("Backgrounds_towermeteor", 0.3);
if (!piledrivershot)
{
	fmod_event_instance_set_parameter(snd, "state", 1, true);
	alarm[2] = 200;
}
else
{
	fmod_event_instance_set_parameter(snd, "state", 3, true);
	alarm[3] = 120;
}
