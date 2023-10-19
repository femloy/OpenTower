if (sprite_index == spr_kingghost_pinball3 && floor(image_index) == (image_number - 1))
	sprite_index = spr_kingghost_pinball2;
image_speed = 0.35;
if (!place_meeting(x, y, obj_trapghost))
	sprite_index = spr_kingghost_pinball;
