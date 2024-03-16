if room != tower_5
{
	if (!surface_exists(surf))
		surf = surface_create(sprite_width, sprite_height);
	surface_set_target(surf);
	draw_clear_alpha(0, 0);
	draw_sprite(sprite_index, 0, sprite_xoffset, (y - y_to) + sprite_yoffset);
	draw_sprite(sprite_index, 1, sprite_xoffset, (y - y_to) + sprite_yoffset);
	surface_reset_target();
	draw_surface(surf, (x + irandom_range(-4, 4)) - sprite_xoffset, y_to - sprite_yoffset);
}
else
	draw_self();
