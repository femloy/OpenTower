if (instance_exists(obj_weaponmachine))
	visible = true;
else if (show == 0)
	visible = false;
if (show > 0)
{
	show -= 1;
	visible = true;
}
