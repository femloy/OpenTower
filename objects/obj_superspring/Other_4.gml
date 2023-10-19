if (image_yscale == -1)
{
	sprite_index = spr_bottle_idle;
	activatespr = spr_bottle_activate;
}
var s = string_letters(room_get_name(room));
if (s == "industrial" || s == "industrialsecret")
{
	sprite_index = spr_robotspring;
	activatespr = spr_robotspring_active;
}
