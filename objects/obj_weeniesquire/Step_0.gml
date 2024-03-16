if room == rm_editor
	exit;
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
	case states.punch:
		hsp = image_xscale * chargespeed;
		if chargespeed < 24
			chargespeed += 0.3;
		with obj_destructibles
		{
			if (place_meeting(x - other.hsp, y, other))
				instance_destroy();
		}
		if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_slope))
		{
			state = states.stun;
			stunned = 80;
			hsp = -8 * image_xscale;
			vsp = -5;
		}
		break;
}
if state == states.walk && grounded && vsp > 0
	hsp = 0;
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
var player = instance_nearest(x, y, obj_player);
var check = player.x > (x - 300) && player.x < (x + 300);
if (state == states.walk && check && y <= (player.y + 60) && y >= (player.y - 60) && state != states.punch && chargebuffer <= 0)
{
	state = states.punch;
	flash = true;
	sprite_index = spr_weeniesquire_charge;
	chargebuffer = 80;
	chargespeed = 6;
	hitboxcreate = true;
	with (instance_create(x, y, obj_forkhitbox))
	{
		ID = other.id;
		sprite_index = spr_weeniesquire_hitbox;
	}
	if x != player.x
		image_xscale = sign(player.x - x);
}
if state != states.punch && chargebuffer > 0
	chargebuffer--;
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
