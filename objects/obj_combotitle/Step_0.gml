title_index += 0.35;
if title_index >= 2
	title_index = frac(title_index);
image_index = (title * 2) + title_index;
if (image_index > sprite_get_number(spr_comboend_title1))
{
	image_index -= sprite_get_number(spr_comboend_title1);
	very = true;
}
paletteselect = 0;
vsp -= 1;
y = ystart;
