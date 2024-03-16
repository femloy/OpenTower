targetplayer = obj_player1.id;
image_speed = 0.35;
wastedhits = 8 - elitehit;
switch state
{
	case states.fall:
		scr_pizzaface_p2_fall();
		break;
	case states.walk:
		scr_pizzaface_p2_normal();
		break;
	case states.pizzahead_fishing:
		scr_pizzaface_p2_fishing();
		break;
	case states.pizzahead_look:
		scr_pizzaface_p2_look();
		break;
	case states.pizzahead_pullinglevel:
		boss_pizzahead_pullinglevel();
		break;
	case states.throwing:
		boss_pizzahead_throwing();
		break;
	case states.pizzahead_portraitthrow:
		boss_pizzahead_portraitthrow();
		break;
	case states.shotgun:
		boss_pizzahead_shotgun();
		break;
	case states.animation:
		boss_pizzahead_pinup();
		break;
	case states.phase1hurt:
		boss_pizzahead_p2_phase1hurt();
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
}
if (obj_player1.state != states.actor && obj_player1.y >= (y - 20) && obj_player1.state != states.animation && state != states.hit && state != states.stun && state != states.phase1hurt && hsp == 0 && state != states.fall)
{
	if ((x > (room_width / 2) && obj_player1.x >= (x - 60)) || (x <= (room_width / 2) && obj_player1.x <= (x + 60)))
	{
		with obj_player
		{
			if state != states.tackle
			{
				var ix = (x > (room_width / 2)) ? 1 : -1;
				xscale = ix;
				sprite_index = spr_bump;
				hsp = -xscale * 8;
				movespeed = abs(hsp);
				vsp = -7;
				state = states.tackle;
				grounded = false;
				fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
				instance_create(x, y, obj_bumpeffect);
			}
		}
	}
}
if prevhp != elitehit
{
	if elitehit < prevhp
	{
		instance_destroy(obj_pizzaheadswordstone);
		if lastattack != -1 && lastattack != pizzaface_p2_attacks.pinup
			movecount[lastattack] += 1;
		bullethit = 0;
		if elitehit <= 0
			instance_destroy();
		global.playerhit++;
		if global.playerhit >= 3
		{
			global.playerhit = 0;
			instance_create(obj_player1.x, -15, obj_hppickup);
		}
		if wastedhits >= 3 && elitehit > 0
			instance_create_unique(room_width / 2, -200, obj_pizzahead_haywire);
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
if state == states.stun && savedthrown == thrown && !savedthrown
	invincible = false;
else
	invincible = true;
if state == states.pizzaface_ram && alarm[4] < 0
	alarm[4] = 6;
mask_index = spr_pizzahead_idle;
if state == states.stun && thrown
{
	while (place_meeting(x, y, obj_solid))
		y--;
}
if state != states.stun
	birdcreated = false;
if flash == 1 && alarm[2] <= 0
	alarm[2] = 0.15 * room_speed;
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
scr_pizzaface_p2_update_sounds();
