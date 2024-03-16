if obj_player1.character == "V"
	global.playerhealth = clamp(global.playerhealth + 10, 0, 100);
global.heattime = 60;
with obj_camera
	healthshaketime = 60;
fmod_event_one_shot("event:/sfx/misc/collectpizza");
instance_destroy();
global.combotime = 60;
var val = heat_calculate(100);
global.collect += val;
create_collect(x, y, sprite_index, val);
with (instance_create(x + 16, y, obj_smallnumber))
	number = string(val);
