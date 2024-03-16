alarm[8] = targetguy_max + irandom(200);
if !pizzahead && state != states.duel && state != states.phase1hurt && state != states.hit && !thrown && state != states.arenaintro && state != states.actor
{
	with (instance_create(irandom_range(120, room_width - 120), -77, obj_targetguy))
		image_xscale = (x > (room_width / 2)) ? -1 : 1;
}
