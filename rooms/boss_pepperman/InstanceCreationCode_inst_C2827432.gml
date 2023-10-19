bossspr = spr_vspepperman;
boss_hp = 20;
vstitle = spr_vstitle_pepperman
boss_columnmax = 5;
boss_hp_x -= 50;
boss_func = function()
{
	var eh = 0;
	var p = 0;
	with (obj_pepperman)
	{
		eh = elitehit;
		p = phase;
	}
	if (p == 1)
		boss_hp = eh;
	else if (p == 2)
	{
		boss_hp = eh;
		if (eh <= 0)
			boss_hp = 1;
	}
	else if (p == 0)
		boss_hp = 0;
};
