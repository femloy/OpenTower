if (instance_number(object_index) > 1)
{
	instance_destroy();
	exit;
}
timer = get_milliseconds();
global.livesplit_helper1 = 1234;
global.file_minutes = 0;
global.file_seconds = 0;
global.level_minutes = 0;
global.level_seconds = 0;
global.livesplit_helper2 = 5678;
depth = -600;

// livesplit
use_livesplit = false;
for (var i = 0; i < parameter_count(); i++)
{
	var p = string_lower(parameter_string(i));
	switch p
	{
		case "--livesplit":
		case "-livesplit":
			use_livesplit = true;
			break;
	}
}
ls_buffer = -1;
if use_livesplit
{
	ls_buffer = buffer_create(2048, buffer_fixed, 1);
	buffer_fill(ls_buffer, 0, buffer_u8, 0, buffer_get_size(ls_buffer));
	buffer_seek(ls_buffer, buffer_seek_start, 0);
	var MAGIC = [194, 90, 23, 101, 190, 77, 223, 214, 242, 28, 209, 59, 167, 166, 31, 195, 183, 56, 233, 233, 194, 252, 191, 9, 171, 159, 95, 22, 174, 20, 237, 100];
	MAGICsize = array_length(MAGIC);
	var Mi = 0;
	for (var Ml = MAGICsize; Mi < Ml; Mi++)
		buffer_write(ls_buffer, buffer_u8, MAGIC[Mi]);
	buffer_seek(ls_buffer, buffer_seek_start, 0);
	buffer_poke(ls_buffer, MAGICsize + 32, buffer_string, lang_get_value("game_version"));
	show_debug_message("BUFFER ADDRESS = " + string(buffer_get_address(ls_buffer)));
	show_debug_message("END!");
}
