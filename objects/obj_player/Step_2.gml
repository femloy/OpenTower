player_index = swap_is_player2();
var pal = player_index;
if global.swapmode && obj_savesystem.ispeppino
	pal = !pal;
paletteselect = player_paletteselect[pal];
global.palettetexture = player_patterntexture[pal];
player_paletteindex = pal;
if global.collect != global.lastcollect
{
	var diff = global.collect - global.lastcollect;
	global.lastcollect = global.collect;
	if global.swapmode
		global.collect_player[player_index] += diff;
}
