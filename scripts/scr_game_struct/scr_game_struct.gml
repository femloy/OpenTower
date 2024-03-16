function scr_read_game(ini)
{
	var q = game_empty();
	ini_open(ini);
	q.percentage = ini_read_real("Game", "percent", 0);
	q.started = ini_read_real("Tutorial", "finished", false);
	q.judgement = ini_read_string("Game", "finalrank", "none");
	q.john = ini_read_real("Game", "john", false);
	q.snotty = ini_read_real("Game", "finalsnotty", false);
	q.palette = ini_read_real("Game", "palette", 1);
	q.minutes = ini_read_real("Game", "minutes", 0);
	q.seconds = ini_read_real("Game", "seconds", 0);
	var _texture = ini_read_string("Game", "palettetexture", "none");
	q.palettetexture = scr_get_texture_palette(_texture);
	q.palette_player2 = ini_read_real("Game", "palette_player2", 1);
	q.palettetexture_player2 = scr_get_texture_palette(ini_read_string("Game", "palettetexture_player2", "none"));
	ini_close();
	return q;
}
function menu_get_game(slot, peppino)
{
	var g = global.game[slot];
	if !peppino
		g = global.gameN[slot];
	
	var q = 
	{
		percentage: g.percentage,
		percvisual: 0,
		snotty: g.snotty,
		john: g.john,
		judgement: g.judgement,
		perstatus_icon: 0,
		alpha: 1,
		minutes: g.minutes,
		seconds: g.seconds
	};
	q.perstatus_icon = floor(q.percentage / (100 / 7));
	if (q.perstatus_icon > (sprite_get_number(spr_percentstatemenu) - 1))
		q.perstatus_icon = sprite_get_number(spr_percentstatemenu) - 1;
	if q.percentage >= 101
		q.perstatus_icon = 8;
	return q;
}
function game_empty()
{
	return 
	{
		percentage: 0,
		started: false,
		judgement: "none",
		john: false,
		snotty: false,
		palette: 1,
		palettetexture: -4,
		minutes: 0,
		seconds: 0,
		palette_player2: 1,
		palettetexture_player2: -4
	};
}
