if start
{
	draw_sprite(titlecard_sprite, titlecard_index, 0, 0);
	var s = 1;
	lang_draw_sprite(title_sprite, title_index, 32 + irandom_range(-s, s), irandom_range(-s, s));
	for (var i = 0; i < array_length(noisehead); i++)
	{
		var head = noisehead[i];
		if !head.visible
		{
			
		}
		else
		{
			head.visual_scale = Approach(head.visual_scale, 1, 0.25);
			draw_sprite_ext(spr_titlecard_noise, head.image_index, head.x, head.y, head.scale * head.visual_scale, head.scale * head.visual_scale, 0, c_white, 1);
		}
	}
}
if !instance_exists(obj_fadeout)
	draw_set_alpha(fadealpha);
else
	draw_set_alpha(obj_fadeout.fadealpha);
draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
draw_set_alpha(1);
