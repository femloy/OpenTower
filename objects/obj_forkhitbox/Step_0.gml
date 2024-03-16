if (!instance_exists(ID))
{
	instance_destroy();
	exit;
}
x = ID.x;
y = ID.y;
image_xscale = ID.image_xscale;
image_yscale = ID.image_yscale;
with ID
{
	if (object_index == obj_coolpineapple || object_index == obj_ghostknight || object_index == obj_forknight || object_index == obj_noisey || object_index == obj_smokingpizzaslice)
	{
		if state != states.walk && state != states.rage
		{
			hitboxcreate = false;
			instance_destroy(other);
		}
	}
	switch object_index
	{
		case obj_golfdemon:
			if state != states.charge
				instance_destroy(other);
			break;
		case obj_pizzafaceboss_p3:
			if ((state != states.punch && state != states.swinging) || (state == states.punch && floor(image_index) >= 38))
				instance_destroy(other);
			break;
		case obj_fakepepclone:
		case obj_fakepepboss:
			if (state != states.Sjump && (state != states.Sjumpprep || image_index >= 11))
				instance_destroy(other);
			break;
		case obj_pepperman:
			if state != states.freefall
				instance_destroy(other);
			break;
		case obj_badrat:
			other.x = x + (image_xscale * 16);
			if state != states.pizzagoblinthrow
				instance_destroy(other);
			break;
		case obj_farmerbaddie:
		case obj_farmerbaddie2:
		case obj_farmerbaddie3:
			other.x = x + (image_xscale * 16);
			if state != states.charge
				instance_destroy(other);
			break;
		case obj_peppinoclone:
			other.x = x - (image_xscale * 10);
			if state != states.punch
				instance_destroy(other);
			break;
		case obj_motodude:
			other.x = x + (image_xscale * 32);
			break;
		case obj_robot:
			if state != states.mach2 && state != states.slap && state != states.tackle
			{
				hitboxcreate = false;
				instance_destroy(other);
			}
			else if state == states.slap
			{
				other.x = x + (image_xscale * 32);
				if (floor(image_index) == image_number - 2 || floor(image_index) < 8)
					instance_destroy(other);
			}
			else if (state == states.mach2 || state == states.tackle)
				other.x = x + (image_xscale * 20);
			break;
		case obj_soldier:
			other.x = x + (image_xscale * 24);
			if state != states.rage
				instance_destroy(other);
			break;
		case obj_indiancheese:
			if state != states.walk && sprite_index != spr_indiancheese_howl
			{
				hitboxcreate = false;
				instance_destroy(other);
			}
			break;
		case obj_thug_red:
		case obj_thug_blue:
		case obj_thug_green:
			if state != states.punch
			{
				instance_destroy(other);
				punchinst = -4;
			}
			break;
		case obj_weeniesquire:
			if state != states.punch
			{
				hitboxcreate = false;
				instance_destroy(other);
			}
			break;
		case obj_minijohn:
			if state != states.rage && state != states.punch
				instance_destroy(other);
			break;
		case obj_ninja:
			if state != states.charge && state != states.punch
				instance_destroy(other);
			if state == states.punch
			{
				if image_index > 14
					instance_destroy(other);
				other.x = x + (image_xscale * 24);
			}
			break;
		case obj_boulder:
			if !hitwall
				instance_destroy(other);
			break;
		case obj_snickexe:
			if (obj_player1.instakillmove || obj_player1.state == states.handstandjump)
			{
				instance_destroy(other);
				hitboxcreate = false;
			}
			break;
		case obj_pickle:
			if state != states.pizzagoblinthrow
				instance_destroy(other);
			break;
		case obj_peasanto:
		case obj_fencer:
		case obj_ancho:
			if state != states.charge && state != states.rage
			{
				hitboxcreate = false;
				instance_destroy(other);
			}
			break;
		case obj_snowman:
			other.y = y - 22;
			if state != states.charge && state != states.rage
			{
				hitboxcreate = false;
				instance_destroy(other);
			}
			break;
	}
}
