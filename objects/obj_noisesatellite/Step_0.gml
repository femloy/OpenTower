switch (state)
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
		scr_enemy_stun();
		break;
	case states.grabbed:
		scr_enemy_grabbed();
		break;
}
if (!instance_exists(obj_slaphitbox))
	slapped = false;
stunned = 100;
if (cigar == 0)
{
	landspr = spr_noisesatellite;
	idlespr = spr_noisesatellite;
	fallspr = spr_noisesatellite;
	hitceillingspr = spr_noisesatellite;
	stunfalltransspr = spr_noisesatellite;
	hitwallspr = spr_noisesatellite;
	stunfallspr = spr_noisesatellitestun;
	rollingspr = spr_noisesatellite;
	walkspr = spr_noisesatellite;
	turnspr = spr_noisesatellite;
	flyingspr = spr_noisesatellite;
	hitspr = spr_noisesatellite;
	stunlandspr = spr_noisesatellite;
	stunspr = spr_noisesatellite;
	recoveryspr = spr_noisesatellite;
	stompedspr = spr_noisesatellite;
	grabbedspr = spr_noisesatellitestun;
}
if (state != states.grabbed)
	depth = 0;
if (state != states.stun)
	thrown = false;
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
