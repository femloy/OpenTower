function scr_get_timer_string(minutes, seconds, include_hours = false)
{
	if seconds < 10
	{
		seconds = string_format(seconds, 1, 3);
		seconds = "0" + seconds;
	}
	else
		seconds = string_format(seconds, 2, 3);
	
	if include_hours
	{
		for (var h = 0; minutes > 59; h++)
			minutes -= 60;
		if h < 10
			h = concat("0", h);
		else
			h = string(h);
	}
	
	if minutes < 10
		minutes = concat("0", minutes);
	else
		minutes = concat(minutes);
	
	if include_hours
		return concat(h, ":", minutes, ":", seconds);
	return concat(minutes, ":", seconds);
}
