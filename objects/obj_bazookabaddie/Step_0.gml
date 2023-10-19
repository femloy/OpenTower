switch (state)
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
		hsp = 0;
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
var player = instance_nearest(x, y, obj_player);
if (bombreset > 0)
	bombreset--;
if (x != player.x && grounded && player.x > (x - 500) && player.x < (x + 500) && player.y > (y - 500) && player.y < (y + 500) && !instance_exists(bazookaID))
{
	if (state == states.walk && bombreset <= 0)
	{
		if (x != player.x)
			image_xscale = -sign(x - player.x);
		image_index = 0;
		state = states.pizzagoblinthrow;
	}
}
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (floor(image_index) == (image_number - 1) && sprite_index == spr_spitcheese_spit)
	sprite_index = spr_spitcheese_idle;
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
