countdown -= 0.5;
if (place_meeting(x + 1, y, obj_ratblock) || place_meeting(x - 1, y, obj_ratblock) || place_meeting(x, y - 1, obj_ratblock) || place_meeting(x, y + 1, obj_ratblock))
	instance_destroy();
if (scr_solid(x + 1, y) || scr_solid(x - 1, y))
	drop = true;
if (place_meeting(x, y + 1, obj_solid))
	hsp = 0;
if (place_meeting(x, y + 1, obj_railparent))
{
	var _railinst = instance_place(x, y + 1, obj_railparent);
	hsp = _railinst.movespeed * _railinst.dir;
}
if (vsp < 12)
	vsp += grav;
if (countdown < 50)
	sprite_index = spr_bomblit;
if (countdown == 0)
	instance_destroy();
if (scr_solid(x + floor(hsp), y))
{
	x = floor(x);
	while (!scr_solid(x + sign(hsp), y))
		x += sign(hsp);
	hsp = 0;
}
x += hsp;
if (scr_solid(x, y + floor(vsp)))
{
	y = floor(y);
	while (!scr_solid(x, y + sign(vsp)))
		y += sign(vsp);
	vsp = 0;
}
y += floor(vsp);
