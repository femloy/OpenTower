if (drop == 0)
{
	instance_create(x, y, obj_bumpeffect);
	hsp = -hsp;
	vsp = -3;
	drop = true;
}
else
{
	instance_destroy();
	instance_create(x, y, obj_bombexplosion);
}
