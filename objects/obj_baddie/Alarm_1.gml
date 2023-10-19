var a = random_range(-20, 20);
if (state == states.stun && hsp != 0 && thrown == 1)
	alarm[1] = 5;
instance_create(x + a, y + a, obj_machalleffect);
