ds_map_destroy(player_hurtstates);
ds_map_destroy(boss_hurtstates);
ds_map_destroy(boss_unparryablestates);
instance_create(x, y, obj_slapstar);
instance_create(x, y, obj_slapstar);
instance_create(x, y, obj_slapstar);
instance_create(x, y, obj_baddiegibs);
instance_create(x, y, obj_baddiegibs);
instance_create(x, y, obj_baddiegibs);
instance_create(x, y, obj_bangeffect);
with obj_camera
{
	shake_mag = 3;
	shake_mag_acc = 3 / room_speed;
}
with (instance_create(x, y, obj_sausageman_dead))
	sprite_index = other.spr_dead;
