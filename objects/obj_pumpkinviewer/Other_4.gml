if (!is_holiday(holiday.halloween) || global.panic || pumpkinroom == noone)
{
	instance_destroy()
	exit;
}
if (!quick_ini_read_real("", "halloween", pumpkinroom, false))
	instance_destroy()
