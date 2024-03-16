scr_menu_getinput();
if obj_characterselect.ready
	visible = false;
y = lerp(y, ystart, 0.5);
if (key_down2 || (global.swapmode && key_up2)) && visible
{
	global.swapmode = !global.swapmode;
	y += 10;
}
image_index = global.swapmode;
