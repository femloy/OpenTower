if (instance_exists(baddieID))
{
	if (baddieID.vsp > 0 && baddieID.state != states.grabbed)
	{
		instance_create(x, y, obj_bumpeffect);
		baddieID.stunned = 200;
		if (other.x != baddieID.x)
			baddieID.image_xscale = -sign(baddieID.x - other.x);
		baddieID.vsp = -5;
		baddieID.hsp = other.image_xscale * 2;
		baddieID.state = states.stun;
		baddieID.image_index = 0;
	}
}
