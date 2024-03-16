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
scr_scareenemy();
if state == states.stun && stunned > 40 && birdcreated == 0
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if state != states.stun
	birdcreated = false;
idlespr = spr_kentukykenny_idle;
stunfallspr = spr_kentukykenny_stun;
walkspr = spr_kentukykenny_walk;
stunspr = spr_kentukykenny_stun;
grabbedspr = spr_kentukykenny_stun;
if flash == 1 && alarm[2] <= 0
	alarm[2] = 0.15 * room_speed;
if state != states.grabbed
	depth = 0;
if state != states.stun
	thrown = false;
if bombreset > 0
	bombreset--;
var targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1.id;
if x != targetplayer.x && state != states.pizzagoblinthrow && bombreset <= 0 && grounded && targetplayer.state != states.chainsaw
{
	if ((targetplayer.x > (x - 400) && targetplayer.x < (x + 400)) && (y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20)))
	{
		if (state == states.walk || (state == states.idle && sprite_index != scaredspr))
		{
			sprite_index = spr_kentukykenny_throw;
			image_index = 0;
			image_xscale = -sign(x - targetplayer.x);
			state = states.pizzagoblinthrow;
		}
	}
}
if boundbox == 0
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index;
		mask_index = other.sprite_index;
		baddieID = other.id;
		other.boundbox = true;
	}
}
