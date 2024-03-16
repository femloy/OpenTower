if sprite_index == spr_ladder
	mask_index = spr_wall;
xscale = lerp(xscale, 1, 0.5);
yscale = lerp(yscale, 1, 0.5);
hovered = obj_editorcursor.hovered_object == id;
if hovered
	image_alpha = Wave(0.6, 0.8, 2, 0);
else
	image_alpha = Approach(image_alpha, 1, 0.1);
