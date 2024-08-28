function scr_draw_rank()
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	var spr = -4;
	switch sprite_index
	{
		case spr_rankA:
			spr = spr_rankA_text;
			break;
		case spr_rankB:
			spr = spr_rankB_text;
			break;
		case spr_rankC:
			spr = spr_rankC_text;
			break;
		case spr_rankD:
			spr = spr_rankD_text;
			break;
		case spr_rankS:
			spr = spr_rankS_text;
			break;
		case spr_rankNA:
			spr = spr_rankNA_text;
			break;
		case spr_rankNB:
			spr = spr_rankNB_text;
			break;
		case spr_rankNC:
			spr = spr_rankNC_text;
			break;
		case spr_rankND:
			spr = spr_rankND_text;
			break;
		case spr_rankNS:
			spr = spr_rankNS_text;
			break;
	}
	if spr != noone && floor(image_index) == image_number - 1
		lang_draw_sprite_ext(spr, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
