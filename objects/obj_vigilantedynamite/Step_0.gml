if grounded && vsp > 0
	instance_destroy();
if (scr_solid(x + hsp, y))
{
	instance_create(x + (image_xscale * 10), y, obj_bumpeffect);
	hsp = 0;
}
scr_collide();
