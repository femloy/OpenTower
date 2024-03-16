if room == rm_editor
	exit;
instance_create(x, y, obj_weeniemount);
with (instance_create(x, y, obj_sausageman_dead))
	sprite_index = spr_weeniesquire_dead;
