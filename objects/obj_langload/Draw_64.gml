draw_rectangle_color(0, 0, CAMERA_WIDTH, CAMERA_HEIGHT, c_black, c_black, c_black, c_black, false);
var p3 = lang_tex_max - lang_tex;
var t = p3 / lang_tex_max;
var spr_w = sprite_get_width(spr_loadingscreen);
var spr_h = sprite_get_height(spr_loadingscreen);
var xx = floor(obj_screensizer.actual_width / 2 - spr_w / 2);
var yy = floor(obj_screensizer.actual_height / 2 - spr_h / 2);
draw_sprite(spr_loadingscreen, 0, xx, yy);
draw_sprite_part(spr_loadingscreen, 1, 0, 0, spr_w * t, spr_h, xx, yy);
