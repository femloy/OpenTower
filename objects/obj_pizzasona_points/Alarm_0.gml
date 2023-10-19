collect -= 10;
global.collect += 10;
scr_sound_multiple("event:/sfx/misc/collect", x, y);
create_collect(x + irandom_range(-40, 40), y + irandom_range(-40, 40), choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect));
if (collect > 0)
	alarm[0] = 5;
else
	instance_destroy();
