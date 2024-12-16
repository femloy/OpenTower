event_inherited();

dmg = 30;
spd = 25;
parryable = true;

function player_hurt(damage, player)
{
	if !collisioned
	{
		var prevstate = player.state;
		SUPER_player_hurt(damage, player);
		player.xscale = -image_xscale;
		player.hitxscale = -image_xscale;
		
		if prevstate == states.superattack
		{
			player.hithsp = 0;
			player.hitvsp = 0;
			player.hitstate = states.superattack;
			
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
