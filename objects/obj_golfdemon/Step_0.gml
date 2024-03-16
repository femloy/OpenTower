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
	case states.chase:
		scr_enemy_chase();
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
}
if (state == states.walk || state == states.idle)
{
	if sprite_index != spr_golfdemon_idle2
		sprite_index = spr_golfdemon_idle;
}
if state == states.stun && stunned > 100 && birdcreated == 0
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if ragecooldown > 0
	ragecooldown--;
if state != states.stun
	birdcreated = false;
if flash == 1 && alarm[2] <= 0
	alarm[2] = 0.15 * room_speed;
if state != states.chase
	momentum = 0;
if (state == states.walk || state == states.idle)
{
	var targetplayer = instance_nearest(x, y, obj_player);
	if (sprite_index != spr_golfdemon_idle2 && targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > (y - 200) && targetplayer.y < (y + 200))
	{
		fmod_event_one_shot_3d("event:/sfx/enemies/demonsuprise", x, y);
		sprite_index = spr_golfdemon_idle2;
		image_index = 0;
	}
	if (sprite_index == spr_golfdemon_idle2 && floor(image_index) == image_number - 1)
	{
		idle = false;
		movespeed = 6;
		if targetplayer.x != x
			image_xscale = -sign(x - targetplayer.x);
		alarm[5] = 30;
		state = states.chase;
		sprite_index = spr_golfdemon_charge;
	}
}
if state == states.chase
{
	if !fmod_event_instance_is_playing(snd)
		fmod_event_instance_play(snd);
	fmod_event_instance_set_3d_attributes(snd, x, y);
	
	snd_count = 0;
	with obj_golfdemon
	{
		if (point_in_camera(x, y, view_camera[0]) && fmod_event_instance_is_playing(snd))
			other.snd_count++;
	}
	fmod_event_instance_set_parameter(snd, "count", snd_count, true);
}
else
	fmod_event_instance_stop(snd, true);
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
if state != states.chase && state != states.hit
	invincible = false;
if state == states.chase
	invincible = true;
