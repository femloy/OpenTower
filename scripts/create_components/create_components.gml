function create_components(_type, _inst)
{
    with (obj_editor)
    {
        var q = ds_map_find_value(component_map, _type)
        if (!is_undefined(q))
        {
            for (var i = 0; i < array_length(q); i++)
            {
                var b = q[i]
                switch b.type
                {
                    case "resize":
                        with (instance_create(x, y, obj_resizecomponent))
                        {
                            dock = component_get_dock(b.dock)
                            snap = b.snap
                            lock = b.lock
                            inst = _inst
                            if variable_struct_exists(b, "clamp_lock")
                            {
                                if variable_struct_exists(b.clamp_lock, "x")
                                    xclamp = b.clamp_lock.x
                                if variable_struct_exists(b.clamp_lock, "y")
                                    yclamp = b.clamp_lock.y
                            }
                        }
                        break
                    case "mirror":
                        with (instance_create(x, y, obj_buttoncomponent))
                        {
                            inst = _inst
                            on_left_click = function()
                            {
                                with (inst)
                                {
                                    image_xscale *= -1
                                    var oldx = x
                                    var oldy = y
                                    clamp_to_room(global.current_level.current_room)
                                    if (oldx != x || oldy != y)
                                        command_add(new MoveObjectCMD(id, x, y, oldx, oldy))
                                    command_add(new ResizeCMD(id, image_xscale, image_yscale, (-image_xscale), image_yscale))
                                }
                            }
                        }
                        break
                }

            }
        }
    }
}

function component_get_dock(str)
{
    switch str
    {
        case "BottomRight":
            return comp_dock.right;
        case "Bottom":
            return comp_dock.bottom;
        case "BottomLeft":
            return comp_dock.bottomleft;
        case "TopRight":
            return comp_dock.topright;
        case "Top":
            return comp_dock.top;
        case "TopLeft":
            return comp_dock.topleft;
        case "Right":
            return comp_dock.right;
        case "Left":
            return comp_dock.left;
    }
    return noone;
}
