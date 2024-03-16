targetplayer = obj_player1.id;
wastedhits = 8 - elitehit;
destroyable = false;
switch state
{
	case states.arenaintro:
		scr_pizzaface_arenaintro();
		break;
	case states.walk:
		scr_pizzaface_normal();
		break;
	case states.pizzaface_ram:
		scr_pizzaface_ram();
		break;
	case states.transition:
		scr_pizzaface_transitioncutscene();
		break;
	case states.phase1hurt:
		lasthit = true;
		scr_boss_phase1hurt();
		sprite_index = spr_pizzaface_hurt;
		image_speed = 0.35;
		break;
	case states.hit:
		scr_enemy_hit();
		break;
	case states.stun:
		scr_enemy_stun();
		break;
	case states.grabbed:
		scr_boss_grabbed();
		break;
	case states.pummel:
		scr_enemy_pummel();
		break;
	case states.staggered:
		scr_enemy_staggered();
		break;
}
if superslambuffer > 0
	superslambuffer--;
if state != states.walk
	on_y = true;
if prevhp != elitehit
{
	if elitehit < prevhp
	{
		baddie_range++;
		cooldown = 0;
		attackbuffer = 0;
		touchedground = false;
		hsp += (-image_xscale * 5);
		flickertime = 11;
		attackbuffer += 40;
		on_y = false;
		alarm[6] = 5;
		global.playerhit++;
		if global.playerhit >= 3
		{
			global.playerhit = 0;
			instance_create(obj_player1.x, -15, obj_hppickup);
		}
		if elitehit <= 0
		{
			with obj_music
				fmod_event_instance_set_parameter(music.event, "state", 1, true);
			instance_destroy(obj_forkhitbox);
			instance_destroy(obj_spitcheesespike);
			instance_destroy(obj_banditochicken_dynamite);
			instance_destroy(obj_banditochicken_projectile);
			state = states.transition;
			substate = states.animation;
			introbuffer = 100;
			flickertime = 0;
			elitehit = 0;
			on_y = true;
			image_alpha = 1;
			with (instance_create(0, 0, obj_pizzahead_whitefade))
				deccel = 0.1;
			with obj_player1
			{
				hsp = 0;
				vsp = 0;
				xscale = 1;
				movespeed = 0;
				image_index = 0;
				sprite_index = spr_player_gnomecutscene1;
				if !ispeppino
					sprite_index = spr_noisebossintro2;
				image_speed = 0.35;
				state = states.actor;
				x = roomstartx;
				y = roomstarty;
			}
			x = room_width / 2;
			y = obj_player1.y - 100;
			sprite_index = spr_pizzahead_intro1;
			with obj_baddie
			{
				if object_index != obj_pizzafaceboss && object_index != obj_pizzafaceboss_p2
					instance_destroy();
			}
		}
	}
	prevhp = elitehit;
}
if state == states.stun
{
	if thrown
		savedthrown = true;
	if grounded && vsp > 0 && savedthrown
	{
		stunned = 1;
		idle_timer = 1;
	}
}
else
	savedthrown = false;

if state == states.stun && stunned > 100 && birdcreated == 0
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}

var _inv = (state == states.stun && savedthrown == thrown && !savedthrown) || (!obj_player1.ispeppino && state == states.pizzaface_ram && substate == states.land);
if _inv && elitehit > 1
	invincible = false;
else
	invincible = true;

if ((!invincible || (_inv && elitehit == 1)) && !flash && alarm[5] < 0)
	alarm[5] = 0.15 * room_speed;
else if (invincible && (state != states.stun || (savedthrown != thrown && savedthrown) || elitehit > 1) && (state != states.pizzaface_ram || substate != states.land))
	flash = false;

if ((state == states.pizzaface_ram && substate != states.transition) && alarm[4] < 0)
	alarm[4] = 6;
if state != states.stun
	birdcreated = false;
if flash == 1 && alarm[2] <= 0
	alarm[2] = 0.15 * room_speed;

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
mask_index = spr_pizzaface;
scr_pizzaface_update_sounds();
