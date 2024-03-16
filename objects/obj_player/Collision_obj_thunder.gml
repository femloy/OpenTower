scr_losepoints();
sprite_index = spr_knightpepthunder;
GamepadSetVibration((object_index == obj_player1) ? 0 : 1, 1, 1, 0.9);
fmod_event_instance_play(global.snd_thunder);
instance_destroy(other);
image_index = 0;
with obj_camera
{
	shake_mag = 10;
	shake_mag_acc = 30 / room_speed;
}
