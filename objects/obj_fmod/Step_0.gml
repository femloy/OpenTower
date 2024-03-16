/// @description steam is handled here.
steam_update();
if !global.steam_api
{
	if steam_initialised()
	{
		if steam_stats_ready()
			global.steam_api = true;
	}
}
else if room != Loadiingroom
{
	if steam_is_screenshot_requested()
	{
		var date = date_current_datetime();
		var name = concat("PizzaTower_", global.screenshotcount++, date_get_second(date), date_get_minute(date), date_get_month(date), date_get_year(date), ".png");
		name = concat("screenshots/", name);
		trace("Screenshot saved ", name);
		screen_save(name);
		steam_send_screenshot(name, window_get_width(), window_get_height());
	}
}
