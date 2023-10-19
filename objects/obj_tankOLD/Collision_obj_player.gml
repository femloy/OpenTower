var baddie = id;
if (state != states.chase)
{
	with (other)
	{
		if (y < other.y && attacking == 0 && sprite_index != spr_player_mach2jump && ((state == states.boots && vsp > 0) || state == states.jump || state == states.mach1 || state == states.grab) && vsp > 0 && other.vsp >= 0 && sprite_index != spr_stompprep)
		{
			image_index = 0;
			if (key_jump2)
			{
				instance_create(x, y + 50, obj_stompeffect);
				stompAnim = true;
				vsp = -14;
				if (state == states.jump)
					sprite_index = spr_stompprep;
			}
			else
			{
				instance_create(x, y + 50, obj_stompeffect);
				stompAnim = true;
				vsp = -9;
				if (state == states.jump)
					sprite_index = spr_stompprep;
			}
		}
		if (y >= other.y && other.thrown == 0 && other.stuntouchbuffer == 0 && other.vsp > 0 && state != states.bump && other.state != states.chase)
		{
			if (state != states.bombpep && state != states.mach1 && state != states.crouchslide)
				movespeed = 0;
			var _xs = sign(x - baddie.x);
			if (floor(_xs) == 0)
				_xs = xscale;
			hsp = 3 * _xs;
			state = states.bump;
			xscale = -_xs;
			sprite_index = spr_bump;
			vsp = -4;
		}
	}
}
else
{
	with (other)
	{
		if (state != states.stunned)
		{
			state = states.stunned;
			sprite_index = spr_squished;
			image_index = 0;
			scr_losepoints();
		}
	}
}
