if (state != states.grabbed)
{
	with (obj_player)
	{
		if (y < other.y && attacking == 0 && state == states.jump && vsp > 0)
		{
			if (vsp > 0)
			{
				other.hp = 0;
				other.stunned = 200;
				if (x != other.x)
					other.image_xscale = -sign(other.x - x);
				image_index = 0;
				if (key_jump2)
				{
					other.vsp = -5;
					other.hsp = -other.image_xscale * 3;
					instance_create(x, y + 50, obj_stompeffect);
					other.state = states.stun;
					stompAnim = true;
					other.image_index = 0;
					vsp = -14;
					sprite_index = spr_player_stompprep;
				}
				else
				{
					other.vsp = -5;
					other.hsp = -other.image_xscale * 3;
					instance_create(x, y + 50, obj_stompeffect);
					other.state = states.stun;
					stompAnim = true;
					other.image_index = 0;
					vsp = -9;
					sprite_index = spr_player_stompprep;
				}
			}
		}
		if (state == states.mach1)
		{
			instance_create(x, y, obj_bumpeffect);
			other.stunned = 40;
			if (x != other.x)
				other.image_xscale = -sign(other.x - x);
			other.vsp = -5;
			other.hsp = -other.image_xscale * 3;
			hsp = -xscale * 4;
			vsp = -4;
			machpunchAnim = true;
			if (x != other.x)
				other.image_xscale = -sign(other.x - x);
			other.state = states.stun;
			image_index = 0;
			state = states.tackle;
		}
		if (state == states.mach2 && other.grounded == 1)
		{
			other.hp = 0;
			instance_create(x, y, obj_bumpeffect);
			other.vsp = -10;
			other.hsp = xscale;
			other.image_index = 0;
			other.stunned = 200;
			other.state = states.stun;
			machpunchAnim = true;
			if (!scr_solid(x, y + 1) && state != states.freefall)
				vsp = -10;
		}
		if (attacking == 1 && state != states.mach2)
		{
			if (state == states.mach3)
				other.shot = true;
			image_index = 0;
			instance_destroy(other);
			machpunchAnim = true;
			if (!scr_solid(x, y + 1) && state != states.freefall)
				vsp = -10;
		}
		if (attacking == 0 && (state != states.tackle && state != states.hurt) && !(y < other.y) && grabbing == 0 && other.state != states.stun)
		{
			if (x != other.x)
			{
				other.image_xscale = -sign(other.x - x);
				xscale = -sign(x - other.x);
			}
			hsp = -xscale * 4;
			vsp = -4;
			other.image_xscale = -xscale;
			other.hsp = -other.image_xscale * 4;
			other.vsp = -4;
			if (other.state == states.walk || other.state == states.turn)
				other.state = states.idle;
			image_index = 0;
			state = states.bump;
			if (other.state == states.land)
				other.state = states.idle;
		}
	}
}
