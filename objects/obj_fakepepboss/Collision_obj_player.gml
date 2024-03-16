if (staggerbuffer <= 0 && flickertime <= 0 && ((other.state == states.handstandjump || other.instakillmove) && visible && (state == states.walk || (state == states.jump && sprite_index == spr_fakepeppino_bodyslamstart) || (state == states.freefall && sprite_index == spr_fakepeppino_bodyslamland) || (state == states.mach2 && attackspeed < 18) || state == states.Sjumpprep || (state == states.throwing && sprite_index != spr_fakepeppino_flailing))))
{
	if subhp > 0
	{
		if state == states.walk
		{
			state = states.staggered;
			image_xscale = -other.xscale;
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
		image_xscale = -other.xscale;
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
	with other
	{
		fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y);
		image_index = 0;
		movespeed = 4;
		if ispeppino
			sprite_index = choose(spr_player_lungehit, spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3);
		else
		{
			if state == states.machcancel && hsp != 0
				xscale = sign(hsp);
			sprite_index = choose(spr_playerN_backkick, spr_playerN_tackle);
		}
		state = states.tackle;
	}
}
else if (state == states.freefall || (state == states.mach2 && attackspeed >= 18) || state == states.Sjump || (state == states.throwing && attackspeed > 4))
{
	if other.flash
		flash = false;
	scr_hurtplayer(other);
}
