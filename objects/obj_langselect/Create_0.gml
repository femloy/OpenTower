lang = array_create(0);
select = 0;
startbuffer = 10;
depth = -1000;

// Hardcoding the flag sprites! Mmm! Yummy! Lazy devs! Yes!
var pref = ["en", "jp", "sc", "tc", "fr", "it", "spa", "latam", "gr", "ru", "br", "kr"];
for (var i = 0; i < array_length(pref); i++)
{
    var q = 
    {
        ID: pref[i],
        image_index: i,
        name: ds_map_find_value(global.lang_available, array_get(pref, i)).name,
        spr_name: noone
    }
	
    switch pref[i]
    {
        case "jp":
            q.spr_name = spr_lang_name_jp;
            break;
        case "kr":
            q.spr_name = spr_lang_name_kr;
            break;
        case "ru":
            q.spr_name = spr_lang_name_ru;
            break;
        case "sc":
            q.spr_name = spr_lang_name_sc;
            break;
        case "tc":
            q.spr_name = spr_lang_name_tc;
            break;
    }

    array_push(lang, q);
    if pref[i] == global.lang
        select = i;
}

left_offset = 0;
right_offset = 0;

// detect custom languages, and give them an empty question mark flag, because fuck you.
var key = ds_map_find_first(global.lang_available);
for (i = 0; i < ds_map_size(global.lang_available); i++)
{
    var found = false;
	for (var j = 0; j < array_length(pref); j++)
	{
		if pref[j] == key
        {
            found = true;
            break;
        }
	}
    if !found
    {
        array_push(lang, 
        {
            ID: key,
            name: ds_map_find_value(global.lang_available, key).name,
            image_index: sprite_get_number(spr_lang_flags) - 1,
			spr_name: noone
        });
    }
    key = ds_map_find_next(global.lang_available, key);
}
