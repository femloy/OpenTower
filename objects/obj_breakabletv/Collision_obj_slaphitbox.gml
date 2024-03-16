instance_create(x + (obj_player1.xscale * 40), y, obj_punchdust);
with obj_player1
{
	image_index = 0;
	sprite_index = spr_player_haulingstart;
	heavy = true;
	baddiegrabbedID = other.id;
	state = states.grab;
}
grabbed = true;
