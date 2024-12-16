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

compiled = false;
alarm[1] = 1;
