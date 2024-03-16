value -= minus
global.collect += minus
global.combotime = 60
scr_sound_multiple("event:/sfx/misc/collect", x, y)
create_collect(x, y, choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect), minus)
with (instance_create((x + 16), y, obj_smallnumber))
	number = string(floor(other.minus))
if value > 0
	alarm[0] = 5
