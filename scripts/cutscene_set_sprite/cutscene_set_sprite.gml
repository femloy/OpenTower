function cutscene_set_sprite(obj, spr, spd, __xscale)
{
	var _obj = obj;
	var _spr = spr;
	var _spd = spd;
	var _xscale = __xscale;
	with (_obj)
	{
		sprite_index = _spr;
		image_speed = _spd;
		image_xscale = _xscale;
		image_index = 0;
		xscale = _xscale;
	}
	cutscene_end_action();
}
