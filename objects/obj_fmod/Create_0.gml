/// @description load banks / define sounds.
var maxChannels = 256;
trace("Initializing FMOD: ", fmod_init(maxChannels));
fmod_set_num_listeners(1);

var plat = "Desktop";
var banks = [concat("sound/", plat, "/Master.bank"), concat("sound/", plat, "/music.bank"), concat("sound/", plat, "/sfx.bank"), concat("sound/", plat, "/Master.strings.bank")];
trace("Loading banks! Platform -> ", plat);
for (var i = 0; i < array_length(banks); i++)
{
	var b = working_directory + banks[i];
	trace("Loading bank at: ", b);
	if (fmod_bank_load(b, false))
	{
		trace("Loading bank sample data at: ", b);
		if (!fmod_bank_load_sample_data(b))
			trace("Could not load bank sample data: ", b);
	}
	else
		trace("Could not load bank: ", b);
}
global.sound_map = ds_map_create();
global.steam_api = false;
global.screenshotcount = 0;
