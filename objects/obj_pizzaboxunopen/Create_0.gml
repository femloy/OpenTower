image_speed = 0.35;
content = obj_pizzakinshroom;
if obj_player.character == "S"
	instance_destroy();
depth = 0;
subimg = 0;
image_speed = 0.35;
start = false;
image_xscale = 1;
snd = fmod_event_create_instance("event:/sfx/misc/toppinhelp");
scr_fmod_soundeffect(snd, x, y);
