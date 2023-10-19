if (global.hardmode && !(room == strongcold_endscreen || room == rank_room || room == timesuproom || room == Realtitlescreen || room == characterselect))
	draw_sprite(asset_get_index("spr_heatmeter" + string(global.heatmeter_threshold + 1)), 0, 480, 96);
