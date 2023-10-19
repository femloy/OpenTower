var s = delta_time / 1000000;

if room != Endingroom && room != Creditsroom && room != Johnresurrectionroom && room != rank_room
&& !instance_exists(obj_endlevelfade) && room != hub_loadingscreen && room != Finalintro
{
	global.file_seconds += s;
	if global.file_seconds >= 60
	{
		global.file_seconds = frac(global.file_seconds);
		global.file_minutes++;
	}
	
	global.level_seconds += s;
	if global.level_seconds >= 60
	{
		global.level_seconds = frac(global.level_seconds);
		global.level_minutes++;
	}
}
