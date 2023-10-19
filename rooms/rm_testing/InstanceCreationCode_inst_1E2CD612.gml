trigger = 7;
func = function(player)
{
	if (!active)
	{
		if (following_count(obj_chickenfollow) >= 3)
		{
			active = true;
			instance_destroy(obj_chickenfollow);
		}
	}
};
