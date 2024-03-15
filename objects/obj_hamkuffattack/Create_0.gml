dir = image_xscale;
ydir = -1;
swings = 0;
playerid = noone;
movespeed = 0;
xoffset = 0;
yoffset = 0;
state = 0; // not an enum
chargeindex = 0;
alarm[0] = 1;
loopsnd = fmod_event_create_instance("event:/sfx/playerN/piggrab");
throwsnd = fmod_event_create_instance("event:/sfx/playerN/pigthrow");
fmod_event_instance_play(loopsnd);
