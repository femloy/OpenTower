x = layer_get_x("Backgrounds_still1");
y = layer_get_y("Backgrounds_still1") + extray;
extray += yspd;
yspd = Approach(yspd, 5, 0.05);
if extray > 3000
	instance_destroy();
