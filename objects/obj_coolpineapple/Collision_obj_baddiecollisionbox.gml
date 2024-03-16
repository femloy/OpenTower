if state != states.parry && state != states.backbreaker
	exit;
var my_id = id;
var other_baddie = other.id;
var can_parry = false;
with other_baddie
{
	if (instance_exists(baddieID) && baddieID.thrown == 1 && baddieID != other.id)
		can_parry = true;
}
if can_parry && state != states.parry && other.baddieID != id
{
	sprite_index = parryspr;
	movespeed = 8;
	state = states.parry;
	image_index = 0;
}
