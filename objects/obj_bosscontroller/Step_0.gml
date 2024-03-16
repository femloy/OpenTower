switch state
{
	case states.arenaintro:
		scr_bosscontroller_intro();
		break;
	case states.normal:
		scr_bosscontroller_normal();
		break;
	case states.victory:
		scr_bosscontroller_victory();
		break;
}
if !round_timer_init
{
	round_timer = round_timermax;
	round_timer_init = true;
}
player_index += 0.35;
boss_index += 0.35;
player_index = wrap(player_index, 0, sprite_get_number(player_hpsprite));
boss_index = wrap(boss_index, 0, sprite_get_number(boss_hpsprite));
if room == boss_vigilante
{
	if ((instance_exists(obj_vigilanteboss) && obj_vigilanteboss.state == states.duel) || instance_exists(obj_vigilante_duelintro))
		image_alpha = 0;
	else
		image_alpha = Approach(image_alpha, 1, 0.1);
	with obj_targetguy
		image_alpha = other.image_alpha;
	with obj_hppickup
		image_alpha = other.image_alpha;
}
