function scr_loophallway(hallway)
{
	if hallway.start
	{
		var yy = y - hallway.y;
		var _per = yy / hallway.sprite_height;
		with obj_loophallway
		{
			if id != hallway.id && !start
			{
				other.x = x + (sprite_width / 2);
				other.y = (y + (sprite_height * _per)) - 1;
				if other.object_index == obj_vigilanteboss
					other.oldtargetspot = noone;
			}
		}
	}
}
