if (instance_exists(ID))
{
	if ID.press >= 8
		instance_destroy();
}
else
	instance_destroy();
