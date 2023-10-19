hsp = image_xscale * movespeed;
if (!kick)
{
	mask_index = spr_player_mask;
	if (place_meeting(x + image_xscale, y, obj_solid))
		image_xscale *= -1;
	if (grounded)
		instance_destroy();
	if (countdown > 0)
	{
		countdown--;
		if (!place_meeting(x, y, obj_player))
			countdown = 0;
	}
}
else
{
	mask_index = spr_player_mask;
	if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles))
		instance_destroy();
	with (instance_place(x + hsp, y, obj_destructibles))
		instance_destroy();
}
if (drop && grounded)
	instance_destroy();
scr_collide();
