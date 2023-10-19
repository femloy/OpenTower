function scr_rockblock_tag()
{
	with (instance_place(x + 1, y, obj_rockblock))
	{
		if (!destroy)
		{
			destroy = true;
			scr_rockblock_tag();
		}
	}
	with (instance_place(x - 1, y, obj_rockblock))
	{
		if (!destroy)
		{
			destroy = true;
			scr_rockblock_tag();
		}
	}
	with (instance_place(x, y + 1, obj_rockblock))
	{
		if (!destroy)
		{
			destroy = true;
			scr_rockblock_tag();
		}
	}
	with (instance_place(x, y - 1, obj_rockblock))
	{
		if (!destroy)
		{
			destroy = true;
			scr_rockblock_tag();
		}
	}
	with (instance_place(x + 1, y, obj_destructiblerockblock))
	{
		if (!destroy)
		{
			destroy = true;
			scr_rockblock_tag();
		}
	}
	with (instance_place(x - 1, y, obj_destructiblerockblock))
	{
		if (!destroy)
		{
			destroy = true;
			scr_rockblock_tag();
		}
	}
	with (instance_place(x, y + 1, obj_destructiblerockblock))
	{
		if (!destroy)
		{
			destroy = true;
			scr_rockblock_tag();
		}
	}
	with (instance_place(x, y - 1, obj_destructiblerockblock))
	{
		if (!destroy)
		{
			destroy = true;
			scr_rockblock_tag();
		}
	}
}
