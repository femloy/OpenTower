event_inherited();
dmg = 30;
parryable = true;
boss_parry_hitbox = function(player, hitbox)
{
	if !hitbox.collisioned
	{
		SUPER_parry();
		with obj_pizzafaceboss
			SUPER_boss_hurt(30, player);
		with hitbox
			event_user(0);
	}
}
