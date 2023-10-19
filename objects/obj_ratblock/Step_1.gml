with (obj_player)
{
	if ((state == states.handstandjump || state == states.mach3 || state == states.mach2 || (state == states.tumble && sprite_index == spr_crouchslip)) && (place_meeting(x + sign(hsp), y, other) || place_meeting(x + xscale, y, other)))
	{
		state = states.bump;
		hsp = -xscale * 5;
		vsp = -2;
		sprite_index = spr_bump;
		fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
		with (other)
		{
			image_index = 0;
			switch (sprite_index)
			{
				case spr_ratblock:
					sprite_index = spr_ratblock1_bump;
					break;
				case spr_ratblock6:
					sprite_index = spr_ratblock6_bump;
					break;
				case spr_rattumbleblock:
					sprite_index = spr_rattumbleblock_bump;
					break;
				case spr_rattumbleblock_big:
					sprite_index = spr_rattumbleblock_big_bump;
					break;
			}
		}
	}
}
