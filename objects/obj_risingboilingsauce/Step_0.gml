if (place_meeting(x, y - 1, obj_player))
{
	obj_player.state = states.fireass;
	obj_player.image_index = 0;
	obj_player.vsp = -25;
	obj_player.sprite_index = spr_player_fireass;
}
if global.panic == true
	y -= 0.5;
