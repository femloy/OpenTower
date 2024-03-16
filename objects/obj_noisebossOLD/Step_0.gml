targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1;
if hp <= 0 && state != states.arenaround
{
	if !destroyed && !thrown && !destroyable
		boss_destroy(lastplayerid);
}
if chooseparry_buffer > 0
	chooseparry_buffer--;
if ((state == states.handstandjump || state == states.crouchslide || state == states.skateboardturn || state == states.jetpack || state == states.jetpackspin || (state == states.pogo && pogochargeactive) || state == states.skateboard) && alarm[0] <= 0)
	alarm[0] = 6;
switch state
{
	case states.arenaround:
		grav = 0.5;
		state_boss_arenaround();
		movespeed = 0;
		inv_timer = 2;
		invincible = true;
		break;
	case states.normal:
		grav = 0.5;
		boss_noise_normal();
		break;
	case states.bump:
		grav = 0.5;
		state_boss_bump();
		break;
	case states.handstandjump:
		grav = 0.5;
		boss_noise_handstandjump();
		break;
	case states.crouchslide:
		grav = 0.5;
		boss_noise_crouchslide();
		break;
	case states.skateboard:
		grav = 0.5;
		boss_noise_skateboard();
		break;
	case states.skateboardturn:
		grav = 0.5;
		boss_noise_skateboardturn();
		break;
	case states.jump:
		grav = 0.5;
		boss_noise_jump();
		break;
	case states.throwing:
		grav = 0.5;
		boss_noise_throwing();
		break;
	case states.pogo:
		grav = 0.5;
		boss_noise_pogo();
		break;
	case states.jetpackstart:
		grav = 0.5;
		boss_noise_jetpackstart();
		break;
	case states.jetpack:
		grav = 0.5;
		boss_noise_jetpack();
		break;
	case states.jetpackspin:
		grav = 0.5;
		boss_noise_jetpackspin();
		break;
	case states.walk:
		grav = 0.5;
		state_boss_walk(boss_noise_do_attack);
		inv_timer = 2;
		invincible = true;
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
		stunned = targetstunned;
		break;
	case states.stun:
		grav = 0.5;
		state_boss_stun();
		break;
}
angry = phase > 6;
attacking = state == states.handstandjump || state == states.crouchslide || state == states.skateboard || state == states.skateboardturn || state == states.pogo || state == states.jetpackstart || state == states.jetpack || state == states.jetpackspin || state == states.throwing;
