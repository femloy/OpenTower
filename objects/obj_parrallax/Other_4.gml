layer_depth("Tiles_BG", 200);
layer_depth("Tiles_BG2", 199);
layer_depth("Tiles_BG3", 198);
layer_depth("Tiles_1", 100);
layer_depth("Tiles_2", 98);
layer_depth("Tiles_3", 97);
layer_depth("Tiles_4", 96);
layer_depth("Tiles_Foreground1", 99);
layer_depth("Tiles_Foreground2", 98);
layer_depth("Tiles_Foreground3", 97);
layer_depth("Assets_BG", 201);
layer_depth("Assets_BG1", 201);
layer_depth("Assets_BG2", 202);
layer_depth("Assets_FG", -350);
layer_depth("Assets_FG1", -350);
layer_depth("Assets_FG2", -351);

var asset_layers = ["Assets_BG", "Assets_BG1", "Assets_BG2", "Assets_stillBG1", "Assets_FG", "Assets_FG1", "Assets_FG2"];
var asset_parallax = [[0.1, 0.1], [0.05, 0.05], [0.1, 0.1], [0.05, 0], [-0.1, -0.1], [-0.05, -0.05], [-0.1, -0.1]];

for (var i = 0; i < array_length(asset_layers); i++)
{
	var b = asset_layers[i];
	var p = asset_parallax[i];
	if (layer_exists(b))
	{
		b = layer_get_id(b);
		var q = layer_get_all_elements(b)
		for (var j = 0; j < array_length(q); j++)
		{
			var _asset = q[j];
			var _x = layer_sprite_get_x(_asset);
			var _y = layer_sprite_get_y(_asset);
			var spr = layer_sprite_get_sprite(_asset);
			if p[0] != 0
				layer_sprite_x(_asset, (_x - (_x * p[0])) + ((SCREEN_WIDTH / 4) * p[0]));
			if p[1] != 0 && spr != spr_industrialpipe && spr != bg_farmdirtwall
				layer_sprite_y(_asset, (_y - (_y * p[1])) + ((SCREEN_HEIGHT / 4) * p[1]));
		}
	}
}

if global.hidetiles
{
	layer_set_visible("Tiles_BG", false);
	layer_set_visible("Tiles_BG2", false);
	layer_set_visible("Tiles_BG3", false);
	layer_set_visible("Tiles_1", false);
	layer_set_visible("Tiles_2", false);
	layer_set_visible("Tiles_3", false);
	layer_set_visible("Tiles_4", false);
	layer_set_visible("Tiles_Foreground1", false);
	layer_set_visible("Tiles_Foreground2", false);
	layer_set_visible("Tiles_Foreground3", false);
}

bg_scrollx = 0;
bg_scrolly = 0;
bg_scrollxoffset = layer_get_x("Backgrounds_scroll");
bg_scrollyoffset = layer_get_y("Backgrounds_scroll");
bg_scroll2x = 0;
bg_scroll2y = 0;
bg_scroll2xoffset = layer_get_x("Backgrounds_scroll2");
bg_scroll2yoffset = layer_get_y("Backgrounds_scroll2");
bg_scroll3x = 0;
bg_scroll3y = 0;
bg_scroll3xoffset = layer_get_x("Backgrounds_scroll3");
bg_scroll3yoffset = layer_get_y("Backgrounds_scroll3");
bg_scroll4x = 0;
bg_scroll4y = 0;
bg_scroll4xoffset = layer_get_x("Backgrounds_scroll4");
bg_scroll4yoffset = layer_get_y("Backgrounds_scroll4");
bg_still1xoffset = layer_get_x("Backgrounds_still1");
bg_still1yoffset = layer_get_y("Backgrounds_still1");
bg_still2xoffset = layer_get_x("Backgrounds_still2");
bg_still2yoffset = layer_get_y("Backgrounds_still2");
bg_stillH1xoffset = layer_get_x("Backgrounds_stillH1");
bg_stillH1yoffset = layer_get_y("Backgrounds_stillH1");
bg_stillH2xoffset = layer_get_x("Backgrounds_stillH2");
bg_stillH2yoffset = layer_get_y("Backgrounds_stillH2");
bg_stillH3xoffset = layer_get_x("Backgrounds_stillH3");
bg_stillH3yoffset = layer_get_y("Backgrounds_stillH3");
bg_stillH4xoffset = layer_get_x("Backgrounds_stillH4");
bg_stillH4yoffset = layer_get_y("Backgrounds_stillH4");
bg_1xoffset = layer_get_x("Backgrounds_1");
bg_1yoffset = layer_get_y("Backgrounds_1");
bg_2xoffset = layer_get_x("Backgrounds_2");
bg_2yoffset = layer_get_y("Backgrounds_2");
bg_3xoffset = layer_get_x("Backgrounds_3");
bg_3yoffset = layer_get_y("Backgrounds_3");
bg_zigzag1_xoffset = layer_get_x("Backgrounds_zigzag1");
bg_zigzag1_yoffset = layer_get_y("Backgrounds_zigzag1");
bg_zigzag1_x = 0;
bg_zigzag1_y = 0;
bg_zigzag1_speed = layer_get_hspeed("Backgrounds_zigzag1");
bg_zigzag1_offset = layer_get_vspeed("Backgrounds_zigzag1");
bg_zigzag2_xoffset = layer_get_x("Backgrounds_zigzag2");
bg_zigzag2_yoffset = layer_get_y("Backgrounds_zigzag2");
bg_zigzag2_x = 0;
bg_zigzag2_y = 0;
bg_zigzag2_speed = layer_get_hspeed("Backgrounds_zigzag2");
bg_zigzag2_offset = layer_get_vspeed("Backgrounds_zigzag2");
bg_ZH1_xoffset = layer_get_x("Backgrounds_stillZH1");
bg_ZH1_yoffset = layer_get_y("Backgrounds_stillZH1");
bg_ZH1_x = 0;
bg_ZH1_y = 0;
bg_ZH1_speed = layer_get_hspeed("Backgrounds_stillZH1");
bg_ZH1_offset = layer_get_vspeed("Backgrounds_stillZH1");
bg_ZH2_xoffset = layer_get_x("Backgrounds_stillZH2");
bg_ZH2_yoffset = layer_get_y("Backgrounds_stillZH2");
bg_ZH2_x = 0;
bg_ZH2_y = 0;
bg_ZH2_speed = layer_get_hspeed("Backgrounds_stillZH2");
bg_ZH2_offset = layer_get_vspeed("Backgrounds_stillZH2");
fg_1xoffset = layer_get_x("Foreground_1");
fg_1yoffset = layer_get_y("Foreground_1");
fg_2xoffset = layer_get_x("Foreground_2");
fg_2yoffset = layer_get_y("Foreground_2");
fg_speed = layer_get_vspeed("Foreground_1");

layer_depth("Foreground_1", -400);
layer_depth("Foreground_Ground1", -401);
layer_depth("Backgrounds_Ground1", 250);
