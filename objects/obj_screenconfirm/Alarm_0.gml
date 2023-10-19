alarm[0] = 60;
timer--;
if (timer <= 0)
{
    variable_global_set(varname, savedoption);
    screen_apply_fullscreen(global.option_fullscreen);
    screen_apply_size();
    instance_destroy();
}
