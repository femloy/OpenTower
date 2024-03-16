with other
	holycross = 300;
if sprite_index != spr_crosspriest_pray
{
	sprite_index = spr_crosspriest_pray;
	image_index = 0;
	var p = other.id;
	fmod_event_one_shot("event:/sfx/misc/cross");
	if (!instance_exists(obj_crosspriest_cross) && !global.panic)
		create_transformation_tip(lang_get_value("crosspriesttip"));
	with (instance_create_unique(other.x, other.y, obj_crosspriest_cross))
		playerid = p;
}
