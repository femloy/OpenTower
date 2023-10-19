with (other)
{
	if (!other.collisioned)
	{
		if (direction < 90 || direction > 270)
			obj_player1.xscale = -1;
		else
			obj_player1.xscale = 1;
	}
	if (sprite_index == spr_piraneapple_projectile)
		instance_destroy();
	else
	{
		direction -= 180;
		instance_create(obj_player1.x + (obj_player1.xscale * 20), obj_player1.y, obj_bangeffect);
	}
}
if (!collisioned)
	event_user(0);
