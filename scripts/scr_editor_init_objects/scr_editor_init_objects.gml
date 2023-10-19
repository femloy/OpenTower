function scr_editor_init_objects()
{
	add_object(0, "SOLID", spr_wall, obj_solid, 16, 16);
    add_object(0, "PLATFORM", spr_baddie, obj_platform, 16, 16);
    add_object(0, "SLOPE", spr_slope, obj_slope, 16, 16);
    add_object(1, "CHEESESLIME", spr_slimemove, obj_cheeseslime, 32, 32);
    add_object(1, "FORKNIGHT", spr_forknight_idle, obj_forknight, 32, 32);
}
