if !instance_exists(self)
	exit;
if is_undefined(text)
{
	instance_destroy();
	exit;
}

var r = string_letters(room_get_name(room));
if global.panic && r != "towertutorial" && r != "towertutorialN"
{
	instance_destroy();
	exit;
}

if surface_exists(surfclip)
	surface_free(surfclip);
if surface_exists(surffinal)
	surface_free(surffinal);

compiled = false;
alarm[1] = 1;
