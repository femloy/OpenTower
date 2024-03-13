depth = 100;
player_palettes = [];
player_palettes[0] = [
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
];
player_palettes[1] = [
	["classicN", true, 1],
	["boise", false, 3],
	["roise", false, 4],
	["poise", false, 5],
	["reverse", false, 6],
	["critic", false, 7],
	["outlaw", false, 8],
	["antidoise", false, 9],
	["flesheater", false, 10],
	["super", false, 11],
	["porcupine", false, 15],
	["feminine", false, 16],
	["realdoise", false, 17],
	["forest", false, 18],
	["racer", false, 28, 699],
	["comedian", false, 27, 656],
	["banana", false, 26, 4035],
	["noiseTV", false, 25, 3629],
	["madman", false, 24, 4488],
	["bubbly", false, 23, 3863],
	["welldone", false, 22, 2633],
	["grannykisses", false, 21, 1930],
	["towerguy", false, 20, 2277]
];

ini_open_from_string(obj_savesystem.ini_str_options);
for (var i = 0; i < array_length(player_palettes); i++)
{
	array_push(player_palettes[i], ["candy", false, 12, 4546]);
	array_push(player_palettes[i], ["bloodstained", false, 12, 2999]);
	array_push(player_palettes[i], ["bat", false, 12, 3635]);
	array_push(player_palettes[i], ["pumpkin", false, 12, 1988]);
	array_push(player_palettes[i], ["fur", false, 12, 2047]);
	array_push(player_palettes[i], ["flesh", false, 12, 4577]);
	for (var j = 1; j < array_length(player_palettes[i]); j++)
	{
		if (ini_read_real("Palettes", player_palettes[i][j][0], false))
			player_palettes[i][j][1] = true;
	}
}
ini_close();

scr_create_uparrowhitbox();
paletteselect = 0;
ispeppino = !obj_player1.ispeppino;
showtext = false;
alpha = 0;
palettetitle = "";
palettedesc = "";
