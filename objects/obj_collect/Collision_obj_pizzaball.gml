if room == rm_editor
	exit;
if object_index != obj_escapecollect
	scr_sound_multiple("event:/sfx/misc/collect", x, y);
else
	scr_sound_multiple("event:/sfx/misc/bellcollect", x, y);
if obj_player1.character == "V"
	global.playerhealth = clamp(global.playerhealth + 1, 0, 100);
global.heattime += 10;
global.heattime = clamp(global.heattime, 0, 60);
global.combotime += 10;
global.combotime = clamp(global.combotime, 0, 60);
with obj_camera
	healthshaketime = 30;
var val = heat_calculate(10);
global.collect += val;
create_collect(x, y, sprite_index, val);
with (instance_create(x + 16, y, obj_smallnumber))
	number = string(val);
instance_destroy();
