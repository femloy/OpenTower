if ((state == states.freefall && sprite_index != spr_fakepeppino_bodyslamland) || (state == states.mach2 && attackspeed >= 50) || state == states.Sjump || (state == states.throwing && sprite_index == spr_fakepeppino_flailing))
{
	if other.flash
		flash = 0
	scr_hurtplayer(other)
}
