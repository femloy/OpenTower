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
	case states.pizzaheadjump:
		scr_enemy_pizzaheadjump();
		break;
	case states.bump:
		sprite_index = spr_badrat_stun;
		if grounded && vsp > 0
		{
			state = states.walk;
			sprite_index = walkspr;
		}
		break;
}
var targetplayer = instance_nearest(x, y, obj_player);
if cooldown > 0
	cooldown--;
if state == states.walk && cooldown <= 0
{
	if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > (y - 50) && targetplayer.y < (y + 50))
	{
		state = states.pizzagoblinthrow;
		sprite_index = spr_badrat_attack1;
		image_index = 0;
		if x != targetplayer.x
			image_xscale = sign(targetplayer.x - x);
	}
}
if state == states.pizzagoblinthrow
{
	var mv = 8;
	image_speed = 0.35;
	if sprite_index == spr_badrat_attack1
	{
		hsp = 0;
		if floor(image_index) == image_number - 1
		{
			fmod_event_one_shot_3d("event:/sfx/enemies/badrat", x, y);
			sprite_index = spr_badrat_attack2;
			cooldown = 30;
		}
	}
	else if sprite_index == spr_badrat_attack2
	{
		if alarm[4] == -1
			alarm[4] = 5;
		hsp = image_xscale * mv;
		if (!instance_exists(hitboxID))
		{
			hitboxID = instance_create(x, y, obj_forkhitbox);
			hitboxID.ID = id;
		}
		if cooldown > 0
			cooldown--;
		else if (grounded || (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope)))
			sprite_index = spr_badrat_attack2end;
	}
	else if sprite_index == spr_badrat_attack2end
	{
		if alarm[4] == -1
			alarm[4] = 5;
		hsp = image_xscale * mv;
		if floor(image_index) == image_number - 1
			sprite_index = spr_badrat_attack3;
	}
	else
	{
		hsp = Approach(hsp, 0, 0.2);
		if floor(image_index) == image_number - 1
		{
			sprite_index = walkspr;
			state = states.walk;
			instance_destroy(hitboxID);
			cooldown = 80;
		}
	}
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
if (place_meeting(x, y, obj_canonexplosion))
	instance_destroy();
scr_scareenemy();
if state != states.grabbed
	depth = 0;
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
if state != states.stun
	thrown = false;
