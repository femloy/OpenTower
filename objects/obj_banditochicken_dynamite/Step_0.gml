hsp = image_xscale * movespeed;
grav = 0.25;
mask_index = spr_player_mask;
if (place_meeting(x + hsp, y, obj_solid) || place_meeting(x + hsp, y + vsp, obj_destructibles))
	image_xscale *= -1;
if (grounded && vsp > 0)
	instance_destroy();
if (sprite_index == spr_dynamite && countdown < 60)
	sprite_index = spr_dynamiteabouttoexplode;
if (countdown > 0)
	countdown--;
scr_collide();
