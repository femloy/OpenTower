x = obj_player1.x;
y = obj_player1.y;
image_xscale = obj_player1.xscale * obj_player1.scale_xs;
image_yscale = obj_player1.yscale * obj_player1.scale_ys;
if obj_player1.sprite_index != obj_player1.spr_fightball
	instance_destroy();
