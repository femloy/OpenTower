scr_menu_getinput()
if ((!finish) && key_jump)
{
    finish = 1
    with (obj_noisecredit)
        finish = 1
}
if (!instance_exists(obj_noisecredit))
    instance_destroy()
