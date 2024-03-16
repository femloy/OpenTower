if room == rm_editor
	exit;
targetplayer = obj_player1.id;
switch state
{
	case states.idle:
		scr_enemy_idle();
		break;
	case states.turn:
		scr_enemy_turn();
		break;
	case states.walk:
		x = -200;
		y = -200;
		if (!instance_exists(obj_pf_fakepepgianthead))
		{
			if fakepepspawn > 0
				fakepepspawn--;
			else
			{
				fakepepspawn = 200 + irandom(100);
				instance_create(x, y, obj_pf_fakepepgianthead);
			}
		}
		if elitehit < 4
		{
			if clonespawn > 0
				clonespawn--;
			else
			{
				clonespawn = 150 - (elitehit * 5);
				if (instance_number(obj_fakepepclone) < 5)
				{
					var i = irandom(4);
					fakepep_start_projectiles(0, 0);
					switch i
					{
						case 1:
							fakepep_add_machclone(0, 0, choose(-1, 1), 30, true);
							break;
						case 2:
							fakepep_add_superjumpclones(0, 0, choose(-1, 1), 5, 10, irandom_range(1, 9), 30);
							break;
						case 3:
							fakepep_add_flailingclone(0, 0, choose(-1, 1), 45);
							break;
						case 4:
							fakepep_add_tauntclones(0, 0, -12, -14, 80);
							break;
						default:
							fakepep_add_grabclone(0, 0, choose(-1, 1), 80);
							break;
					}
					currentprojectile = 0;
					scr_fakepepboss_do_projectiles(0, 0);
				}
			}
		}
		if junkspawn > 0
			junkspawn--;
		else
		{
			var b = choose(20, room_width - 20);
			with (instance_create(b, 402, obj_peppinoclone))
			{
				create_particle(x, y, particle.genericpoofeffect);
				if (x > (room_width / 2))
					image_xscale = -1;
				else
					image_xscale = 1;
			}
			junkspawn = 100;
		}
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
		scr_boss_grabbed();
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
	case states.transition:
		if floor(image_index) == image_number - 1
			state = states.walk;
		break;
}
if prevhp != elitehit
{
	prevhp = elitehit;
	sprite_index = spr_fakepeppino_deform;
	image_index = 0;
	state = states.transition;
	hsp = 0;
}
if state == states.stun && stunned > 100 && birdcreated == 0
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if state != states.stun
	birdcreated = false;
if state == states.stun && thrown
	stunned = 10;
if state == states.stun && !thrown
	invincible = false;
else
	invincible = true;
if !invincible && !flash && alarm[5] == -1
	alarm[5] = 10;
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
