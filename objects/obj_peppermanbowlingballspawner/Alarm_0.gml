distance = obj_player.x + random_range(-150, 150);
distance = clamp(distance, dis1, dis2);
instance_create(distance, -15, object);
balls -= 1;
if (balls == 0)
	instance_destroy();
else
	alarm[0] = 10;
