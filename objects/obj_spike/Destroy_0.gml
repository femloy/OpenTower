if room == custom_lvl_room
    tile_layer_delete_at(1, x, y);

if ds_list_find_index(global.saveroom, id) == -1
{
    for (var xx = bbox_left; xx < bbox_right; xx += 32)
    {
        for (var yy = bbox_top; yy < bbox_bottom; yy += 32)
        {
            var i = 0;
            repeat 2
            {
				with create_debris(x + 16, y + 16, spr_plugdebris)
					image_index = i;
				i++;
            }
        }
    }
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
    ds_list_add(global.saveroom, id);
}
