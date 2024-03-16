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
if state == states.stun && stunned > 40 && birdcreated == 0
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if state != states.stun
	birdcreated = false;
idlespr = spr_cheeserobot_idle;
stunfallspr = spr_cheeserobot_stun;
walkspr = spr_cheeserobot_walk;
stunspr = spr_cheeserobot_stun;
grabbedspr = spr_cheeserobot_stun;
if flash == 1 && alarm[2] <= 0
	alarm[2] = 0.15 * room_speed;
if hp <= 0
	instance_destroy();
if state != states.grabbed
	depth = 0;
if state != states.stun
	thrown = false;
if bombreset > 0
	bombreset--;
if x != obj_player.x && state != states.pizzagoblinthrow && bombreset == 0
{
	if ((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 20) && y >= (obj_player.y - 20)))
	{
		if (state == states.walk || state == states.idle)
		{
			image_index = 0;
			image_xscale = -sign(x - obj_player.x);
			state = states.pizzagoblinthrow;
		}
	}
}
