if room == rm_editor
	exit;
switch state
{
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
	case states.rage:
		scr_enemy_rage();
		break;
	case states.underground:
		var player = instance_nearest(x, y, obj_player);
		hsp = 0;
		if underground
		{
			if vsp < 0
				vsp = 0;
			sprite_index = spr_minijohn_underground;
			visible = false;
			if (player.x > (x - 80) && player.x < (x + 80) && y <= (player.y + 60) && y >= (player.y - 60) && (player.state == states.freefallland || player.sprite_index == player.spr_piledriverland || (player.state == states.ratmountbounce && player.vsp > 0)))
			{
				fmod_event_one_shot_3d("event:/sfx/enemies/treasureguy", x, y);
				notification_push(notifs.treasureguy_unbury, [room, object_index, id]);
				underground = false;
				visible = true;
				if player.x != x
					image_xscale = sign(x - player.x);
				sprite_index = spr_treasureguy_stun;
				vsp = -4;
				repeat 3
					create_debris(x, y, spr_debris);
			}
		}
		else if grounded && vsp > 0
		{
			state = states.walk;
			sprite_index = idlespr;
		}
		break;
}
if state == states.underground
{
	parryable = false;
	supertauntable = false;
}
else
{
	parryable = true;
	supertauntable = true;
}
if state == states.stun && stunned > 100 && birdcreated == 0
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if state == states.stun && thrown
	sprite_index = stunfallspr;
if state != states.stun
	birdcreated = false;
if flash == 1 && alarm[2] <= 0
	alarm[2] = 0.15 * room_speed;
targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1;
if state == states.walk
{
	sprite_index = walkspr;
	hsp = 0;
}
if state == states.idle
{
	if sprite_index == scaredspr
	{
		if (image_index > image_number - 1)
			state = states.chase;
	}
	else
	{
		sprite_index = spr_treasureguy_idle;
		image_speed = 0.35;
	}
}
if state != states.idle && state != states.underground && state != states.grabbed && state != states.hit && state != states.stun && state != states.chase && !running
{
	if ((x < (targetplayer.x + threshold_x) && x > (targetplayer.x - threshold_x)) && (y < (targetplayer.y + threshold_y) && y > (targetplayer.y - threshold_y)))
	{
		state = states.idle;
		image_index = 0;
		sprite_index = scaredspr;
		scaredbuffer = scared_max;
		if x != targetplayer.x
			image_xscale = sign(x - targetplayer.x);
	}
}
if state == states.chase
{
	image_speed = 0.5;
	if hsp != 0
		sprite_index = spr_treasureguy_escape;
	else
		sprite_index = spr_treasureguy_escape;
	if runmovespeed < runmovespeed_max
		runmovespeed += accel;
	else
		runmovespeed = runmovespeed_max;
	hsp = image_xscale * runmovespeed;
	if grounded
	{
		if (scr_solid(x + sign(hsp), y) && (!place_meeting(x + sign(hsp), y, obj_slope) || place_meeting(x + sign(hsp), y - 4, obj_slope)))
		{
			if !jumped
			{
				vsp = -11;
				jumped = true;
			}
			else
			{
				runmovespeed = 0;
				image_xscale *= -1;
				jumped = false;
			}
		}
		else
			jumped = false;
	}
	if (distance_to_object(targetplayer) > idle_threshold)
		state = states.walk;
}
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
if state == states.underground
{
	invincible = true;
	if sprite_index != spr_minijohn_underground && sprite_index != spr_minijohn_undergroundout
		image_blend = c_gray;
}
else
{
	invincible = false;
	image_blend = c_white;
}
