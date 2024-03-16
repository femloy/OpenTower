if !attacking
{
	if !invincible
	{
		boss_hurt_noplayer(30);
		if hp <= 0
			boss_destroy(lastplayerid);
	}
}
