function cutscene_set_hsp(obj, hspeed)
{
	var _obj = obj;
	var _hsp = hspeed;
	with _obj
		hsp = _hsp;
	cutscene_end_action();
}
function cutscene_set_vsp(obj, vspeed)
{
	with obj
		vsp = vspeed;
	cutscene_end_action();
}
