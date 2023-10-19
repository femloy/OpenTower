x = playerid.x;
y = playerid.y;
depth = playerid.depth - 1;
if (playerid.vsp > 0)
	fade = true;
if (fade == 1)
	image_alpha -= 0.1;
if (image_alpha <= 0)
	instance_destroy();
