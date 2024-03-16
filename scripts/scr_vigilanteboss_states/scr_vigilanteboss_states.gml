function vigilante_cancel_attack()
{
	if cancel_buffer > 0
		cancel_buffer--;
	else if combo_count > 0
	{
		targetstunned = 0;
		state = argument[irandom(argument_count - 1)];
		combo_count--;
		cancel_buffer = ds_map_find_value(cancel_max, state);
		if (is_undefined(cancel_buffer))
			cancel_buffer = cancel_maxdefault;
		switch state
		{
			case states.revolver:
				revolver_count = choose(1, 2);
				movespeed = 0;
				sprite_index = spr_playerV_revolverstart;
				image_index = 0;
				break;
			case states.uppunch:
				normalattack_cooldown = normalattack_max[phase - 1];
				vsp = -14;
				movespeed = 2;
				sprite_index = spr_playerV_superjump;
				image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
				image_index = 0;
				instance_create(x, y, obj_highjumpcloud2);
				break;
			case states.handstandjump:
				normalattack_cooldown = normalattack_max[phase - 1];
				movespeed = 8;
				vsp = grounded ? 0 : -4;
				sprite_index = spr_playerV_mach3boost;
				image_index = 0;
				with (instance_create(x, y, obj_superdashcloud))
					image_xscale = other.image_xscale;
				with (instance_create(x, y, obj_crazyrunothereffect))
					image_xscale = other.image_xscale;
				break;
			case states.charge:
				sprite_index = spr_playerV_divekickstart;
				image_index = 0;
				movespeed = 0;
				break;
			case states.groundpunchstart:
				vsp = -14;
				image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : ((x < (room_width / 2)) ? 1 : -1);
				sprite_index = spr_playerV_jump;
				image_index = 0;
				movespeed = 0;
				instance_create(x, y, obj_highjumpcloud2);
				break;
			case states.millionpunch:
				sprite_index = spr_playerV_crazyrun;
				image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : ((x < (room_width / 2)) ? 1 : -1);
				image_index = 0;
				movespeed = 4;
				millionpunch_buffer = millionpunch_max;
				with (instance_create(x, y, obj_millionpunchhitbox))
					baddieID = other.id;
				break;
			case states.dynamite:
				dynamite_shot = true;
				sprite_index = spr_playerV_dynamitethrow;
				image_index = 0;
				with (instance_create(x, y, obj_dynamite))
				{
					obj_explosion = obj_dynamiteexplosion_boss;
					image_xscale = other.image_xscale;
					movespeed = 6;
					vsp = -6;
				}
				break;
		}
	}
}
function boss_vigilante_decide_attack()
{
	if phase < 3
		vigilante_decide_attack_phase1();
	else if phase == 3
		vigilante_decide_attack_phase3();
	else if phase == 4
		vigilante_decide_attack_phase4();
	else if phase == 5
	{
		if honor
			vigilante_decide_attack_phase4();
		else
			vigilante_decide_attack_phase5();
		cancel_buffer = ds_map_find_value(cancel_max, state);
		if (is_undefined(cancel_buffer))
			cancel_buffer = cancel_maxdefault;
		combo_count = irandom(1);
	}
	else if phase == 6
	{
		if honor
			vigilante_decide_attack_phase4();
		else
			vigilante_decide_attack_phase6_nohonor();
		cancel_buffer = ds_map_find_value(cancel_max, state);
		if (is_undefined(cancel_buffer))
			cancel_buffer = cancel_maxdefault;
		combo_count = irandom(2);
		if (important && (hp < duelhp_threshold || obj_bosscontroller.seconds < duelseconds_threshold))
		{
			if hitstate != states.superattack
			{
				state = states.superattackstart;
				duelintro_buffer = duelintro_max;
				movespeed = 0;
				with obj_bosshitbox
					instance_destroy();
				with obj_player
				{
					if (object_index == obj_player1 || global.coop)
					{
						state = states.superattackstart;
						movespeed = 0;
					}
				}
				with obj_tv
				{
					message = "DUEL!!!";
					alarm[0] = 200;
					showtext = true;
				}
			}
			else if grounded
			{
				sprite_index = idlespr;
				state = states.superattackstart;
			}
		}
	}
}
function vigilante_decide_attack_phase6_nohonor()
{
	if attack_cooldown > 0
		attack_cooldown--;
	else
	{
		var attack_chance = irandom(200);
		if attack_chance >= 150
			vigilante_decide_attack_phase4();
		else if attack_chance >= 100 && attack_chance < 150
			vigilante_decide_attack_phase3();
		else if attack_chance >= 50 && attack_chance < 100
		{
			vigilante_decide_attack_phase1();
			dynamite_shot = false;
		}
		else
		{
			vigilante_decide_attack_phase1();
			revolver_count = 1;
			revolver_jump = -1;
			dynamite_shot = false;
			superkickattackpursuit = false;
			superkickattack_jump = false;
			dynamite_count = 1;
		}
		attack_cooldown = attack_max[phase - 1];
	}
}
function vigilante_decide_attack_phase5()
{
	if attack_cooldown > 0
		attack_cooldown--;
	else
	{
		var attack_chance = irandom(100);
		if attack_chance > 50
			vigilante_decide_attack_phase4();
		else
			vigilante_decide_attack_phase3();
		attack_cooldown = attack_max[phase - 1];
	}
}
function vigilante_decide_attack_phase4()
{
	if attack_cooldown > 0
		attack_cooldown--;
	else
	{
		targetstunned = 0;
		var att_max = attack_max[phase - 1];
		attack_cooldown = att_max + irandom_range(-att_max, att_max + 20);
		attack_cooldown = (phase > 4) ? attack_max[phase - 1] : attack_cooldown;
		state = choose(states.groundpunchstart, states.charge, states.millionpunch);
		if state == states.charge
		{
			sprite_index = spr_playerV_divekickstart;
			image_index = 0;
			movespeed = 0;
		}
		else if state == states.groundpunchstart
		{
			vsp = -14;
			image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : ((x < (room_width / 2)) ? 1 : -1);
			sprite_index = spr_playerV_jump;
			image_index = 0;
			movespeed = 0;
			instance_create(x, y, obj_highjumpcloud2);
		}
		else if state == states.millionpunch
		{
			sprite_index = spr_playerV_crazyrun;
			image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : ((x < (room_width / 2)) ? 1 : -1);
			image_index = 0;
			movespeed = 4;
			millionpunch_buffer = millionpunch_max;
			with (instance_create(x, y, obj_millionpunchhitbox))
				baddieID = other.id;
		}
	}
}
function vigilante_decide_attack_phase3()
{
	if attack_cooldown > 0
		attack_cooldown--;
	else
	{
		targetstunned = 0;
		attack_cooldown = attack_max[phase - 1];
		state = choose(states.revolver, states.mach1, states.dynamite);
		if state == states.revolver
		{
			revolver_count = 2;
			revolver_jumpcount = 0;
			revolver_jump = irandom_range(-1, revolver_count - 1);
			movespeed = 0;
			sprite_index = spr_playerV_revolverstart;
			image_index = 0;
			if revolver_jump == revolver_jumpcount && grounded
				vsp = -11;
		}
		else if state == states.mach1
		{
			superkickattackpursuit = true;
			superkickattack_jump = (irandom(100) > 30) ? true : false;
			movespeed = 0;
			sprite_index = spr_playerV_mach1;
			image_index = 0;
		}
		else if state == states.dynamite
		{
			dynamite_shot = true;
			sprite_index = spr_playerV_dynamitethrow;
			image_index = 0;
			with (instance_create(x, y, obj_dynamite))
			{
				obj_explosion = obj_dynamiteexplosion_boss;
				image_xscale = other.image_xscale;
				movespeed = 6;
				vsp = -6;
			}
		}
	}
}
function vigilante_decide_attack_phase1()
{
	if attack_cooldown > 0
		attack_cooldown--;
	else
	{
		targetstunned = 0;
		attack_cooldown = attack_max[phase - 1];
		state = choose(states.mach1, states.mach1, states.revolver, states.revolver, states.revolver, states.jump, states.jump);
		if state == states.revolver
		{
			revolver_count = (phase == 1) ? 1 : 2;
			movespeed = 0;
			sprite_index = spr_playerV_revolverstart;
			image_index = 0;
		}
		else if state == states.mach1
		{
			superkickattackpursuit = !(phase == 1);
			movespeed = 0;
			sprite_index = spr_playerV_mach1;
			image_index = 0;
		}
		else if state == states.jump
		{
			vsp = -14;
			hsp = 0;
			movespeed = 0;
			sprite_index = spr_playerV_jump;
			image_index = 0;
			dynamite_buffer = dynamite_max;
			dynamite_count = (phase == 1) ? 1 : 2;
			instance_create(x, y, obj_highjumpcloud2);
		}
	}
}
function vigilante_decide_normalattack()
{
	if normalattack_cooldown > 0
		normalattack_cooldown--;
	else if (distance_to_pos(x, y, targetplayer.x, targetplayer.y, 180, 340))
	{
		normalattack_cooldown = normalattack_max[phase - 1];
		if (targetplayer.y <= (y - 24))
		{
			state = states.uppunch;
			vsp = -14;
			movespeed = 2;
			sprite_index = spr_playerV_superjump;
			image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
			image_index = 0;
			instance_create(x, y, obj_highjumpcloud2);
		}
		else
		{
			state = states.handstandjump;
			movespeed = 8;
			sprite_index = spr_playerV_mach3boost;
			image_index = 0;
			with (instance_create(x, y, obj_superdashcloud))
				image_xscale = other.image_xscale;
			with (instance_create(x, y, obj_crazyrunothereffect))
				image_xscale = other.image_xscale;
		}
	}
}
function boss_vigilante_normal_phase4()
{
	image_speed = 0.35;
	if (targetplayer.hsp != 0 && targetplayer.state != states.thrown && distance_to_object(targetplayer) < 500)
		move = sign(targetplayer.hsp);
	else
		move = 0;
	if (distance_to_object(targetplayer) < 128)
		move = -sign(targetplayer.x - x);
	hsp = move * movespeed;
	if x != targetplayer.x
		image_xscale = sign(targetplayer.x - x);
	var targetspeed = (move == image_xscale) ? normal_spd : (normal_spd - 2);
	if move != 0
	{
		if movespeed < targetspeed
			movespeed += 0.25;
		else if movespeed > targetspeed
			movespeed -= 0.5;
		if movespeed < 3
			image_speed = 0.35;
		else if movespeed > 3 && movespeed < 6
			image_speed = 0.45;
		else
			image_speed = 0.6;
	}
	else if movespeed > 0
		movespeed -= 0.1;
	else if movespeed <= 0
		movespeed = 0;
	boss_decide_taunt(180);
	if state != states.backbreaker
	{
		boss_vigilante_decide_attack();
		vigilante_decide_normalattack();
	}
	if state == states.normal
	{
		if hsp != 0
			sprite_index = walkspr;
		else
			sprite_index = idlespr;
	}
}
function boss_vigilante_normal()
{
	image_speed = 0.35;
	if (targetplayer.hsp != 0 && targetplayer.state != states.thrown && distance_to_object(targetplayer) < 480)
		move = sign(targetplayer.hsp);
	else
		move = 0;
	if (distance_to_object(targetplayer) < 300)
		move = -sign(targetplayer.x - x);
	if (distance_to_object(targetplayer) > 500)
		move = sign(targetplayer.x - x);
	hsp = move * movespeed;
	if x != targetplayer.x
		image_xscale = sign(targetplayer.x - x);
	var targetspeed = (move == image_xscale) ? (normal_spd - 2) : normal_spd;
	if move != 0
	{
		if movespeed < targetspeed
			movespeed += 0.25;
		else if movespeed > targetspeed
			movespeed -= 0.5;
		if movespeed < 3
			image_speed = 0.35;
		else if movespeed > 3 && movespeed < 6
			image_speed = 0.45;
		else
			image_speed = 0.6;
	}
	else if movespeed > 0
		movespeed -= 0.1;
	else if movespeed <= 0
		movespeed = 0;
	boss_decide_taunt(180);
	if state != states.backbreaker
		boss_vigilante_decide_attack();
	if state == states.normal
	{
		if ((x < (room_width / 8) || x > (room_width - (room_width / 8))) && distance_to_object(targetplayer) < 172)
		{
			state = states.float;
			if phase == 3
				changeside_skid = true;
		}
		if hsp != 0
			sprite_index = walkspr;
		else
			sprite_index = idlespr;
	}
}
function boss_vigilante_float()
{
	image_speed = 0.35;
	sprite_index = spr_playerV_crouchmove;
	hsp = image_xscale * changeside_spd;
	movespeed = 0;
	if (changeside_skid && place_meeting(x + (sign(hsp) * 128), y, obj_solid))
	{
		state = states.machslide;
		movespeed = 12;
		sprite_index = spr_playerV_mach2boost;
	}
	if (place_meeting(x + (sign(hsp) * 64), y, obj_solid))
	{
		image_xscale = (x < (room_width / 2)) ? 1 : -1;
		state = states.normal;
	}
}
function boss_vigilante_revolver()
{
	image_speed = (phase != 6) ? 0.35 : 0.5;
	hsp = 0;
	if (image_index > image_number - 1)
	{
		if (sprite_index == spr_playerV_revolverstart || sprite_index == spr_playerV_airrevolverstart)
		{
			sprite_index = spr_playerV_revolvershoot;
			image_index = 0;
			with (instance_create(x + (image_xscale * 20), y + 20, obj_revolvershot))
				image_xscale = other.image_xscale;
			revolver_count--;
			revolver_jumpcount++;
			if revolver_jump == revolver_jumpcount
			{
				vsp = -11;
				sprite_index = spr_playerV_airrevolver;
				instance_create(x, y, obj_highjumpcloud2);
			}
		}
		else if (sprite_index == spr_playerV_revolvershoot || sprite_index == spr_playerV_airrevolver)
		{
			if revolver_count <= 0
			{
				sprite_index = idlespr;
				state = states.normal;
				revolver_jump = -1;
			}
			else
			{
				sprite_index = grounded ? spr_playerV_revolvershoot : spr_playerV_airrevolver;
				image_index = 0;
				with (instance_create(x + (image_xscale * 20), y + 20, obj_revolvershot))
					image_xscale = other.image_xscale;
				revolver_count--;
				revolver_jumpcount++;
				if revolver_jump == revolver_jumpcount
				{
					vsp = -11;
					sprite_index = spr_playerV_airrevolver;
					instance_create(x, y, obj_highjumpcloud2);
				}
			}
		}
	}
	if phase > 4
		vigilante_cancel_attack(states.dynamite, states.charge);
}
function boss_vigilante_mach1()
{
	image_speed = 0.6;
	hsp = image_xscale * movespeed;
	if movespeed < 12
		movespeed += 0.5;
	if (sprite_index == spr_playerV_mach1 && image_index > image_number - 1)
		sprite_index = spr_playerV_bootsmove;
	var tx = (phase == 1) ? 224 : 380;
	if (!superkickattackpursuit && !superkickattack_jump && distance_to_pos(x, y, targetplayer.x, targetplayer.y, tx, 540) && grounded)
	{
		state = states.crouchslide;
		movespeed = (phase == 1) ? 12 : 15;
		sprite_index = spr_playerV_divekickstart;
		image_index = 0;
	}
	if (!superkickattackpursuit && superkickattack_jump && distance_to_pos(x, y, targetplayer.x, targetplayer.y, 400, 540) && grounded)
	{
		vsp = -11;
		state = states.jump;
		movespeed = 12;
		dynamite_count = 0;
		dynamite_buffer = 0;
		sprite_index = spr_playerV_bootsjump;
		image_index = 0;
		instance_create(x, y, obj_highjumpcloud2);
	}
	if (superkickattackpursuit && place_meeting(x + (sign(hsp) * 116), y, obj_solid))
	{
		state = states.machslide;
		movespeed = 12;
		sprite_index = spr_playerV_mach2boost;
		superkickattackpursuit = false;
	}
	if (place_meeting(x + sign(hsp), y, obj_solid))
	{
		state = states.bump;
		hsp = -image_xscale * 6;
		vsp = -4;
	}
	if (!instance_exists(dashcloudid) && grounded)
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			image_xscale = other.image_xscale;
			other.dashcloudid = id;
		}
	}
	if phase > 4
		vigilante_cancel_attack(!honor ? states.revolver : states.handstandjump, states.charge);
}
function boss_vigilante_crouchslide()
{
	image_speed = (phase != 6) ? 0.35 : 0.5;
	hsp = image_xscale * movespeed;
	if (sprite_index == spr_playerV_divekickstart && image_index > image_number - 1)
		sprite_index = spr_playerV_divekick;
	if grounded
	{
		if sprite_index == spr_playerV_dive
			sprite_index = spr_playerV_divekick;
		if movespeed > 0
			movespeed -= 0.2;
		else
		{
			movespeed = 0;
			state = states.normal;
		}
	}
	if (place_meeting(x + sign(hsp), y, obj_solid))
	{
		state = states.bump;
		hsp = -image_xscale * 6;
		vsp = -4;
	}
	if phase > 4
		vigilante_cancel_attack(states.groundpunchstart, states.charge, states.uppunch);
}
function boss_vigilante_machslide()
{
	hsp = image_xscale * movespeed;
	if movespeed > 0
		movespeed -= 0.4;
	else
		movespeed = 0;
	image_speed = (phase != 6) ? 0.35 : 0.5;
	if (image_index > image_number - 1)
	{
		if sprite_index == spr_playerV_mach2boost
		{
			sprite_index = spr_playerV_bootsmove;
			state = states.mach1;
			superkickattackpursuit = false;
			movespeed = 12;
			image_xscale *= -1;
		}
	}
}
function boss_vigilante_jump()
{
	image_speed = (phase != 6) ? 0.35 : 0.5;
	hsp = image_xscale * movespeed;
	if dynamite_buffer > 0
		dynamite_buffer--;
	else if dynamite_count > 0
	{
		state = states.dynamite;
		sprite_index = spr_playerV_dynamitethrow;
		image_index = 0;
		repeat dynamite_count
		{
			with (instance_create(x, y, obj_dynamite))
			{
				obj_explosion = obj_dynamiteexplosion_boss;
				image_xscale = other.image_xscale;
				movespeed = 6;
				vsp = -(6 + ((other.dynamite_count - 1) * 2));
				movespeed += ((other.dynamite_count - 1) * 4);
			}
			dynamite_count--;
		}
		dynamite_count = 0;
	}
	if sprite_index == spr_playerV_bootsjump && vsp >= 0
	{
		sprite_index = spr_playerV_dive;
		image_index = 0;
		state = states.crouchslide;
		vsp = 10;
	}
	if (image_index > image_number - 1 && sprite_index == spr_playerV_jump)
		sprite_index = spr_playerV_fall;
	if grounded
		state = states.normal;
}
function boss_vigilante_dynamite()
{
	image_speed = (phase != 6) ? 0.4 : 0.6;
	if (image_index > image_number - 1)
	{
		state = states.jump;
		sprite_index = spr_playerV_fall;
		if dynamite_shot
		{
			state = states.revolver;
			sprite_index = spr_playerV_revolverstart;
			image_index = 0;
			revolver_count = 1;
			revolver_jump = -1;
		}
	}
}
function boss_vigilante_charge()
{
	image_speed = (phase != 6) ? 0.35 : 0.4;
	hsp = image_xscale * movespeed;
	if (image_index > image_number - 1)
	{
		movespeed = 17;
		state = states.punch;
		sprite_index = spr_playerV_divekick;
	}
}
function boss_vigilante_punch()
{
	image_speed = (phase != 6) ? 0.35 : 0.5;
	hsp = image_xscale * movespeed;
	if (place_meeting(x + sign(hsp), y, obj_solid))
	{
		state = states.bump;
		hsp = -image_xscale * 6;
		vsp = -4;
	}
	if movespeed > 0
		movespeed -= 0.2;
	else
	{
		movespeed = 0;
		state = states.normal;
	}
	if phase > 4
		vigilante_cancel_attack(states.groundpunchstart, states.uppunch);
}
function boss_vigilante_groundpunchstart()
{
	image_speed = (phase != 6) ? 0.35 : 0.5;
	if (x > (targetplayer.x - 32) && x < (targetplayer.x + 32))
		move = 0;
	else
	{
		image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
		move = image_xscale;
	}
	hsp = move * movespeed;
	if (movespeed < (normal_spd + 1))
		movespeed += 0.5;
	else
		movespeed = normal_spd + 1;
	if (sprite_index == spr_playerV_jump && image_index > image_number - 1)
	{
		sprite_index = spr_playerV_fall;
		image_index = 0;
	}
	if vsp > 0
	{
		image_index = 0;
		sprite_index = spr_playerV_bodyslamprep;
		state = states.freefallprep;
		vsp = -5;
	}
}
function boss_vigilante_freefallprep()
{
	if (x > (targetplayer.x - 24) && x < (targetplayer.x + 24))
		move = 0;
	else
	{
		image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
		move = image_xscale;
	}
	if movespeed < 7
		movespeed += 0.2;
	else if movespeed > 7
		movespeed -= 0.1;
	else
		movespeed = 7;
	hsp = move * movespeed;
	if (image_index > image_number - 1)
	{
		vsp += 14;
		state = states.freefall;
		sprite_index = spr_playerV_bodyslam;
		image_index = 0;
	}
}
function boss_vigilante_freefall()
{
	if (x > (targetplayer.x - 24) && x < (targetplayer.x + 24))
	{
		move = 0;
		movespeed = 0;
	}
	else
	{
		image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
		move = image_xscale;
	}
	if movespeed < 7
		movespeed += 0.2;
	else if movespeed > 7
		movespeed -= 0.1;
	else
		movespeed = 7;
	hsp = move * movespeed;
	vsp = 20;
	image_speed = (phase != 6) ? 0.35 : 0.5;
	sprite_index = spr_playerV_bodyslam;
	if grounded
	{
		movespeed = 0;
		state = states.freefallland;
		sprite_index = spr_playerV_bodyslamland;
		image_index = 0;
	}
}
function boss_vigilante_freefallland()
{
	hsp = image_xscale * movespeed;
	image_speed = (phase != 6) ? 0.35 : 0.5;
	if (image_index > image_number - 1)
		state = states.normal;
	if phase > 4
		vigilante_cancel_attack(!honor ? states.revolver : states.handstandjump, states.uppunch);
}
function boss_vigilante_millionpunch()
{
	image_speed = (phase != 6) ? 0.6 : 0.7;
	if (x > (targetplayer.x - 24) && x < (targetplayer.x + 24))
		move = 0;
	else
	{
		image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
		move = image_xscale;
	}
	hsp = move * movespeed;
	if millionpunch_buffer > 0
		millionpunch_buffer--;
	else
		state = states.normal;
	if phase > 4
		vigilante_cancel_attack(states.groundpunchstart, states.uppunch);
}
function boss_vigilante_uppunch()
{
	hsp = image_xscale * movespeed;
	if (image_index > image_number - 1)
		image_index = image_number - 1;
	if grounded
		state = states.normal;
	if phase > 4
		vigilante_cancel_attack(states.handstandjump, states.uppunch);
}
function boss_vigilante_handstandjump()
{
	image_speed = (phase != 6) ? 0.35 : 0.4;
	hsp = image_xscale * movespeed;
	if movespeed < 10
		movespeed += 0.5;
	else
		movespeed = 10;
	if (image_index > image_number - 1)
		state = states.normal;
	if phase > 4
		vigilante_cancel_attack(states.jump);
}
function boss_vigilante_superattackstart()
{
	var tx = room_width - (room_width / 3);
	x = Approach(x, tx, movespeed);
	hsp = 0;
	if movespeed < 8
		movespeed += 0.5;
	image_xscale = (x > (room_width / 2)) ? -1 : 1;
	if x != tx
		sprite_index = grounded ? walkspr : fallspr;
	else
	{
		movespeed = 0;
		sprite_index = grounded ? idlespr : fallspr;
	}
	if movespeed < 3
		image_speed = 0.35;
	else if movespeed > 3 && movespeed < 6
		image_speed = 0.45;
	else
		image_speed = 0.6;
	with lastplayerid
	{
		if (object_index == obj_player1 || global.coop)
		{
			var tx2 = room_width / 3;
			x = Approach(x, tx2, movespeed);
			hsp = 0;
			if movespeed < 8
				movespeed += 0.5;
			xscale = (x > (room_width / 2)) ? -1 : 1;
			if x != tx2
				sprite_index = grounded ? spr_move : spr_fall;
			else
			{
				movespeed = 0;
				sprite_index = grounded ? spr_idle : spr_fall;
			}
			if movespeed < 3
				image_speed = 0.35;
			else if movespeed > 3 && movespeed < 6
				image_speed = 0.45;
			else
				image_speed = 0.6;
		}
	}
	if x == tx && obj_player1.x == tx2
	{
		state = states.superattack;
		with lastplayerid
		{
			if (object_index == obj_player1 || global.coop)
				state = states.superattack;
		}
		duel_buffer = duel_max + irandom(duel_random);
	}
}
function boss_vigilante_superattack()
{
	if duel_buffer > 0
	{
		if lastplayerid.state != states.hit && lastplayerid.state != states.thrown
			duel_buffer--;
	}
	else if duel_buffer == 0
	{
		duel_buffer = -1;
		duelinst = instance_create(room_width / 2, room_height / 2, obj_cloudeffect);
		with duelinst
		{
			sprite_index = spr_taunteffect;
			image_speed = 0.5;
		}
	}
	if (image_index > image_number - 1)
	{
		if sprite_index == spr_playerV_revolvershoot
		{
			sprite_index = spr_playerV_revolverend;
			image_index = 0;
		}
		else if sprite_index == spr_playerV_revolverend
			sprite_index = spr_playerV_idle;
	}
	if sprite_index != spr_playerV_revolvershoot && sprite_index != spr_playerV_revolverend && sprite_index != spr_playerV_idle
		sprite_index = spr_playerV_idle;
	if (duel_buffer == -1 && !instance_exists(duelinst))
	{
		duel_buffer = -2;
		duelinst = -4;
		sprite_index = spr_playerV_revolvershoot;
		image_index = 0;
		with (instance_create(x + (image_xscale * 20), y + 20, obj_revolvershot))
		{
			image_xscale = other.image_xscale;
			dmg = 150;
		}
	}
	with lastplayerid
	{
		if state != states.superattack && state != states.hit && state != states.thrown && state != states.chainsaw
		{
			state = states.superattack;
			x = room_width / 3;
		}
		xscale = 1;
		if (other.duel_buffer == -1 && (key_slap2 || key_shoot2 || key_jump2))
		{
			other.duel_buffer = -2;
			instance_create(x + (image_xscale * 20), y, obj_shotgunbullet);
			sprite_index = spr_player_pistolshot;
			image_index = 0;
		}
	}
}
