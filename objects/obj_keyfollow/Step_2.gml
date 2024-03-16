timer += 20;
var old_x = xoffset;
xoffset = Wave(-40, 40, 2, 10, timer);
yoffset = Wave(-30, 48, 4, 10, timer);
x = obj_player1.x + xoffset;
y = obj_player1.y + yoffset;
if xoffset != old_x
	depth = (sign(old_x - xoffset) == 1) ? -5 : -12;
if sprite_index != spr_goblinkey && !global.key_inv
	instance_destroy();
if sprite_index == spr_goblinkey && !global.goblinkey
	instance_destroy();
