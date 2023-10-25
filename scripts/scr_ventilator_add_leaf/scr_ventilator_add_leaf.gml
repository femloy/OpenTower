function scr_ventilator_add_leaf(argument0, argument1) //scr_ventilator_add_leaf
{
    var b = 
    {
        x: argument0,
        y: argument1,
        destroy: 0,
        vsp: (-(random_range(1, 5))),
        image_speed: 0,
        image_alpha: 0,
        image_index: irandom((sprite_get_number(spr_ventilatorleaf) - 1))
    }

    array_push(leaves, b)
}

function scr_ventilator_update_leaf(argument0) //scr_ventilator_update_leaf
{
    with (argument0)
    {
        if (!destroy)
        {
            image_alpha = Approach(image_alpha, 1, 0.1)
            if (y < (other.bbox_top - 48))
                destroy = 1
        }
        else
        {
            image_alpha = Approach(image_alpha, 0, 0.1)
            if (image_alpha <= 0)
                return 1;
        }
        y += vsp
    }
    return 0;
}

