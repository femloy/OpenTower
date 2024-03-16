function scr_rail_phy()
{
	with (instance_place(x, (y + 1), obj_railparent))
		other.hsp_carry = (dir * movespeed)
}
