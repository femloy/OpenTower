if phase == 0 && attacking
{
	if state == states.pizzaface_ram
	{
		if other.state == states.backbreaker && other.parry_inst != -4
		{
			state = states.normal;
			boss_hurt(10, other.id);
			stunned = 50;
			with other
			{
				state = states.parry;
				sprite_index = choose(spr_parry1, spr_parry2, spr_parry3);
				image_index = 0;
				image_speed = 0.35;
				taunttimer = 20;
				movespeed = 8;
				parry_inst = -4;
				parry_count = parry_max;
				with (instance_create(x, y, obj_parryeffect))
					image_xscale = other.xscale;
				flash = true;
			}
			parrycount++;
			if parrycount > 1
			{
				parrycount = 0;
				if lostattacks > 0
				{
					lostattacks--;
					var choseattack = -4;
					for (var j = 0; choseattack == noone; choseattack = phase1attacks[j])
						j = irandom_range(1, array_length(phase1attacks)) - 1;
					phase1attacks[j] = -4;
					with (instance_create(x, y, obj_pizzafacepart))
					{
						vsp = -11;
						hsp = choose(-5, 5);
						switch choseattack
						{
							case states.pizzaface_mouth:
								sprite_index = spr_pizzafaceword;
								break;
							case states.pizzaface_eyes:
								sprite_index = spr_sausageman_idle;
								break;
							case states.pizzaface_nose:
								sprite_index = spr_shroomcollect;
								break;
						}
					}
				}
			}
		}
		else
		{
			state = states.normal;
			player_hurt(20, other.id);
		}
	}
	else
	{
		state = states.normal;
		player_hurt(20, other.id);
	}
}
else if phase > 0
	event_inherited();
