if obj_player1.character == "V"
	global.playerhealth = clamp(global.playerhealth + 5, 0, 100);
if other.object_index == obj_player1
	global.collect += 25;
else
	global.collectN += 25;
global.heattime += 25;
global.heattime = clamp(global.heattime, 0, 60);
with obj_camera
	healthshaketime = 40;
with (instance_create(x + 16, y, obj_smallnumber))
	number = string(25);
scr_sound_multiple("event:/sfx/misc/collect", x, y);
instance_destroy();
