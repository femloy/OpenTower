var ach = achievement_get_struct(achievement);
if (ach != -4)
{
	if (ach.unlocked)
	{
		hidden = false;
		image_index = index;
	}
	else
		image_index = index + secretplus;
}
else
{
	trace("Not found secret: ", achievement);
	image_index = index + secretplus;
}
textfont = lang_get_font("creditsfont");
if (hidden)
	texttitle = lang_get_value("achievement_hiddentitle");
else
	texttitle = lang_get_value(concat("achievement_", achievement, "title"));
textdesc = lang_get_value(concat("achievement_", achievement));
if (is_string(textdesc))
	textdesc = string_replace_all(textdesc, "\\n", "\n");
