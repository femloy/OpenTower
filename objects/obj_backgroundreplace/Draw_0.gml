if backgroundID != -4
{
    var cx = camera_get_view_x(view_camera[0]);
    var cy = camera_get_view_y(view_camera[0]);
    var cw = camera_get_view_width(view_camera[0]);
    var ch = camera_get_view_height(view_camera[0]);
    var sprw = sprite_get_width(background_spr);
    var sprh = sprite_get_height(background_spr);
    var lx = layer_get_x(backgroundID);
    var ly = layer_get_y(backgroundID);
    draw_sprite_tiled(background_spr, 0, lx, ly);
    if chunks != -4
    {
        for (var i = 0; i < array_length(chunks); i++)
        {
            var b = chunks[i];
            draw_sprite_tiled(b[0], b[3], lx + b[1], ly + b[2]);
        }
    }
    for (i = 0; i < array_length(chunks); i++)
    {
        b = chunks[i];
        var ix = b[3];
        ix += b[4];
        if ix > sprite_get_number(b[0]) - 1
            ix = frac(ix);
        array_set(array_get(chunks, i), 3, ix);
    }
}
