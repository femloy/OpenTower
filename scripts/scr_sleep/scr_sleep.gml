function scr_sleep(miliseconds)
{
	var time = current_time;
	var ms = miliseconds;
	do {} until current_time - time >= round(ms);
	return current_time - time;
}
