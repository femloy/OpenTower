hsp = image_xscale * movespeed;
if speedline == 0
{
	with (instance_create(x, y, obj_brickballspeedline))
	{
		playerid = other.id;
		other.speedline = true;
	}
}
if !kicked
{
	x = obj_player1.x + (xoffset * obj_player1.xscale);
	y = obj_player1.y;
	if (scr_solid(x, y))
		x = obj_player1.x;
}
if blur_effect > 0
	blur_effect--;
else
{
	blur_effect = 2;
	create_blur_afterimage(x, y, sprite_index, image_index - 1, image_xscale);
}
if hitbox == 0
{
	with (instance_create(x, y, obj_shotgunbullet))
	{
		brick = true;
		visible = false;
		mask_index = spr_lonebrick_roll;
		image_index = other.image_index;
		brickid = other.id;
		other.hitbox = true;
	}
}
if (scr_solid(x, y + 1) && bounce == 0)
{
	vsp = -5;
	bounce = true;
}
if (scr_solid(x + image_xscale, y) && kicked && !place_meeting(x + image_xscale, y, obj_destructibles) && !place_meeting(x + image_xscale, y, obj_slope))
	instance_destroy();
if dashcloudtimer == 0 && grounded
{
	with (instance_create(x, y, obj_dashcloud2))
		image_xscale = other.image_xscale;
	dashcloudtimer = 15;
}
if dashcloudtimer > 0
	dashcloudtimer--;
with (instance_place(x + image_xscale, y, obj_destructibles))
{
	if object_index != obj_onewaybigblock
		instance_destroy();
	else if other.kicked
	{
		var x1 = other.x;
		var y1 = other.y;
		var _col = collision_line(x + (35 * image_xscale), y + (16 * image_yscale), x1, y1, obj_solid, false, true);
		if _col == noone
			instance_destroy();
		else
			instance_destroy(other);
	}
}
