function pattern_set(color_array, sprite, subimg, xscale, yscale, pattern)
{
    if pattern == noone
        exit;
	
    pattern_enable(true);
    pattern_set_pattern(pattern, 0);
    pattern_set_sprite(sprite, subimg, xscale, yscale);
    pattern_set_color_array(color_array);
}
