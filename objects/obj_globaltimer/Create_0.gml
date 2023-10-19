if (instance_number(object_index) > 1)
{
	instance_destroy();
	exit;
}
timer = get_milliseconds();
global.file_minutes = 0;
global.file_seconds = 0;
global.level_minutes = 0;
global.level_seconds = 0;
depth = -600;
