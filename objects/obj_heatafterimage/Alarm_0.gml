x = obj_player1.x;
y = obj_player1.y;
if (!instance_exists(obj_pizzaface_thunderdark))
{
	visible = false;
	is_visible = false;
}
else
{
	visible = obj_player1.visible;
	is_visible = true;
}
if room == rank_room
	visible = false;
if (instance_exists(obj_pizzaface_thunderdark))
	alpha = 0.2;
Vspeed = random_range(-1, 1);
Hspeed = random_range(-1, 1);
alarm[0] = 10;
if (!instance_exists(obj_pizzaface_thunderdark))
	visible = false;
