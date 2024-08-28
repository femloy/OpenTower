draw_sprite(sprite_index, image_index, 0, 0 + shakey);
if state == states.normal
{
	draw_sprite(spr, 0, 0, 0);
	switch spr
	{
		case spr_backtonoise:
		    lang_draw_sprite(spr_backtonoise_text, 0, 0, 0);
		    break;
		case spr_backtopeppino:
		    lang_draw_sprite(spr_backtopeppino_text, 0, 0, 0);
		    break;
		case spr_noise_intro:
		    lang_draw_sprite(spr_noise_introtext, 0, 0, 0);
		    break;
		case spr_gustavo_intro:
		    lang_draw_sprite(spr_gustavo_introtext, 0, 0, 0);
		    break;
	}
}
