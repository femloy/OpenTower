var xx = x;
var yy = y;
image_speed = 0.35;
event_inherited();
if (xx != x || yy != y)
	sprite_index = spr_gnomepizza_walk;
else
	sprite_index = spr_gnomepizza_idle;
