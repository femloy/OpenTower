image_speed = 0;
image_index = 1;
if room != tower_entrancehall
	instance_destroy(obj_pigtotal);
if room == tower_entrancehall
	alarm[0] = 2;
if room != rm_editor
	depth = 50;
random_secret = false;
roomname = room_get_name(room);
global.progress = string_letters(roomname);
drop = false;
drop_y = y;
vsp = 0;
grav = 0.5;
dropstate = states.normal;
hand_y = y - 1000;
handsprite = spr_grabbiehand_idle;
handindex = 0;
uparrow = false;
uparrowID = -4;
if obj_player.character == "S"
	instance_destroy();
snd = false;
