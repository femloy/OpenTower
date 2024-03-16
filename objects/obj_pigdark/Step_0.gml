if sprite_index == bg_pigdark
{
	x = obj_player1.x + random_range(-2, 2);
	y = obj_player1.y + random_range(-2, 2);
}
image_xscale = Approach(image_xscale, 1, 0.0001);
image_yscale = Approach(image_yscale, 1, 0.0001);
if image_xscale >= 1 && sprite_index != bg_pigdarkthumb
{
	fmod_event_one_shot_3d("event:/sfx/voice/pig", room_width / 2, room_height / 2);
	fmod_event_one_shot("event:/sfx/ending/star");
	sprite_index = bg_pigdarkthumb;
	alarm[0] = 120;
}
if fade == 1
	image_alpha = Approach(image_alpha, 0, 0.5);
