x = obj_player.x;
y = (sprite_get_bbox_top(obj_player.sprite_index) + obj_player.y) - 40;
image_xscale = obj_player.xscale;
if (obj_player.state == states.knightpepslopes || obj_player.state == states.knightpep || room == rank_room)
	visible = false;
else if global.cowboyhat == 1
	visible = true;
else
	visible = false;
