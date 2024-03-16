if collect > 0
{
	var diff = collect;
	collect -= collectminus;
	if collect < 0
		collect = 0;
	diff -= collect;
	diff = round(diff);
	global.collect += diff;
	scr_sound_multiple("event:/sfx/misc/collect", obj_player1.x, obj_player1.y);
	global.heattime += 10;
	global.heattime = clamp(global.heattime, 0, 60);
	global.combotime += 10;
	global.combotime = clamp(global.combotime, 0, 60);
	with obj_camera
		healthshaketime = 30;
	with (instance_create(obj_player1.x, obj_player1.y, obj_smallnumber))
		number = string(diff);
	create_collect(obj_player1.x, obj_player1.y, choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect), diff);
}
