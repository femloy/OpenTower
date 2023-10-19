if (state == states.thrown)
	exit;
if (other.state == states.handstandjump)
{
	if (state == states.handstandjump)
	{
		with (other)
		{
			state = states.supergrab;
			substate = states.grab;
			attackcooldown = 0;
			baddieID = other.id;
			punchcount = 8;
			sprite_index = spr_grab;
		}
		state = states.supergrab;
		substate = states.grab;
		punchcount = 12;
		attackcooldown = 0;
		playerid = other.id;
	}
	else
	{
		with (other)
		{
			state = states.supergrab;
			substate = states.grab;
			attackcooldown = 0;
			baddieID = other.id;
			punchcount = 5;
			sprite_index = spr_grab;
		}
		hsp = 0;
		playerid = other.id;
		state = states.supergrab;
		substate = states.grabbed;
		cooldown += 15;
	}
}
else if (state == states.handstandjump)
{
	state = states.supergrab;
	substate = states.grab;
	punchcount = 6;
	attackcooldown = 0;
	playerid = other.id;
	other.state = states.supergrab;
	other.substate = states.grabbed;
	other.sprite_index = other.spr_hurt;
}
