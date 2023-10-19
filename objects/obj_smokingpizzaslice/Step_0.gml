if (room == rm_editor)
	exit;
if (bombreset > 0)
	bombreset--;
switch (state)
{
	case states.walk:
		if (state == states.pizzagoblinthrow)
			break;
		else
		{
			if (substate_buffer > 0)
				substate_buffer--;
			else
			{
				substate_buffer = substate_max;
				var old_substate = substate;
				while (substate == old_substate)
					substate = choose(states.walk, states.idle, states.turn);
				if (substate == states.turn && state == states.pizzagoblinthrow)
					substate = states.walk;
				if (substate == states.walk)
					image_xscale = choose(-1, 1);
				else if (substate == states.turn)
				{
					sprite_index = spr_pizzaslug_turn;
					image_index = 0;
					hsp = 0;
				}
			}
			switch substate
			{
				case states.walk:
					image_speed = 0.35;
					if (sprite_index != spr_pizzaslug_walk)
					{
						image_index = 0;
						sprite_index = spr_pizzaslug_walk;
					}
					if place_meeting(x, y, obj_solid)
						y--;
					scr_enemy_walk();
					break;
				
				case states.idle:
					image_speed = 0.35;
					hsp = 0;
					sprite_index = spr_pizzaslug_idle;
					break;
				
				case states.turn:
					image_speed = 0.35;
					substate_buffer = 5;
					if (sprite_index != spr_pizzaslug_turn)
					{
						image_index = 0;
						sprite_index = spr_pizzaslug_turn;
					}
					if (sprite_index == spr_pizzaslug_turn && floor(image_index) == (image_number - 1))
					{
						image_xscale *= -1;
						substate_buffer = substate_max;
						substate = states.idle;
						sprite_index = spr_pizzaslug_idle;
					}
					break;
				
				case states.pizzagoblinthrow:
					state = states.pizzagoblinthrow;
					substate_buffer = 0;
					image_index = 0;
					sprite_index = spr_pizzaslug_cough;
					break;
			}
			break
		}
	case states.idle:
		scr_enemy_idle();
		break;
	case states.turn:
		scr_enemy_turn();
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
	case states.rage:
		scr_enemy_rage();
		break;
}
if (state == states.stun && stunned > 100 && birdcreated == 0)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != states.stun)
	birdcreated = false;
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
var player = instance_nearest(x, y, obj_player);
if (state == states.walk && substate != states.turn)
{
	if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 60) && y >= (player.y - 60)) && ragecooldown == 0)
	{
		if (global.stylethreshold >= 3 || elite)
		{
			if (x != player.x)
				image_xscale = -sign(x - player.x);
			image_speed = 0.6;
			hsp = 0;
			shot = false;
			sprite_index = spr_pizzaslug_rage;
			image_index = 0;
			state = states.rage;
		}
		else
		{
			if (x != player.x)
				image_xscale = -sign(x - player.x);
			ragecooldown = 160;
			state = states.pizzagoblinthrow;
			substate_buffer = 0;
			image_index = 0;
			sprite_index = spr_pizzaslug_cough;
		}
	}
}
if (ragecooldown > 0)
	ragecooldown--;
scr_scareenemy();
if (state != states.grabbed)
	depth = 0;
if (state != states.stun)
	thrown = false;
if (boundbox == 0)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index;
		mask_index = other.sprite_index;
		baddieID = other.id;
		other.boundbox = true;
	}
}
