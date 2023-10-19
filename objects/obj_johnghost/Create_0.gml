state = states.walk;
playerid = instance_nearest(x, y, obj_player);
targetx = (playerid.xscale > 0) ? 896 : 64;
currentx = x - camera_get_view_x(view_camera[0]);
attack_buffer = 0;
attack_max = 120;
hitboxcreate = false;
