monsterid = 0;
yy = SCREEN_HEIGHT;
state = 0; // not an enum
event_perform(ev_alarm, 0);
depth = -600;
oktoberfest = false;
notification_push(notifs.monster_jumpscare, [room]);
instance_destroy(obj_noiseanimatroniceffect);
with obj_swapmodefollow
	animatronic = 0;
