bossspr = spr_vspizzaface;
boss_hp = 16;
vstitle = spr_vstitle_pizzaface;
boss_hpsprite = spr_bossfight_pizzafaceHP;
boss_palette = spr_bossfight_pizzafacepalette;

boss_func = function()
{
	var eh = 0;
	if instance_exists(obj_pizzafaceboss)
	{
		with obj_pizzafaceboss
			eh = elitehit;
		boss_hp = eh;
	}
	else if instance_exists(obj_pizzafaceboss_p2)
	{
		with obj_pizzafaceboss_p2
		{
			if state != states.fall || substate == states.transition
				eh = elitehit;
		}
		boss_hp = eh;
	}
	else if instance_exists(obj_pizzafaceboss_p3)
	{
		with obj_pizzafaceboss_p3
			eh = scr_bosscontroller_pizzaface_p3_health();
		if eh > boss_maxhp
			eh -= boss_maxhp;
		boss_hp = eh;
	}
	else
	{
		with obj_pepperman
			eh = scr_bosscontroller_pizzaface_p3_health();
		with obj_vigilanteboss
		{
			if !pizzaheadKO
				eh = scr_bosscontroller_pizzaface_p3_health();
		}
		with obj_noiseboss
		{
			if !pizzaheadKO
				eh = scr_bosscontroller_pizzaface_p3_health();
		}
		with obj_fakepepboss
		{
			if !pizzaheadKO
				eh = scr_bosscontroller_pizzaface_p3_health();
		}
		if eh > boss_maxhp
			eh -= boss_maxhp;
		boss_hp = eh;
	}
}

