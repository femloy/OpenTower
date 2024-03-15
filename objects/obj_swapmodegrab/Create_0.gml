movespeed = 10;
hsp = 0;
vsp = 0;
grav = 0.5;
state = 0; // not an enum
image_speed = 0.35;
depth = -3;
slidecloudID = -4;
alarm[0] = 1;
usepalette = true;
grab_snd = fmod_event_create_instance("event:/sfx/pep/suplexdash");
fmod_event_instance_play(grab_snd);
