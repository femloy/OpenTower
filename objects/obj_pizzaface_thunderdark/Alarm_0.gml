alarm[0] = 500 + irandom(200);
if (!instance_exists(obj_pizzahead_finalecutsceneN))
	instance_create(irandom_range(100, room_width - 100), 0, obj_pizzaface_thunder);
