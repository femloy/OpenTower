image_xscale = 1;
image_speed = 0.5;
vsp = 10;
state = states.jump;
superslam = false;
pizzahead_x = 0;
pizzahead_front = false;
piledrivershot = false;
snd = fmod_event_create_instance("event:/sfx/pizzahead/finale");
if (room == boss_pizzafacefinale)
{
	image_speed = 2;
	vsp = -10;
	alarm[0] = 250;
	beatdown1_lay = layer_get_id("Backgrounds_sky4");
	beatdown2_lay = layer_get_id("Backgrounds_sky5");
	beatdown3_lay = layer_get_id("Backgrounds_sky3");
	layer_vspeed(beatdown3_lay, 1.9);
	layer_vspeed(beatdown2_lay, 1.7);
	layer_vspeed(beatdown1_lay, 1.8);
}
