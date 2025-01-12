ID = 1;
var _categories = array_create(0);
var size = ds_map_size(obj_editor.object_map);
var key = ds_map_find_first(obj_editor.object_map);

for (var i = 0; i < size; i++)
{
    array_push(_categories, key);
    key = ds_map_find_next(obj_editor.object_map, key);
}

array_sort(_categories, function(value1, value2)
{
    return ds_map_find_value(obj_editor.object_order_map, value1) - ds_map_find_value(obj_editor.object_order_map, value2);
});

for (var i = 0; i < array_length(_categories); i++)
{
    var b = _categories[i];
    with instance_create_depth(0, 32 * i, depth - 1, obj_button)
    {
        name = b;
        value = b;
        parent = other.id;
        image_xscale = 0.5;
        image_yscale = 0.5;
        on_left_click = function()
        {
            with obj_itemlist
            {
                if ID == 2
                {
                    value = other.value;
                    dirty = true;
                }
            }
        };
    }
}

with instance_create_depth(32, 0, depth - 1, obj_itemlist)
{
    image_yscale = other.image_yscale;
    image_xscale = other.sprite_width - 32 / 64;
    parent = other.id;
    value = _categories[0];
    ID = 2;
    item_height = 48;
    
    on_dirty = function()
    {       
        dirty = false;
        ds_list_clear(items);
        var list = ds_map_find_value(obj_editor.object_map, value);
        for (var i = 0; i < ds_list_size(list); i++)
            ds_list_add(items, ds_list_find_value(list, i));
    };
    
    on_item_click = function(_item)
    {       
        if _item < ds_list_size(items)
        {
            var item = ds_list_find_value(items, _item);
            with obj_editor
            {
                selected_object = item;
                editor_state = editor_states.instance_edit;
            }
            toggle_panel(1);
        }
    };
    
    on_item_draw = function(_x, _y, _item)
    {       
        if draw_get_font() != 0
            draw_set_font(fnt_caption);

        draw_set_halign(fa_left);
        draw_set_valign(fa_middle);
        var spritedisplay = asset_get_index(_item.sprite_index);
        var display_w = 32;
        var display_h = 32;
        var _sprw = sprite_get_width(spritedisplay);
        var _sprh = sprite_get_height(spritedisplay);
        var _sprx = sprite_get_xoffset(spritedisplay);
        var _spry = sprite_get_yoffset(spritedisplay);
        var ix = (_sprw > display_w || _sprh > display_h) ? (display_w / _sprw) : 1;
        var iy = (_sprw > display_w || _sprh > display_h) ? (display_h / _sprh) : 1;
        var ixy = min(ix, iy);
        if _sprx == 0
            _sprx = (display_w / 2) - (_sprw / 2);
        if _spry == 0
            _spry = (display_h / 2) - (_sprh / 2);
        _sprx *= ixy;
        _spry *= ixy;
        draw_sprite_ext(spritedisplay, 0, _x + 4 + _sprx, _y + ((item_height - display_h) / 2) + _spry, ixy, ixy, 0, c_white, 1);
        draw_text_color(_x + 8 + display_w, _y + (item_height / 2), _item.name, c_white, c_white, c_white, c_white, 1);
    };
}