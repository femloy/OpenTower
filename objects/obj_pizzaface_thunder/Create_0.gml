buffer = 40;
depth = 280;
image_speed = 0.35;
with obj_camera
{
	shake_mag = 8;
	shake_mag_acc = 5 / room_speed;
}
fmod_event_one_shot("event:/sfx/pizzahead/thunder");
