scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
repeat 4
{
	with (create_debris(x + 32, y + 32, spr_tutorialblockdebris))
		vsp = -irandom_range(5, 11);
}
instance_destroy();
