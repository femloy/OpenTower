ID = 4;
with instance_create_depth(0, 0, depth - 1, obj_itemlist)
{
    parent = other.id;
    image_xscale = other.image_xscale;
    image_yscale = other.image_yscale;
	
    ds_list_add(items, 
    {
        name: "Room Settings",
        func: function()
        {
            toggle_panel(7);
        }
    });
	
    ds_list_add(items, 
    {
        name: "Level Settings",
        func: function()
        {
			// Placeholder
        }
    });
	
    ds_list_add(items, 
    {
        name: "Save Level",
        func: function()
		{
            with obj_editor
            {
                if editor_state != editorstates.saving
                    save_level();
            }
        }
    });
	
    dirty = false;
    on_item_click = function(pos)
    {
        if pos < ds_list_size(items)
            ds_list_find_value(items, pos).func();
    };
}
