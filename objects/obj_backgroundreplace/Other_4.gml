backgroundID = layer_get_id(background_name);
backgroundBG_ID = layer_background_get_id(backgroundID);
background_spr = layer_background_get_sprite(backgroundBG_ID);
depth = layer_get_depth(backgroundID);
layer_set_visible(backgroundID, false);
layer_background_speed(backgroundID, 0);
