if room == rm_editor
	exit;
sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect);
image_speed = 0.35;
global.collected = false;
global.collectsound = 0;
depth = 11;
gotowardsplayer = false;
movespeed = 5;
