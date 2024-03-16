if (instance_exists(obj_bossplayerdeath))
	exit;

state++;
if state == 1
{
	obj_camera.lock = true;
	camx = obj_vigilanteboss.x - 100;
	camdir = 1;
	camzoom = 0.5;
	fadein = false;
	alarm[0] = 150;
	instance_destroy(obj_vigilantecow, false);
	instance_destroy(obj_vigilantecrate, false);
	instance_destroy(obj_vigilantebazooka, false);
	instance_destroy(obj_vigilantebazookatrail, false);
	instance_destroy(obj_vigilantedynamite, false);
	instance_destroy(obj_vigilanteshot, false);
}
else if state == 2
{
	color = 0;
	fadein = true;
	alarm[0] = 30;
}
else if state == 3
{
	camx = obj_player1.x - 100;
	camdir = 1;
	camzoom = 0.5;
	fadein = false;
	alarm[0] = 150;
}
else if state == 4
{
	fadein = true;
	alarm[0] = 30;
}
else if state == 5
{
	obj_camera.lock = false;
	fadein = false;
	alarm[0] = 20;
}
else if state == 6
	instance_destroy();
with obj_player
{
	pistolanim = -4;
	sprite_index = spr_peppino_duel;
	if !ispeppino
		sprite_index = spr_noise_duel;
	image_speed = 0.35;
}
with obj_vigilanteboss
	sprite_index = spr_vigilante_duel;
