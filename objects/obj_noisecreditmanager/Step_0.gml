scr_menu_getinput();
if !finish && key_jump
{
	finish = true;
	with obj_noisecredit
		finish = true;
}
if !instance_exists(obj_noisecredit)
	instance_destroy();
