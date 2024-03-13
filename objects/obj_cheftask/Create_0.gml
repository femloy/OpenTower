x = SCREEN_WIDTH - 120;
y = SCREEN_HEIGHT + 200;
achievement_spr = spr_achievement_farm;
achievement_index = 0;
finish = false;
movespeed = 5;
paletteselect = 1;
spr_palette = spr_peppalette;
texture = -4;
depth = -600;
previousID = -4;
if (instance_number(obj_cheftask) > 1)
{
	var b = instance_find(obj_cheftask, instance_number(obj_cheftask) - 2);
	if (instance_exists(b))
		previousID = b;
}
