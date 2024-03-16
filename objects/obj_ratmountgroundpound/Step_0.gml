instance_destroy(instance_place(x, y + 16, obj_destructibles));
instance_destroy(instance_place(x, y + vsp, obj_destructibles));
instance_destroy(instance_place(x, y + 16, obj_metalblock));
instance_destroy(instance_place(x, y + vsp, obj_metalblock));
if !kicked
{
	x = obj_player.x - (obj_player.xscale * 10);
	y = obj_player.y + 60;
}
if hitbox == 0
{
	with (instance_create(x, y, obj_shotgunbullet))
	{
		brick = true;
		visible = false;
		mask_index = spr_ratmountgroundpound;
		image_index = other.image_index;
		brickid = other.id;
		other.hitbox = true;
	}
}
scr_collide();
if (grounded && kicked && !place_meeting(x, y + 1, obj_destructibles) && !place_meeting(x, y + 1, obj_metalblock))
	instance_destroy();
