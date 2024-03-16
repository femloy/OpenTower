if state == states.flushtransition
{
	if floor(image_index) == image_number - 1
	{
		switch sprite_index
		{
			case spr_flush_pizzatransition:
				sprite_index = spr_flush_pizza;
				break;
			case spr_flush_rattransition:
				sprite_index = spr_flush_rat;
				break;
			case spr_flush_skulltransition:
				sprite_index = spr_flush_skull;
				break;
		}
	}
}
