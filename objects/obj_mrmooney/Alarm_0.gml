sprite_index = spr_noisetterabbit_jump;
vsp = -11;
instance_create(x, y + 5, obj_highjumpcloud2);
fmod_event_one_shot_3d("event:/sfx/pep/jump", x, y);
