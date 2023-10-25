var p = tex_max - array_length(tex_list);
var t = p / tex_max;
var spr_w = sprite_get_width(spr_loadingscreen);
var spr_h = sprite_get_height(spr_loadingscreen);
var xx = floor((SCREEN_WIDTH / 2) - (spr_w / 2));
var yy = floor((SCREEN_HEIGHT / 2) - (spr_h / 2));
draw_sprite(spr_loadingscreen, 0, xx, yy);
draw_sprite_part(spr_loadingscreen, 1, 0, 0, spr_w * t, spr_h, xx, yy);
