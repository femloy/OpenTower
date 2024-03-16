function scr_ventilator_add_leaf(x, y)
{
	var b = 
	{
		x: x,
		y: y,
		destroy: false,
		vsp: -random_range(1, 5),
		image_speed: 0,
		image_alpha: 0,
		image_index: irandom(sprite_get_number(spr_ventilatorleaf) - 1)
	}
	array_push(leaves, b);
}

function scr_ventilator_update_leaf(leaf_struct)
{
	with leaf_struct
	{
		if !destroy
		{
			image_alpha = Approach(image_alpha, 1, 0.1);
			if y < other.bbox_top - 48
				destroy = true;
		}
		else
		{
			image_alpha = Approach(image_alpha, 0, 0.1);
			if image_alpha <= 0
				return true;
		}
		y += vsp;
	}
	return false;
}

