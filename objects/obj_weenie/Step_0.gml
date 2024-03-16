if room == rm_editor
	exit;
if state != states.stun && state != states.tumble
	stunstate = 0;
else if state == states.stun
{
	if stunstate == 0 && stunned > 50 && grounded
	{
		stunstate = 1;
		stunned = 0;
		state = states.tumble;
		stuntimer = stunmax;
	}
}
invincible = state == states.tumble;
switch state
{
	case states.idle:
		scr_enemy_idle();
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
	case states.pummel:
		scr_enemy_pummel();
		break;
	case states.staggered:
		scr_enemy_staggered();
		break;
	case states.rage:
		scr_enemy_rage();
		break;
	case states.ghostpossess:
		scr_enemy_ghostpossess();
		break;
	case states.tumble:
		grav = 0.5;
		sprite_index = spr_sausagemannocigar_rolling;
		hsp = image_xscale * 7;
		angle = 0;
		if (scr_solid(x + sign(hsp), y) && (!place_meeting(x, y + 1, obj_slope) || place_meeting(x + sign(hsp), y - 5, obj_solid)))
			image_xscale *= -1;
		if stuntimer > 0
			stuntimer--;
		else
			state = states.stun;
		if (!instance_exists(hitboxID))
		{
			hitboxID = instance_create(x, y, obj_weeniehitbox);
			hitboxID.baddieID = id;
		}
		break;
}
if state == states.stun && stunned > 100 && birdcreated == 0
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if state != states.stun
	birdcreated = false;
if flash == 1 && alarm[2] <= 0
	alarm[2] = 0.15 * room_speed;
scr_scareenemy();
if state != states.grabbed
	depth = 0;
if state != states.stun
	thrown = false;
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
