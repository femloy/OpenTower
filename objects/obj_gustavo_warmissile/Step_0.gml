if (instance_exists(baddieID))
	direction = angle_rotate(direction, point_direction(x, y, baddieID.x, baddieID.y), rotate_speed);
else
	baddieID = instance_nearest(x, y, baddieID);
image_angle = direction;
if sprite_index == spr_bucket_war
	angle += 25;
