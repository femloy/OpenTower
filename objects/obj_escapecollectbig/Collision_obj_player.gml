if room == rm_editor
	exit;
if image_alpha == 1
{
	if other.state != states.gotoplayer
	{
		if obj_player1.character == "V"
			global.playerhealth = clamp(global.playerhealth + 10, 0, 100);
		global.heattime = 60;
		with obj_camera
			healthshaketime = 60;
		global.combotime = 60;
		fmod_event_one_shot_3d("event:/sfx/misc/collectpizza", x, y);
		fmod_event_one_shot_3d("event:/sfx/misc/bellcollectbig", x, y);
		instance_destroy();
		var val = heat_calculate(value);
		if other.object_index == obj_player1
			global.collect += val;
		else
			global.collectN += val;
		create_collect(x, y, sprite_index, val);
		with (instance_create(x + 16, y, obj_smallnumber))
			number = string(val);
	}
}
