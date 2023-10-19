image_speed = 0.35;
following_character_init();
ds_list_add_unique(global.followerlist, id);
pos = ds_list_find_index(global.followerlist, id);
followid = (pos > 0) ? ds_list_find_value(global.followerlist, pos - 1) : -4;
