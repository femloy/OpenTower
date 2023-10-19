if (state != states.blockstance)
{
	obj_player1.brick = false;
	state = states.blockstance;
	sprite_index = spr_hamkuff_chain1;
	state = states.blockstance;
	with (instance_create(other.x, other.y, obj_brickcomeback))
	{
		trapped = true;
		baddieID = other.id;
		other.playerid = id;
	}
	instance_destroy(other, false);
}
