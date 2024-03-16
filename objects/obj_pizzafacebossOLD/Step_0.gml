targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1;
if obj_bosscontroller.state == states.arenaintro
	exit;
if hp <= 0 && state != states.arenaround && state != states.fistmatch
{
	if !thrown && !destroyable
		boss_destroy(lastplayerid);
}
image_speed = 0.35;
if knightbuffer > 0
	knightbuffer--;
switch phase
{
	case 0:
		normal_func = boss_pizzaface_phase1normal;
		break;
	case 1:
		normal_func = boss_pizzahead_phase2normal;
		break;
	case 2:
		normal_func = boss_pizzahead_phase3normal;
		break;
}
switch state
{
	case states.arenaround:
		grav = 0.5;
		break;
	case states.normal:
		grav = 0.5;
		normal_func();
		break;
	case states.pizzaface_ram:
		grav = 0.5;
		boss_pizzaface_ram();
		break;
	case states.pizzaface_moustache:
		grav = 0.5;
		boss_pizzaface_moustache();
		break;
	case states.pizzaface_eyes:
		grav = 0.5;
		boss_pizzaface_eyes();
		break;
	case states.pizzaface_mouth:
		grav = 0.5;
		boss_pizzaface_mouth();
		break;
	case states.pizzaface_nose:
		grav = 0.5;
		boss_pizzaface_nose();
		break;
	case states.pizzaface_phase2transition:
		boss_pizzaface_phase2transition();
		break;
	case states.pizzahead_look:
		boss_pizzahead_look();
		break;
	case states.pizzahead_fishing:
		boss_pizzahead_fishing();
		break;
	case states.pizzahead_bombrun:
		boss_pizzahead_bombrun();
		break;
	case states.pizzahead_npcthrow:
		boss_pizzahead_npcthrow();
		break;
	case states.pizzahead_portraitthrow:
		boss_pizzahead_portraitthrow();
		break;
	case states.pizzahead_enguarde:
		boss_pizzahead_enguarde();
		break;
	case states.pizzahead_sexypicture:
		boss_pizzahead_sexypicture();
		break;
	case states.pizzahead_pullinglevel:
		boss_pizzahead_pullinglevel();
		break;
	case states.pizzahead_eat:
		boss_pizzahead_eat();
		break;
	case states.pizzahead_surprisebox:
		boss_pizzahead_surprisebox();
		break;
	case states.pizzahead_spinningrun:
		boss_pizzahead_spinningrun();
		break;
	case states.pizzahead_spinningkick:
		boss_pizzahead_spinningkick();
		break;
	case states.pizzahead_spinningpunch:
		boss_pizzahead_spinningpunch();
		break;
	case states.pizzahead_groundpunch:
		boss_pizzahead_groundpunch();
		break;
	case states.pizzahead_bigkick:
		boss_pizzahead_bigkick();
		break;
	case states.pizzahead_slamhead:
		boss_pizzahead_slamhead();
		break;
	case states.pizzahead_slamhead2:
		boss_pizzahead_slamhead2();
		break;
	case states.walk:
		grav = 0.5;
		if grounded
			state = states.normal;
		invincible = true;
		inv_timer = 2;
		break;
	case states.chainsaw:
		grav = 0.5;
		state_boss_chainsaw();
		break;
	case states.backbreaker:
		grav = 0.5;
		state_boss_taunt();
		invincible = true;
		inv_timer = 2;
		break;
	case states.parry:
		grav = 0.5;
		state_boss_parry();
		invincible = true;
		inv_timer = 2;
		break;
	case states.hit:
		grav = 0.5;
		scr_enemy_hit();
		stunned = 30;
		break;
	case states.stun:
		grav = 0.5;
		state_boss_stun();
		break;
}
if phase == 0 && state != states.pizzaface_ram
	invincible = true;
else
	invincible = false;
attacking = state == states.pizzaface_ram || state == states.pizzaface_nose || state == states.pizzahead_spinningkick || state == states.pizzahead_spinningpunch || state == states.pizzahead_groundpunch || state == states.pizzahead_slamhead || state == states.pizzahead_slamhead2;
colliding = state != states.pizzaface_ram;
if phase > 0
{
	mask_index = spr_pizzahead_giddy;
	stunfallspr = spr_pizzahead_giddy;
	walkspr = spr_pizzahead_giddy;
}
