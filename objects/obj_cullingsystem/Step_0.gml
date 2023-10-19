if (frames > 0)
	frames--;
if (frames <= 0)
{
	frames = framesmax;
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	var cw = camera_get_view_width(view_camera[0]);
	var ch = camera_get_view_height(view_camera[0]);
	for (var i = 0; i < ds_list_size(cull_list); i++)
	{
		var b = ds_list_find_value(cull_list, i);
		if (rectangle_in_rectangle(b.bbox_left, b.bbox_top, b.bbox_right, b.bbox_bottom, cx - offset, cy - offset, cx + cw + offset, cy + ch + offset))
		{
			instance_activate_object(b.ID);
			switch (b.object_index)
			{
				case obj_baddiecollisionbox:
					instance_activate_object(b.baddieID);
					break;
			}
			ds_list_delete(cull_list, i--);
		}
	}
	for (i = 0; i < array_length(object_arr); i++)
	{
		b = object_arr[i];
		with (b)
		{
			if (!rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, cx - other.offset, cy - other.offset, cx + cw + other.offset, cy + ch + other.offset))
			{
				var q = {
					object_index: b
				}
				
				q.ID = id;
				q.bbox_left = bbox_left;
				q.bbox_right = bbox_right;
				q.bbox_bottom = bbox_bottom;
				q.bbox_top = bbox_top;
				var _deactivate = true;
				switch (b)
				{
					case obj_baddiecollisionbox:
						if (instance_exists(baddieID) && (baddieID.important || baddieID.thrown || !baddieID.grounded))
							_deactivate = false;
						if (_deactivate)
						{
							q.baddieID = baddieID;
							instance_deactivate_object(baddieID);
						}
						break;
				}
				if (_deactivate)
				{
					ds_list_add(other.cull_list, q);
					instance_deactivate_object(id);
				}
			}
		}
	}
}
