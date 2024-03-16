// fetch toppins, secrets, treasures, achievements and damage
ini_open_from_string(obj_savesystem.ini_str);

var lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"];
var extra_ach = ["sranks1", "pranks1", "sranks2", "pranks2", "sranks3", "pranks3", "sranks4", "pranks4", "sranks5", "pranks5", "pepperman", "vigilante", "noise", "fakepep", "pizzaface"];

maxtoppins = array_length(lvl) * 5;
toppins = 0;
maxsecrets = array_length(lvl) * 3;
secrets = 0;
maxtreasure = array_length(lvl);
treasure = 0;
maxachievements = array_length(lvl) * 3;
maxachievements += array_length(extra_ach);
achievements = 0;

for (var i = 0; i < array_length(lvl); i++)
{
	var name = lvl[i];
	
	secrets += ini_read_real("Secret", name, 0);
	treasure += ini_read_real("Treasure", name, 0);
	
	for (var j = 0; j < 5; j++)
		toppins += ini_read_real("Toppin", concat(name, j + 1), false);
	for (var j = 0; j < 3; j++)
		achievements += ini_read_real("achievements", concat(name, j + 1), false);
}
for (var i = 0; i < array_length(extra_ach); i++)
	achievements += ini_read_real("achievements", extra_ach[i], false);

damage = ini_read_real("Game", "damage", 0);
ini_close();

// fetch palettes
ini_open_from_string(obj_savesystem.ini_str_options);

var _palettes = ["unfunny", "money", "sage", "blood", "tv", "dark", "shitty", "golden", "garish", "mooney", "funny", "itchy", "pizza", "stripes", "goldemanne", "bones", "pp", "war", "john",
"boise", "roise", "poise", "reverse", "critic", "outlaw", "antidoise", "flesheater", "super", "porcupine", "feminine", "realdoise", "forest", "racer", "comedian", "banana", "noiseTV", "madman", "bubbly", "welldone", "grannykisses", "towerguy"];

maxpalettes = array_length(_palettes);
palettes = 0;
for (i = 0; i < array_length(_palettes); i++)
	palettes += ini_read_real("Palettes", _palettes[i], false);

ini_close();

// build the textbox
text = 0;
depth = 100;

grannyID = instance_create(x, y, obj_tutorialbook);
grannyID.showgranny = false;
grannyID.mask_index = sprite_index;
grannyID.background_spr = spr_computerbackground;
grannyID.bubble_spr = spr_computerbubble;
grannyID.text_color = make_color_rgb(171, 255, 0);

update_text = function()
{
	if text == 0
	{
		var str = lang_get_value_newline("computer_text1");
		str = embed_value_string(str, [toppins, maxtoppins, secrets, maxsecrets, treasure, maxtreasure]);
	}
	else
	{
		str = lang_get_value_newline("computer_text2");
		str = embed_value_string(str, [achievements, maxachievements, palettes, maxpalettes, damage]);
	}
	trace(str);
	with grannyID
	{
		change_y = false;
		text = str;
		event_perform(ev_other, ev_room_start);
	}
};

scr_create_uparrowhitbox();
update_text();
