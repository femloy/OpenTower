if room == rm_editor
	exit;
var palinfo = get_pep_palette_info();
spr_palette = palinfo.spr_palette;
paletteselect = palinfo.paletteselect;
targetplayer = obj_player1.id;
if !pizzahead
	wastedhits = 6 - elitehit;
else
	wastedhits = 4 - elitehit;
if phase == 2
	formed = true;
if (!pizzahead || elitehit > 1)
	destroyable = false;
switch state
{
	case states.arenaintro:
		scr_fakepepboss_arenaintro();
		break;
	case states.walk:
		scr_fakepepboss_walk();
		break;
	case states.deformed:
		scr_fakepepboss_deformed();
		break;
	case states.staggered:
		scr_fakepepboss_staggered();
		break;
	case states.grabdash:
		scr_fakepepboss_grabdash();
		break;
	case states.grabthrow:
		scr_fakepepboss_grabthrow();
		break;
	case states.jump:
		scr_fakepepboss_jump();
		break;
	case states.freefall:
		scr_fakepepboss_freefall();
		break;
	case states.mach2:
		scr_fakepepboss_mach2();
		break;
	case states.Sjumpprep:
		scr_fakepepboss_Sjumpprep();
		break;
	case states.Sjump:
		scr_fakepepboss_Sjump();
		break;
	case states.throwing:
		scr_fakepepboss_throwing();
		break;
	case states.backbreaker:
		scr_fakepepboss_backbreaker();
		break;
	case states.pizzaheadjump:
		scr_boss_pizzaheadjump();
		break;
	case states.KO:
		scr_boss_pizzaheadKO();
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
}
boss_update_pizzaheadKO(spr_bossfight_fakepephp, spr_bossfight_fakepeppalette);
if phase == 2 && state != states.stun && state != states.deformed
{
	if deformed_cooldown > 0
		deformed_cooldown--;
	else
		scr_fakepepboss_do_projectiles(phase - 1, wastedhits);
}
if state == states.Sjump
{
	if (!instance_exists(hitboxID))
	{
		with (instance_create(x, y, obj_forkhitbox))
		{
			ID = other.id;
			other.hitboxID = id;
			sprite_index = other.sprite_index;
		}
	}
}
if state == states.stun
{
	stunned = 100;
	cooldown = 0;
	if thrown
	{
		formed = false;
		deformedtimer = 480;
	}
}
if flashbuffer > 0
	flashbuffer--;
boss_hurt_gustavo();
if state == states.jump
	grav = 0.4;
else
	grav = 0.5;
if state == states.stun
	instance_destroy(obj_grabmarker);
if (instance_exists(obj_player1))
{
	if (!obj_player1.ispeppino || global.swapmode)
		instance_destroy(obj_grabmarker);
}
if prevhp != elitehit
{
	if elitehit < prevhp
	{
		instance_destroy(obj_grabmarker);
		if (irandom(100) <= 25)
			fmod_event_one_shot_3d("event:/sfx/voice/fakepepnegative", x, y);
		pizzahead_subhp = pizzahead_maxsubhp;
		currentprojectile = 0;
		subhp = maxsubhp;
		var timer = fakepep_get_attack(phase - 1, wastedhits).deformed_timer;
		var attack = fakepep_get_projectile(phase - 1, wastedhits, currentprojectile);
		state = states.walk;
		if phase == 1
			formed = false;
		deformed_cooldown = attack.cooldown;
		deformed_timer = timer;
		deformed_dir = 1;
		global.playerhit++;
		boss_do_pizzaheadKO();
		if phase == 2
		{
			touchedground = false;
			hsp += (-image_xscale * 5);
			flickertime = 11;
			alarm[6] = 5;
		}
		if (global.playerhit >= 3 && (pizzahead || phase != 2 || wastedhits < 6))
		{
			global.playerhit = 0;
			instance_create(obj_player1.x, -15, obj_hppickup);
		}
	}
	prevhp = elitehit;
}
if wastedhits >= 6 && !pizzahead
{
	if phase == 1
	{
		if formed
		{
			elitehit = 6;
			wastedhits = 0;
			phase = 2;
			create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
			fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
			with obj_camera
			{
				shake_mag = 3;
				shake_mag_acc = 5 / room_speed;
			}
			var lay2 = layer_get_id("Backgrounds_2");
			var lay3 = layer_get_id("Backgrounds_1");
			var bg2 = layer_background_get_id(lay2);
			alarm[7] = 5;
			layer_set_visible(lay3, true);
			layer_background_change(bg2, bg_fakepeppino_phase2)
			scr_sleep(25);
		}
	}
	else if (phase == 2 && instance_exists(obj_fakepepsolid))
	{
		fmod_event_one_shot("event:/sfx/fakepep/chasebegin");
		visible = false;
		phase = 3;
		elitehit = 5;
		create_particle(x, y, particle.genericpoofeffect);
		instance_destroy(obj_fakepepsolid);
		with obj_hppickup
		{
			scr_collect_hat(true)
			instance_destroy()
		}
		lay2 = layer_get_id("Backgrounds_Ring");
		bg2 = layer_background_get_id(lay2);
		layer_background_change(bg2, spr_fakepeppino_arena2)
	}
}
if state == states.stun
{
	if thrown
		savedthrown = true;
	if grounded && vsp > 0 && savedthrown
	{
		stunned = 1;
		idle_timer = 1;
		ammo = 6;
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
if !visible
	invincible = true;
if state == states.KO
	invincible = true;
if pizzahead
{
	with obj_gustavograbbable
	{
		if (enemy_is_superslam(id) || enemy_is_swingding(id))
			other.invincible = true;
	}
}
if !invincible && !flash && alarm[5] < 0
	alarm[5] = 0.15 * room_speed;
else if invincible && state != states.staggered && flashbuffer <= 0
	flash = false;
if ((state == states.grabdash || (state == states.mach2 && attackspeed >= 10) || (state == states.throwing && sprite_index == spr_fakepeppino_flailing && attackspeed > 4) || state == states.freefall) && alarm[4] < 0)
	alarm[4] = 10;
mask_index = spr_player_mask;
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
if staggerbuffer > 0
{
	staggerbuffer--;
	if alarm[9] == -1
		alarm[9] = 5;
}
scr_fakepep_update_sounds();
var n = instance_number(obj_fakepepclone) / 10;
if n > 1
	n = 1;
fmod_set_parameter("clones", n, true);
