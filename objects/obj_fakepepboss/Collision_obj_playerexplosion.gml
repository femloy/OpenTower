if (staggerbuffer <= 0 && flickertime <= 0 && visible && (state == states.walk || (state == states.jump && sprite_index == spr_fakepeppino_bodyslamstart) || (state == states.freefall && sprite_index == spr_fakepeppino_bodyslamland) || (state == states.mach2 && attackspeed < 18) || state == states.Sjumpprep || (state == states.throwing && sprite_index != spr_fakepeppino_flailing)))
{
	var ix = -other.image_xscale;
	if x != other.x
		ix = sign(other.x - x);
	if subhp > 0
	{
		if state == states.walk
		{
			state = states.staggered;
			image_xscale = ix;
			hsp = -image_xscale * 20;
			vsp = 0;
			sprite_index = spr_fakepeppino_stagger;
			image_index = 0;
		}
		else
			flashbuffer = 9;
		staggerbuffer = 100;
		flash = true;
		subhp--;
		repeat 4
			create_debris(x, y, spr_slapstar);
	}
	else
	{
		with obj_fakepephead
		{
			create_particle(x, y, particle.genericpoofeffect);
			instance_destroy(id, false);
		}
		state = states.stun;
		image_xscale = ix;
		hsp = -image_xscale * 8;
		vsp = -6;
		thrown = false;
		linethrown = false;
		sprite_index = spr_fakepeppino_vulnerable;
		stunned = 200;
		flash = true;
		repeat 4
			create_debris(x, y, spr_slapstar);
	}
	instance_destroy(other);
}
