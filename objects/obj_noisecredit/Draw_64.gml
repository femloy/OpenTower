draw_set_font(global.creditsfont);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_color(x, y, name, c_white, c_white, c_white, c_white, 1);

var space_width = 500;
var xx = space_width / (array_length(heads) + 1);
var xlen = xx;
for (var i = 0; i < array_length(heads); i++)
{
	var head = heads[i];
	if !head.visible
	{
		
	}
	else
	{
		head.scale = Approach(head.scale, 1, 0.25);
		draw_sprite_ext(spr_titlecard_noise, head.image_index, x - (space_width / 2) + xx + (xlen * i), y + 200, head.scale, head.scale, 0, c_white, image_alpha);
	}
}
