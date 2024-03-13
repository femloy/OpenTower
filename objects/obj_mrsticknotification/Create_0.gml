x = 32;
start = false;
finish = false;
height = sprite_get_height(sprite_index);
alarm[0] = 150;
image_speed = 0.35;
fmod_event_one_shot("event:/sfx/misc/kashing");
if (!obj_player1.ispeppino || global.swapmode)
	sprite_index = spr_noisettenotification;
y = -height - 50;
