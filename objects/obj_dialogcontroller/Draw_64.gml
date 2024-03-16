var _w = obj_camera.original_cam_width;
var _h = obj_camera.original_cam_height;
var ds_h = 0;
if dialogsprite != -4
	ds_h = sprite_get_height(dialogsprite);
draw_set_font(font2);
var x1 = rpadding;
var y1 = _h - (dialogheight + rpadding + (padding * 2) + ds_h);
draw_rectangle_color(x1, y1, _w - rpadding, _h - rpadding, c_white, c_white, c_white, c_white, false);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if dialogsprite != -4
	draw_sprite(dialogsprite, -1, x1 + padding, y1 + (padding / 2));
draw_text_color(x1 + padding, y1 + padding + ds_h, displaytext, c_black, c_black, c_black, c_black, 1);
