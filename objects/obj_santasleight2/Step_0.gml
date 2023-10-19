if (x > 1200 && !instance_exists(obj_fadeout) && ok == 0)
{
	with (instance_create(x, y, obj_fadeout))
		obj_player.targetRoom = Titlescreen;
}
else if (x > 1200 && ok == 1)
	instance_destroy();
x += 8;
if (room == strongcold_miniboss && x == floor(room_width / 2))
{
	sprite_index = spr_santasleightempty;
	instance_create(x, y, obj_santanoise);
}
if (room == strongcold_miniboss && !instance_exists(obj_presentbox))
	instance_destroy();
