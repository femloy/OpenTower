if obj_player.state != states.portal && global.panic == true
{
	obj_player.hsp = 0;
	sprite_index = spr_pizzaportalend;
	image_index = 0;
	obj_player.state = states.portal;
	obj_player.grav = 0;
	obj_player.visible = false;
}
