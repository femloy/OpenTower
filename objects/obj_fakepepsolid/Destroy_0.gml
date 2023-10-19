scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
repeat (30)
	create_debris(irandom_range(x, x + sprite_width), irandom_range(y, y + sprite_height), spr_debris);
