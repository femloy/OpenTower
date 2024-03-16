function scr_add_grannypizzaboss(section, entry, icon)
{
	var q = scr_add_grannypizzalevel(entry, icon, false, false, false, true);
	ini_open_from_string(obj_savesystem.ini_str);
	if (ini_read_real(section, "unlocked", false) == 0)
		array_pop(levelarray);
	ini_close();
}
function scr_add_grannypizzalevel(level, _icon, _secrets = true, _toppins = true, _treasure = true, _rank = true)
{
	var q = 
	{
		icon: _icon,
		secrets: _secrets,
		secretcount: 0,
		toppins: _toppins,
		toppinarr: [false, false, false, false, false],
		treasure: _treasure,
		gottreasure: false,
		rank: _rank,
		gotrank: -4
	};
	ini_open_from_string(obj_savesystem.ini_str);
	if q.secrets
		q.secretcount = ini_read_real("Secret", level, 0);
	if q.toppins
	{
		for (var i = 0; i < array_length(q.toppinarr); i++)
			q.toppinarr[i] = ini_read_real("Toppin", concat(level, i + 1), false);
	}
	if q.treasure
		q.gottreasure = ini_read_real("Treasure", level, false);
	if q.rank
		q.gotrank = ini_read_string("Ranks", level, "none");
	ini_close();
	array_push(levelarray, q);
	return q;
}
