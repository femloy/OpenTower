function toggle_panel(argument0) //toggle_panel
{
    var _closed = 0
    with (obj_panel)
    {
        if (ID == argument0 && state == (1 << 0))
            _closed = 1
    }
    if _closed
    {
        with (obj_panel)
        {
            if (ID == argument0)
                state = (0 << 0)
            else if (ID != -4)
                state = (1 << 0)
        }
    }
    else
    {
        with (obj_panel)
        {
            if (ID != -4)
                state = (1 << 0)
        }
    }
}

