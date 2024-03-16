ventilator_index += 0.35;
if ventilator_index > 4
	ventilator_index = frac(ventilator_index);

draw = bbox_in_camera(view_camera[0], 32);
if draw
{
	for (var i = 0; i < array_length(leaves); i++)
	{
		var b = leaves[i];
		if (scr_ventilator_update_leaf(b))
		{
			array_delete(leaves, i--, 1);
			delete b;
		}
	}
}
