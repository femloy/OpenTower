closed = false;
graffiti = false;
if global.factorygraffiti == noone
	global.factorygraffiti = quick_ini_read_real(get_savefile_ini(), "cutscene", "factorygraffiti", false);
if global.graffiticutscene == noone
	global.graffiticutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "graffiti", false);
if global.factorygraffiti
	graffiti = true;
