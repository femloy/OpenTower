if !is_solid
	shotgun = true;
if shotgun
{
	with (instance_place(x + spd, y, obj_shotgunblock))
	{
		instance_destroy();
		if other.minigun
			instance_destroy(other);
	}
}
if shotgun
{
	with (instance_place(x, y - spdh, obj_shotgunblock))
	{
		instance_destroy();
		if other.minigun
			instance_destroy(other);
	}
}
if brick == 1
{
	if (!instance_exists(brickid))
	{
		instance_destroy();
		exit;
	}
	x = brickid.x;
	y = brickid.y;
}
else
{
	x += (image_xscale * spd);
	y += -spdh;
}
with (instance_place(x + (image_xscale * spd), y, obj_destructibles))
{
	if object_index != obj_onewaybigblock
		instance_destroy();
}
if (!minigun && place_meeting(x + (image_xscale * spd), y, obj_solid) && !place_meeting(x + (image_xscale * spd), y, obj_electricwall) && !place_meeting(x + (image_xscale * spd), y, obj_shotgunblock) && !place_meeting(x + (image_xscale * spd), y, obj_destructibles))
	instance_destroy();
if sprite_index == spr_mortprojectile
{
	with (instance_place(x, y - spdh, obj_mortblock))
		instance_destroy();
}
