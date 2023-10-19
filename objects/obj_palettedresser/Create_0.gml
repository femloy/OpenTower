depth = 100;
palettes = [["classic", 1, 1], ["unfunny", 0, 3], ["money", 0, 4], ["sage", 0, 5], ["blood", 0, 6], ["tv", 0, 7], ["dark", 0, 8], ["shitty", 0, 9], ["golden", 0, 10], ["garish", 0, 11], ["mooney", 0, 15], ["funny", 0, 12, spr_peppattern1], ["itchy", 0, 12, spr_peppattern2], ["pizza", 0, 12, spr_peppattern3], ["stripes", 0, 12, spr_peppattern4], ["goldemanne", 0, 12, spr_peppattern5], ["bones", 0, 12, spr_peppattern6], ["pp", 0, 12, spr_peppattern7], ["war", 0, 12, spr_peppattern8], ["john", 0, 12, spr_peppattern9]]
ini_open_from_string(obj_savesystem.ini_str_options);
for (var i = 1; i < array_length(palettes); i++)
{
	if (ini_read_real("Palettes", palettes[i][0], false))
		palettes[i][1] = true;
}
ini_close();
scr_create_uparrowhitbox();
paletteselect = 0;
with (obj_player1)
{
	if (paletteselect > 2)
	{
		for (i = 0; i < array_length(other.palettes); i++)
		{
			var pal = other.palettes[i][2];
			if (pal == paletteselect && (pal != 12 || other.palettes[i][3] == global.palettetexture))
			{
				other.paletteselect = i;
				break;
			}
		}
	}
}
showtext = false;
alpha = 0;
palettetitle = lang_get_value(concat("dresser_", palettes[paletteselect][0], "title"));
palettedesc = lang_get_value_newline(concat("dresser_", palettes[paletteselect][0]));
