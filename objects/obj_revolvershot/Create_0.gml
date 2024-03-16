event_inherited();
dmg = 30;
spd = 25;
parryable = true;

function player_hurt(damage, player)
{
	if !collisioned
	{
		var prevstate = argument1.state;
		SUPER_player_hurt(damage, player);
		argument1.xscale = -image_xscale;
		argument1.hitxscale = -image_xscale;
		if prevstate == states.superattack
		{
			argument1.hithsp = 0;
			argument1.hitvsp = 0;
			argument1.hitstate = states.superattack;
			with obj_vigilanteboss
				duel_buffer = duel_max + irandom(duel_random);
		}
	}
}
function parry()
{
	var prevparried = parried;
	SUPER_parry();
	if prevparried != parried
	{
		image_xscale *= -1;
		dmg = 100;
		spd = 30;
	}
}
