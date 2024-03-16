draw_sprite(spr_Opeppino, -1, view_get_hport(0) - sprite_get_width(spr_Opeppino), Oy);
if (Oy != (view_get_hport(0) - sprite_get_height(spr_Opeppino)) && up == 1)
	Oy -= 10;
if up == 0
	Oy += 10;
