if (global.leveltosave == "forest" || global.leveltosave == "street")
	stick = true;
else if (irandom(100) <= 15)
	stick = true;
if obj_player1.ispeppino
{
	var r = string_letters(room_get_name(room));
	if (sprite_index != spr_gustavo_exitsign || r == "saloon" || room == space_11b || r == "freezer" || r == "chateau")
		stick = false;
}
if stick
	ystart -= 6;
if (!obj_player1.ispeppino || global.swapmode)
{
	sprite_index = spr_noiseyexit_fall;
	var _palinfo = get_noise_palette_info();
	paletteselect = _palinfo.paletteselect;
	spr_palette = _palinfo.spr_palette;
	patterntexture = _palinfo.patterntexture;
	if stick
		sprite_index = spr_noisette_fall;
}
