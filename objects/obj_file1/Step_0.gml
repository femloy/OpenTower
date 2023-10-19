var lay_id = layer_get_id("Assets_1");
var s = layer_sprite_get_id(lay_id, "graphic_45C096A");
layer_sprite_speed(s, 0.35);
if (santaed == 0)
{
	if (obj_mainmenuselect.optionselected == 0)
	{
		visible = true;
		layer_sprite_change(s, spr_phonepicked);
	}
	else
	{
		visible = false;
		layer_sprite_change(s, spr_phone);
	}
}
