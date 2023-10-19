if (global.panic == true && !changed)
{
	var lay_id = layer_get_id("Assets_stillBG1");
	var s = layer_sprite_get_id(lay_id, "graphic_3B568F72");
	layer_sprite_change(s, spr_grandmascared);
	changed = true;
}
