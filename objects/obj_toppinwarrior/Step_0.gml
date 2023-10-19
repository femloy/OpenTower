if (obj_player1.spotlight == 1)
	playerid = obj_player1;
else
	playerid = obj_player2;
visible = playerid.visible;
if (set == 0)
{
	switch (toppinwarrior)
	{
		case 1:
			depth = 10;
			spr_idle = spr_twarrior1_idle;
			spr_pose = spr_twarrior1_pose;
			spr_run = spr_twarrior1_run;
			spr_attack = spr_twarrior1_attack;
			spr_hurt = spr_twarrior1_hurt;
			global.toppinwarriorid1 = id;
			set = true;
			break;
		case 2:
			depth = 11;
			spr_idle = spr_twarrior2_idle;
			spr_pose = spr_twarrior2_pose;
			spr_run = spr_twarrior2_run;
			spr_attack = spr_twarrior2_attack;
			spr_hurt = spr_twarrior2_hurt;
			global.toppinwarriorid2 = id;
			set = true;
			break;
		case 3:
			depth = 12;
			spr_idle = spr_twarrior3_idle;
			spr_pose = spr_twarrior3_pose;
			spr_run = spr_twarrior3_run;
			spr_attack = spr_twarrior3_attack;
			spr_hurt = spr_twarrior3_hurt;
			global.toppinwarriorid3 = id;
			set = true;
			break;
		case 4:
			depth = 13;
			spr_idle = spr_twarrior4_idle;
			spr_pose = spr_twarrior4_pose;
			spr_run = spr_twarrior4_run;
			spr_attack = spr_twarrior4_attack;
			spr_hurt = spr_twarrior4_hurt;
			global.toppinwarriorid4 = id;
			set = true;
			break;
		case 5:
			depth = 14;
			spr_idle = spr_twarrior5_idle;
			spr_pose = spr_twarrior5_pose;
			spr_run = spr_twarrior5_run;
			spr_attack = spr_twarrior5_attack;
			spr_hurt = spr_twarrior5_hurt;
			global.toppinwarriorid5 = id;
			set = true;
			break;
	}
}
