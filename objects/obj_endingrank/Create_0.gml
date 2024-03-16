rank_spr = spr_rank_holyshit;
rank_name = "";
music = fmod_event_create_instance("event:/music/finalrank");
fmod_event_instance_play(music);
bg_index = 0;
bg_x = 0;
bg_y = 0;
ispeppino = obj_player1.ispeppino;
snd_drumroll = fmod_event_create_instance("event:/sfx/playerN/finaljudgement_drumroll");
snd_verdict = fmod_event_create_instance("event:/sfx/playerN/finaljudgement_verdict");
snd_start = fmod_event_create_instance("event:/sfx/playerN/finaljudgement_start");
if !ispeppino
	fmod_event_instance_play(snd_start);
sprite_index = spr_finaljudgement;
image_speed = 0.35;
if !ispeppino
	sprite_index = spr_finaljudgementN;
fade = 1;
state = 0; // not an enum
introbuffer = 300;
brown = false;
brownfade = 0;
depth = -601;
alarm[0] = 1;
with obj_music
{
	if music != -4
		fmod_event_instance_stop(music.event, true);
}

var timer = scr_get_timer_string(global.file_minutes, global.file_seconds, true);
var levels = [
	"entrance", "medieval", "ruin", "dungeon",
	"badland", "graveyard", "farm", "saloon",
	"plage", "forest", "minigolf", "space",
	"sewer", "industrial", "street", "freezer",
	"chateau", "war", "kidsparty", "exit",
	"w1stick", "w2stick", "w3stick", "w4stick", "w5stick"
];

ini_open_from_string(obj_savesystem.ini_str);
var damage = ini_read_real("Game", "damage", 0);
var _score = 0;
var _enemies = ini_read_real("Game", "enemies", 0);
for (var i = 0; i < array_length(levels); i++)
	_score += ini_read_real("Highscore", levels[i], 0);

var _perc = get_percentage();
if _perc >= 95
	rank_spr = spr_rank_wow;
else if _perc >= 83
	rank_spr = spr_rank_notbad;
else if _perc >= 72
	rank_spr = spr_rank_nojudgement;
else if _perc >= 61
	rank_spr = spr_rank_officer;
else if _perc >= 50
	rank_spr = spr_rank_confused;
else
	rank_spr = spr_rank_yousuck;

if (ini_read_string("Game", "finalrank", "none") == "none")
{
	if global.file_minutes < 240 && _perc >= 95
		rank_spr = spr_rank_holyshit;
	else if global.file_minutes < 120
		rank_spr = spr_rank_quick;
}
if (ini_read_string("Game", "finalrank", "none") == "holyshit")
	rank_spr = spr_rank_holyshit;

var r = "yousuck";
switch rank_spr
{
	case spr_rank_wow:
		r = "wow";
		break;
	case spr_rank_notbad:
		r = "notbad";
		break;
	case spr_rank_nojudgement:
		r = "nojudgement";
		break;
	case spr_rank_confused:
		r = "confused";
		break;
	case spr_rank_holyshit:
		r = "holyshit";
		break;
	case spr_rank_quick:
		r = "quick";
		break;
	case spr_rank_officer:
		r = "officer";
		break;
}
rank_name = r;

switch rank_spr
{
	case spr_rank_yousuck:
		bg_index = 0;
		break;
	case spr_rank_wow:
		bg_index = 6;
		break;
	case spr_rank_notbad:
		bg_index = 5;
		break;
	case spr_rank_nojudgement:
		bg_index = 4;
		break;
	case spr_rank_confused:
		bg_index = 1;
		break;
	case spr_rank_holyshit:
		bg_index = 7;
		break;
	case spr_rank_quick:
		bg_index = 2;
		break;
	case spr_rank_officer:
		bg_index = 3;
		break;
}
if !ispeppino
{
	switch rank_spr
	{
		case spr_rank_yousuck:
			rank_spr = spr_rankN1;
			break;
		case spr_rank_confused:
			rank_spr = spr_rankN2;
			break;
		case spr_rank_officer:
			rank_spr = spr_rankN3;
			break;
		case spr_rank_nojudgement:
			rank_spr = spr_rankN4;
			break;
		case spr_rank_notbad:
			rank_spr = spr_rankN5;
			break;
		case spr_rank_wow:
			rank_spr = spr_rankN_wow;
			break;
		case spr_rank_quick:
			rank_spr = spr_rankN_quick;
			break;
		case spr_rank_holyshit:
			rank_spr = spr_rankN_holyshit;
			break;
	}
}

ini_write_string("Game", "finalrank", r);
if (ini_read_real("Game", "snotty", false) == false)
	ini_write_real("Game", "finalsnotty", true);
obj_savesystem.ini_str = ini_close();
gamesave_async_save();

percentage = _perc;
percvisual = 0;
text = [
	[false, concat(lang_get_value("rank_totaltime"), timer)],
	[false, concat(lang_get_value("rank_totaldamage"), damage)],
	[false, concat(lang_get_value("rank_totalscore"), _score)],
	[false, concat(lang_get_value("rank_totalenemies"), _enemies)]
];
text_pos = 0;
