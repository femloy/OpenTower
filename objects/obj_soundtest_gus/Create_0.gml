image_speed = 0.35;
depth = 50;
idlespr = spr_lonegustavo_idle;
dancespr = spr_gusdance;
palinfo = get_pep_palette_info();
if (!obj_player1.ispeppino || global.swapmode)
{
	idlespr = spr_noisette_idle;
	dancespr = spr_noisettedance;
	palinfo = -4;
	sprite_index = idlespr;
}
