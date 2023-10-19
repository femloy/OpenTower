if (ds_list_find_index(global.baddieroom, id) == -1)
{
	create_particle(x, y, particle.genericpoofeffect);
	ds_list_add(global.baddieroom, id);
}
