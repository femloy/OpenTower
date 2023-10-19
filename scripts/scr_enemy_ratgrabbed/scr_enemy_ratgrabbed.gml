function scr_enemy_ratgrabbed()
{
	var p = object_index == obj_junk || object_get_parent(object_index) == obj_junk;
	if ((!p && state == states.ratgrabbed) || (p && ratgrabbed))
	{
		visible = false;
		x = ratplayerid.x;
		y = ratplayerid.y;
		if (!p)
			sprite_index = stunfallspr;
		if (!p && state != states.stun)
			state = states.ratgrabbed;
		if (p && !ratgrabbed)
			ratgrabbed = true;
		if (ratplayerid.state == states.ratmountspit && ratplayerid.image_index >= 5)
		{
			hsp = ratplayerid.xscale * 22;
			vsp = -2;
			image_xscale = -ratplayerid.xscale;
			y = ratplayerid.y - 5;
			thrown = true;
			visible = true;
			if (!p)
			{
				grounded = false;
				hp = -1;
				alarm[1] = 5;
				state = states.stun;
				stunned = 200;
				hithsp = hsp;
				hitvsp = vsp;
				linethrown = true;
			}
			else
			{
				grounded = false;
				ratgrabbed = false;
			}
		}
	}
}
