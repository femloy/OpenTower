function scr_enemy_secret()
{
	visible = false;
	invincible = true;
	hsp = 0;
	if (!secretjumped && !place_meeting(x, y, obj_secretbigblock))
	{
		secretjumped = true;
		vsp = -8;
	}
	if secretjumped
	{
		visible = true;
		if grounded && vsp > 0
		{
			invincible = savedsecretinvincible;
			state = states.walk;
			sprite_index = walkspr;
		}
	}
}
