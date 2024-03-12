function get_savefile_ini(peppino = true)
{
	if global.swapmode
		peppino = false;
	return concat("saveData", global.currentsavefile, peppino ? "" : "N", ".ini");
}
