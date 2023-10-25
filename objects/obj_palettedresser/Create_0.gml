depth = 100;

palettes = [
	["classic", true, 1],
	["unfunny", false, 3],
	["money", false, 4],
	["sage", false, 5],
	["blood", false, 6],
	["tv", false, 7],
	["dark", false, 8],
	["shitty", false, 9],
	["golden", false, 10],
	["garish", false, 11],
	["mooney", false, 15],
	["funny", false, 12, spr_peppattern1],
	["itchy", false, 12, spr_peppattern2],
	["pizza", false, 12, spr_peppattern3],
	["stripes", false, 12, spr_peppattern4],
	["goldemanne", false, 12, spr_peppattern5],
	["bones", false, 12, spr_peppattern6],
	["pp", false, 12, spr_peppattern7],
	["war", false, 12, spr_peppattern8],
	["john", false, 12, spr_peppattern9],
	["candy", false, 12, spr_peppattern10],
	["bloodstained", false, 12, spr_peppattern11],
	["bat", false, 12, spr_peppattern12],
	["pumpkin", false, 12, spr_peppattern13],
	["fur", false, 12, spr_peppattern14],
	["flesh", false, 12, spr_peppattern15]
];

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
