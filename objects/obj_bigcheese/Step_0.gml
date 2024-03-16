switch state
{
	case states.idle:
		scr_enemy_idle();
		break;
	case states.charge:
		scr_enemy_charge();
		break;
	case states.turn:
		scr_enemy_turn();
		break;
	case states.walk:
		scr_enemy_walk();
		break;
	case states.land:
		scr_enemy_land();
		break;
	case states.hit:
		scr_enemy_hit();
		break;
	case states.stun:
		scr_enemy_stun();
		break;
	case states.pizzagoblinthrow:
		scr_pizzagoblin_throw();
		break;
	case states.grabbed:
		scr_enemy_grabbed();
		break;
}
if state == states.walk
	hsp = 0;
else if state == states.throwing
{
	hsp = 0;
	if floor(image_index) == image_number - 1
	{
		state = states.walk;
		sprite_index = spr_bigcheese_idle;
		golfid = -4;
		playerid = -4;
	}
	var tx = x;
	var ty = y;
	var ix = floor(image_index);
	if ix < 6
	{
		tx = x + (36 * image_xscale);
		ty = y - 14;
	}
	else if ix == 6
	{
		tx = x + (30 * image_xscale);
		ty = y - 17;
	}
	else if ix == 7
	{
		tx = x + (19 * image_xscale);
		ty = y - 19;
	}
	else if ix == 8
	{
		tx = x + (15 * image_xscale);
		ty = y - 18;
	}
	else if ix == 9
	{
		tx = x - (9 * image_xscale);
		ty = y - 16;
	}
	else if ix == 10
	{
		tx = x - (30 * image_xscale);
		ty = y - 20;
	}
	else if ix == 11
	{
		tx = x - (38 * image_xscale);
		ty = y - 36;
	}
	else if ix == 12
	{
		tx = x - (70 * image_xscale);
		ty = y - 50;
	}
	else if ix < 17
	{
		tx = x - (67 * image_xscale);
		ty = y - 50;
	}
	else if ix == 17
	{
		tx = x + (27 * image_xscale);
		ty = y - 26;
	}
	if !shot
	{
		if !pizzaball
		{
			with playerid
			{
				xscale = other.image_xscale;
				movespeed = 0;
				hsp = 0;
				vsp = 0;
				state = states.actor;
				jumpstop = true;
				x = lerp(x, tx, 0.2);
				y = lerp(y, ty, 0.2);
			}
		}
		else
		{
			with golfid
			{
				depth = -14;
				image_xscale = other.image_xscale;
				x = lerp(x, tx, 0.2);
				y = lerp(y, ty, 0.2);
				hsp = 0;
				vsp = -grav;
				hsp_carry = 0;
				vsp_carry = 0;
				invincible = true;
			}
		}
	}
	if (floor(image_index) >= 15 && !shot)
	{
		shot = true;
		fmod_event_one_shot_3d("event:/sfx/enemies/minijohnpunch", x, y);
		if !pizzaball
		{
			with playerid
			{
				x = other.x;
				y = other.y;
				xscale = other.image_xscale;
				movespeed = 12;
				state = states.tumble;
				vsp = -14;
				jumpstop = true;
			}
		}
		else
		{
			with golfid
			{
				x = other.x;
				y = other.y;
				image_xscale = other.image_xscale;
				depth = 0;
				sit = false;
				scr_pizzaball_go_to_thrown(12 * image_xscale, -14, false);
				hitbuffer = 20;
			}
		}
		golfid = -4;
		playerid = -4;
	}
}
if state == states.stun && stunned > 40 && birdcreated == 0
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if state != states.stun
	birdcreated = false;
if state == states.throwing
	image_speed = throwspeed;
else
	image_speed = 0.35;
if flash == 1 && alarm[2] <= 0
	alarm[2] = 0.15 * room_speed;
if state != states.grabbed
	depth = 0;
if state != states.stun
	thrown = false;
