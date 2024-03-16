vsp += 0.5
if vsp > 20
	vsp = 20
y += vsp
repeat 2
{
	instance_destroy(instance_place(x, (y + vsp), obj_destructibles))
	instance_destroy(instance_place(x, (y + vsp), obj_metalblock))
	instance_destroy(instance_place(x, (y + vsp), obj_baddie))
}
if (scr_solid(x, (y + 1)) && (!(place_meeting(x, (y + vsp), obj_destructibles))) && (!(place_meeting(x, (y + vsp), obj_metalblock))))
	instance_destroy()
