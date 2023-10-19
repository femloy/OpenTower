if (global.leveltosave == "forest" || global.leveltosave == "street")
	stick = true;
else if (irandom(100) <= 15)
	stick = true;
var r = string_letters(room_get_name(room));
if (sprite_index != spr_gustavo_exitsign || r == "saloon" || room == space_11b || r == "freezer" || r == "chateau")
	stick = false;
if (stick)
	ystart -= 6;
