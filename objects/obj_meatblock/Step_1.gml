if (place_meeting(x, y + 1, obj_railparent))
{
	var _inst = instance_place(x, y + 1, obj_railparent);
	hsp = _inst.dir * _inst.movespeed;
}
else if (object_index != obj_haystack || state == states.normal)
	hsp = Approach(hsp, 0, 0.5);
if (hsp != 0)
{
	with (instance_place(x, y - 2, obj_player))
		hsp_carry = other.hsp;
	with (instance_place(x, y - 2, obj_meatblock))
		hsp_carry = other.hsp;
	with (instance_place(x, y - 2, obj_baddie))
		hsp_carry = other.hsp;
}
scr_collide();
