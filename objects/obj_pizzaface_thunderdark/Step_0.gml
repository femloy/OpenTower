dark = Approach(dark, darkstart, 0.05);
if (instance_exists(obj_pizzahead_blackfade) && !instance_exists(obj_pizzaface_thunder) && obj_pizzahead_blackfade.fade > 0)
	dark = 0;
if (instance_exists(obj_pizzaface_thunder))
	dark = Approach(dark, 0, 0.2);
