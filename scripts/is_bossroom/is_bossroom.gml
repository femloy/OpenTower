function is_bossroom()
{
	return room == boss_pepperman || room == boss_noise || room == boss_vigilante || room == boss_mrstick || room == boss_pizzaface || room == boss_pizzaface_p3 || room == boss_fakepep || room == boss_fakepephallway || room == boss_fakepepkey || room == boss_pizzafacefinale || room == boss_pizzafacehub || room == Finalintro || room == Endingroom || room == Johnresurrectionroom || room == Creditsroom || room == tower_pizzafacehall
	|| (is_holiday(holiday.halloween) && (string_letters(room_get_name(room)) == "trickytreatb" || string_letters(room_get_name(room)) == "trickytreat"));
}
