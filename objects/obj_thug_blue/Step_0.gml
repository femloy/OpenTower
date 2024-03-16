event_inherited();
if room == rm_editor
	exit;
var targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1;
if bombreset > 0
	bombreset--;
if state == states.walk
{
	if !chasing
	{
		targetplayer = instance_nearest(x, y, obj_player);
		if ((targetplayer.x > (x - 1900) && targetplayer.x < (x + 1900)) && (y <= (targetplayer.y + 540) && y >= (targetplayer.y - 540)))
		{
			chasing = true;
			if x != targetplayer.x
				image_xscale = -sign(x - targetplayer.x);
			image_index = 0;
			sprite_index = spr_shrimp_knife;
			state = states.pizzagoblinthrow;
			bombreset = 0;
			hsp = 0;
		}
	}
	else
	{
		state = states.chase;
		sprite_index = walkspr;
		image_index = 0;
	}
}
else if state == states.chase
{
	if sprite_index == spr_shrimp_throw
		sprite_index = spr_shrimp_walk;
	move = sign(targetplayer.x - x);
	if move != 0
		image_xscale = move;
	if chasespeed < 4
		chasespeed += 0.25;
	if (abs(x - targetplayer.x) < 230)
	{
		hsp = -move * chasespeed;
		if move != 0 && move != -dir
			movespeed = 2;
	}
	else if (abs(x - targetplayer.x) > 240)
	{
		hsp = move * chasespeed;
		if move != 0 && move != dir
			chasespeed = 2;
	}
	else
	{
		hsp = 0;
		chasespeed = 0;
	}
	var inst_front = collision_line(x, y + 25, x + (sign(hsp) * 78), y + 25, obj_solid, false, true);
	if bombreset == 0
	{
		if ((targetplayer.x > (x - attackthreshold_x) && targetplayer.x < (x + attackthreshold_x)) && (targetplayer.y > (y - attackthreshold_y) && targetplayer.y < (y + attackthreshold_y)) && (inst_front == noone || (inst_front != -4 && x > inst_front.x && targetplayer.x > inst_front.x) || (inst_front != -4 && x < inst_front.x && targetplayer.x < inst_front.x)))
		{
			state = states.charge;
			hsp = 0;
			attack_count = attack_max;
		}
	}
	var inst_down = collision_line(x + (sign(hsp) * 16), y, x + (sign(hsp) * 16), y + 64, obj_solid, false, true);
	var inst_down2 = collision_line(x + (sign(hsp) * 16), y, x + (sign(hsp) * 16), y + 64, obj_platform, false, true);
	var inst_up = collision_line(x + (sign(hsp) * 96), y + 25, x + (sign(hsp) * 96), (y - 78) + 50, obj_platform, false, true);
	if (image_index > image_number - 1)
	{
		if sprite_index == spr_shrimp_jump
		{
			sprite_index = spr_shrimp_fall;
			image_index = 0;
		}
		else if sprite_index == spr_shrimp_land
		{
			sprite_index = spr_shrimp_walk;
			image_index = 0;
		}
	}
	if grounded && sprite_index == spr_shrimp_fall
	{
		sprite_index = spr_shrimp_land;
		image_index = 0;
	}
	if (((inst_front != -4 || inst_up != -4) || (inst_down == noone && inst_down2 == noone)) && targetplayer.y <= (y + 32) && grounded && state != states.charge)
	{
		vsp = -11;
		sprite_index = spr_shrimp_jump;
		image_index = 0;
		hsp = image_xscale * chasespeed;
	}
}
if state == states.charge
{
	if attack_count > 0
		attack_count--;
	else
	{
		image_index = 0;
		sprite_index = spr_shrimp_knife;
		bombreset = 0;
		state = states.pizzagoblinthrow;
		hsp = 0;
	}
}
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
		chasing = true;
		scr_enemy_stun();
		break;
	case states.pizzagoblinthrow:
		scr_pizzagoblin_throw();
		break;
	case states.grabbed:
		chasing = true;
		scr_enemy_grabbed();
		break;
	case states.rage:
		scr_enemy_rage();
		break;
}
if state == states.stun && stunned > 100 && birdcreated == 0
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if sprite_index == scaredspr && state == states.idle
	invincible = false;
if state != states.stun
	birdcreated = false;
if flash == 1 && alarm[2] == -1
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
