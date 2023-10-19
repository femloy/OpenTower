objectID = -4;
image_speed = 0;
depth = -80;
ypad = 70;
timedgate = true;
last_index = 0;
init = false;
create_particle(obj_player1.x, obj_player.y - ypad, particle.genericpoofeffect);
fmod_event_one_shot("event:/sfx/misc/timerbegin");
