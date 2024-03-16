function boss_pepperman_decide_attack()
{
	if phase < 5
		pepperman_decide_attack_phase1();
	else if phase == 5
		pepperman_decide_attack_phase5();
	else if phase == 6
		pepperman_decide_attack_phase6();
}
function pepperman_decide_attack_phase6()
{
	if attack_cooldown > 0
		attack_cooldown--;
	else
	{
		targetstunned = 0;
		attack_cooldown = attack_max[phase - 1];
		readjusting = false;
		if hp <= superattack_hpthreshold
			state = states.superattackstart;
		if state != states.superattackstart
		{
			var fakephase = irandom(100);
			if fakephase > 60
			{
				groundpound_fakeout = true;
				pepperman_decide_attack_phase5();
			}
			else
			{
				groundpound_fakeout = false;
				pepperman_decide_attack_phase1();
			}
		}
		else
		{
			superattack_buffer = superattack_max;
			sprite_index = spr_pepperman_shoulderstart;
			image_index = 0;
		}
	}
}
function pepperman_decide_attack_phase5()
{
	if attack_cooldown > 0
		attack_cooldown--;
	else
	{
		targetstunned = 0;
		attack_cooldown = attack_max[phase - 1];
		groundpound_fakeout = true;
		readjusting = false;
		state = (irandom(100) > 50) ? choose(states.charge, states.charge, states.shoulder) : states.jump;
		if state == states.charge
		{
			sprite_index = spr_pepperman_shoulderstart;
			image_index = 0;
			image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
		}
		else if state == states.shoulder
		{
			shoulderturns = 3;
			sprite_index = spr_pepperman_shoulderstart;
			image_index = 0;
			image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
		}
		else if state == states.jump
		{
			jumping_pepper = false;
			superjumping_pepper = false;
			image_index = 0;
			sprite_index = spr_pepperman_jump;
			readjusting = true;
			groundpound_readjust = choose(1, 2);
			target_x = targetplayer.x;
			vsp = -18;
			var d = abs(targetplayer.x - x);
			var t = room_speed * 2;
			var jump_spd = ceil(get_velocity(d, t)) * 3;
			hsp = (target_x != x) ? (sign(target_x - x) * jump_spd) : (image_xscale * jump_spd);
			if hsp != 0
				image_xscale = sign(hsp);
			with (instance_create(x, y - 5, obj_highjumpcloud2))
				image_xscale = other.xscale;
		}
	}
}
function pepperman_decide_attack_phase1()
{
	if attack_cooldown > 0
		attack_cooldown--;
	else
	{
		targetstunned = 0;
		attack_cooldown = attack_max[phase - 1];
		var chance_shoulder = 45 - ((5 * phase) - 1);
		state = (irandom(100) > chance_shoulder) ? states.shoulderbash : states.jump;
		shoulderpound_fakeout = (phase == 4) ? true : false;
		superjumping_pepper = (phase == 4) ? true : false;
		if phase == 6
		{
			shoulderpound_fakeout = (irandom(100) > 60) ? true : false;
			superjumping_pepper = (irandom(100) > 50) ? true : false;
		}
		if phase > 1
		{
			var chance_jumping = (phase == 2) ? 50 : 35;
			var chance_fakeout = (phase == 2) ? 60 : 50;
			jumping_pepper = (irandom(100) > chance_jumping) ? true : false;
			shoulderbash_fakeout = (irandom(100) > chance_fakeout) ? true : false;
			if shoulderbash_fakeout
				shoulderpound_fakeout = false;
		}
		if state == states.shoulderbash
		{
			if shoulderpound_fakeout
				shoulderpound_buffer = shoulderpound_max;
			if shoulderbash_fakeout
			{
				with (instance_create(x, y, obj_crazyrunothereffect))
					playerid = other.id;
			}
			image_index = 0;
			sprite_index = spr_pepperman_shoulderstart;
			image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
		}
		else if state == states.jump
		{
			image_index = 0;
			sprite_index = spr_pepperman_jump;
			target_x = targetplayer.x;
			vsp = -18;
			if !jumping_pepper
			{
				var d = abs(targetplayer.x - x);
				var t = room_speed * 2;
				var jump_spd = ceil(get_velocity(d, t)) * 3;
				hsp = (target_x != x) ? (sign(target_x - x) * jump_spd) : (image_xscale * jump_spd);
			}
			else
			{
				var tx = (x < (room_width / 2)) ? (room_width - (room_width / 5)) : (room_width / 5);
				d = abs(tx - x);
				t = room_speed * 1.2;
				jump_spd = ceil(get_velocity(d, t));
				hsp = (x > (room_width / 2)) ? -jump_spd : jump_spd;
			}
			if hsp != 0
				image_xscale = sign(hsp);
			with (instance_create(x, y - 5, obj_highjumpcloud2))
				image_xscale = other.xscale;
		}
	}
}
function boss_pepperman_normal()
{
	image_speed = 0.35;
	if targetplayer.state != states.thrown
	{
		var is_middle = x > (room_width / 5) && x < (room_width - (room_width / 5));
		var is_middle_player = targetplayer.x > (room_width / 5) && targetplayer.x < (room_width - (room_width / 5));
		if is_middle && hsp == 0
			hsp = (targetplayer.x > (room_width / 2)) ? -normal_spd : normal_spd;
		else if !is_middle && hsp != 0
		{
			image_xscale = -sign(hsp);
			hsp = 0;
		}
		if is_middle_player && !is_middle
			image_xscale = sign(targetplayer.x - x);
	}
	else
	{
		var is_playerside = (targetplayer.x > (room_width / 2)) ? (x > (room_width / 5)) : (x < (room_width - (room_width / 5)));
		if is_playerside
			hsp = (targetplayer.x > (room_width / 2)) ? -normal_spd : normal_spd;
		else if !is_playerside && hsp != 0
		{
			image_xscale = -sign(hsp);
			hsp = 0;
		}
	}
	if (phase > 1 && distance_to_pos(x, y, targetplayer.x, targetplayer.y, 160, 540))
		attack_cooldown = 0;
	boss_decide_taunt(180);
	if state != states.backbreaker
	{
		if hsp != 0 && grounded
		{
			sprite_index = walkspr;
			image_xscale = sign(hsp);
		}
		else if grounded
		{
			sprite_index = idlespr;
			boss_pepperman_decide_attack();
		}
		else
			sprite_index = spr_pepperman_fall;
	}
}
function boss_pepperman_phase3normal()
{
	image_speed = 0.35;
	if hsp != 0 && grounded
	{
		sprite_index = walkspr;
		image_xscale = sign(hsp);
	}
	else if grounded
	{
		sprite_index = idlespr;
		boss_pepperman_decide_attack();
	}
	else
		sprite_index = spr_pepperman_fall;
}
function boss_pepperman_jump()
{
	image_speed = 0.35;
	if (sprite_index == spr_pepperman_jump && image_index > image_number - 1)
		sprite_index = spr_pepperman_fall;
	var col = collision_line(x, y, x, y + 96, obj_solid, false, true);
	if (!jumping_pepper && !groundpound_fakeout && col == noone && ((x > (target_x - 24) && x < (target_x + 24)) || (x > (targetplayer.x - 24) && x < (targetplayer.x + 24)) || vsp > 3))
	{
		state = states.freefallprep;
		vsp = 10;
		hsp = 0;
		image_index = 0;
		sprite_index = spr_pepperman_jump;
	}
	if (groundpound_fakeout && (vsp > 3 || (x > (target_x - 24) && x < (target_x + 24))))
	{
		var col2 = collision_line(x, y, x, y + 148, obj_solid, false, true);
		if col2 == noone
		{
			groundpound_readjust_buffer = groundpound_readjust_max;
			readjusting = true;
			target_x = targetplayer.x;
			state = states.freefallprep;
			vsp = 10;
			hsp = 0;
			image_index = 0;
			sprite_index = spr_pepperman_jump;
		}
	}
	if grounded
	{
		hsp = 0;
		state = states.freefallland;
		sprite_index = spr_pepperman_jump;
	}
}
function boss_pepperman_freefallprep()
{
	hsp = 0;
	vsp = 0;
	sprite_index = spr_pepperman_fall;
	if !readjusting
	{
		if (image_index > image_number - 1)
		{
			state = states.freefall;
			vsp = 20;
			hsp = 0;
			image_index = 0;
			sprite_index = spr_pepperman_groundpound;
		}
	}
	else
	{
		x = Approach(x, target_x, 8);
		if (x > (target_x - 8) && x < (target_x + 8))
		{
			if groundpound_readjust_buffer > 0
				groundpound_readjust_buffer--;
			else if groundpound_readjust > 0
			{
				groundpound_readjust--;
				target_x = targetplayer.x;
				groundpound_readjust_buffer = groundpound_readjust_max;
			}
			else if groundpound_readjust <= 0
			{
				state = states.freefall;
				vsp = 20;
				hsp = 0;
				image_index = 0;
				sprite_index = spr_pepperman_groundpound;
			}
		}
	}
}
function boss_pepperman_freefall()
{
	vsp = 20;
	if grounded
	{
		with obj_camera
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
		state = states.freefallland;
		sprite_index = spr_pepperman_jump;
		if phase >= 5
			boss_pepperman_summonbricks();
	}
}
function boss_pepperman_freefallland()
{
	if (image_index > image_number - 1)
	{
		state = states.normal;
		sprite_index = idlespr;
		if jumping_pepper && superjumping_pepper
		{
			state = states.shoulderbash;
			if shoulderbash_fakeout
			{
				with (instance_create(x, y, obj_crazyrunothereffect))
					playerid = other.id;
			}
			image_index = 0;
			sprite_index = spr_pepperman_shoulderstart;
			image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
		}
	}
}
function boss_pepperman_shoulderbash()
{
	image_speed = 0.35;
	if (sprite_index == spr_pepperman_shoulderstart && image_index > image_number - 1)
		sprite_index = spr_pepperman_shoulderloop;
	hsp = image_xscale * shoulder_spd;
	if (place_meeting(x + sign(hsp), y, obj_solid))
	{
		with obj_camera
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
		state = states.stun;
		stunned = 100;
		vsp = -4;
		hsp = -image_xscale * 8;
		image_xscale = sign(hsp);
		if phase >= 5
			boss_pepperman_summonbricks();
	}
	if shoulderpound_fakeout
	{
		if (place_meeting(x + (sign(hsp) * 32), y, obj_solid))
			shoulderpound_buffer = 0;
		if shoulderpound_buffer > 0
			shoulderpound_buffer--;
		else
		{
			with (instance_create(x, y - 5, obj_crazyrunothereffect))
				playerid = other.id;
			state = states.jump;
			image_index = 0;
			sprite_index = spr_pepperman_jump;
			target_x = targetplayer.x;
			vsp = -18;
			jumping_pepper = false;
			var d = abs(targetplayer.x - x);
			var t = room_speed * 2;
			var jump_spd = ceil(get_velocity(d, t)) * 3;
			hsp = (target_x != x) ? (sign(target_x - x) * jump_spd) : (image_xscale * jump_spd);
			if hsp != 0
				image_xscale = sign(hsp);
		}
	}
	if (shoulderbash_fakeout && !shoulderpound_fakeout && grounded && distance_to_pos(x, y, targetplayer.x, targetplayer.y, 180, 540))
	{
		vsp = -11;
		with (instance_create(x, y - 5, obj_highjumpcloud2))
			image_xscale = other.xscale;
	}
}
function boss_pepperman_charge()
{
	image_speed = 0.35;
	hsp = 0;
	if (image_index > image_number - 1)
	{
		state = states.supershoulderbash;
		sprite_index = spr_pepperman_shoulderloop;
		image_index = 0;
		hsp = image_xscale * (shoulder_spd * 2);
	}
}
function boss_pepperman_supershoulderbash()
{
	image_speed = 0.35;
	hsp = image_xscale * (shoulder_spd * 2);
	if (place_meeting(x + sign(hsp), y, obj_solid))
	{
		with obj_camera
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
		state = states.stun;
		stunned = 50;
		vsp = -4;
		hsp = -image_xscale * 8;
		image_xscale = sign(hsp);
		if phase >= 5
			boss_pepperman_summonbricks();
	}
}
function boss_pepperman_shoulder()
{
	image_speed = 0.35;
	hsp = image_xscale * shoulder_spd;
	if (sprite_index == spr_pepperman_shoulderstart && image_index > image_number - 1)
	{
		image_index = 0;
		sprite_index = spr_pepperman_shoulderloop;
	}
	if shoulderturns > 0
	{
		if (place_meeting(x + (sign(hsp) * 96), y, obj_solid))
		{
			shoulderturns--;
			state = states.shoulderturn;
			sprite_index = spr_pepperman_shoulderstart;
			image_index = 0;
		}
	}
	else if (place_meeting(x + sign(hsp), y, obj_solid))
	{
		with obj_camera
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
		if phase >= 5
			boss_pepperman_summonbricks();
		state = states.stun;
		stunned = 50;
		vsp = -4;
		hsp = -image_xscale * 8;
		image_xscale = sign(hsp);
	}
}
function boss_pepperman_shoulderturn()
{
	hsp = Approach(hsp, 0, 0.5);
	if (image_index > image_number - 1)
	{
		image_xscale *= -1;
		state = states.shoulder;
		sprite_index = spr_pepperman_shoulderstart;
		image_index = 0;
	}
}
function boss_pepperman_superattackstart()
{
	hsp = 0;
	vsp = 0;
	if (sprite_index == spr_pepperman_shoulderstart && image_index > image_number - 1)
	{
		sprite_index = spr_pepperman_shoulderloop;
		image_index = 0;
	}
	var _spd = 12;
	var edge = 32;
	var tx = (x > (room_width / 2)) ? (room_width - edge) : edge;
	x = Approach(x, tx, 8);
	y = Approach(y, targetplayer.y, _spd);
	image_xscale = (x > (room_width / 2)) ? 1 : -1;
	if x == tx
	{
		state = states.superattackcharge;
		sprite_index = spr_pepperman_shoulderloop;
		image_xscale = (x > (room_width / 2)) ? -1 : 1;
	}
}
function boss_pepperman_superattackcharge()
{
	hsp = 0;
	vsp = 0;
	var _spd = 12;
	y = Approach(y, targetplayer.y, _spd);
	if superattack_buffer > 0
		superattack_buffer--;
	else
	{
		state = states.superslam;
		sprite_index = spr_pepperman_shoulderloop;
		image_index = 0;
	}
}
function boss_pepperman_superslam()
{
	image_speed = 0.35;
	var ss_spd = 16;
	var d = point_direction(x, y, targetplayer.x, targetplayer.y);
	hsp = lengthdir_x(ss_spd, d);
	vsp = lengthdir_y(ss_spd, d);
	if hsp != 0
		image_xscale = sign(hsp);
}
function boss_pepperman_fistmatch()
{
	x = hitX;
	y = hitY;
	hsp = 0;
	vsp = 0;
	if fist_buffer > 0
		fist_buffer--;
	else
	{
		obj_bosscontroller.player_hp -= fist_dmg;
		sprite_index = spr_pepperman_shoulderstart;
		fist_buffer = fist_max;
		with obj_camera
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
		instance_create(other.x, other.y, obj_parryeffect);
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddiegibs);
		instance_create(x, y, obj_baddiegibs);
		instance_create(x, y, obj_baddiegibs);
	}
	if (sprite_index != idlespr && image_index > image_number - 1)
		sprite_index = idlespr;
	if fistmatch_buffer > 0
	{
		fistmatch_buffer--;
		with lastplayerid
		{
			hsp = 0;
			vsp = 0;
			x = hitX;
			y = hitY;
			if sprite_index == spr_idle
			{
				if key_slap2
				{
					with obj_camera
					{
						shake_mag = 3;
						shake_mag_acc = 3 / room_speed;
					}
					sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
					image_index = 0;
					other.fist_buffer += 8;
					other.hp -= other.fist_dmg_player;
					instance_create(other.x, other.y, obj_parryeffect);
					instance_create(x, y, obj_slapstar);
					instance_create(x, y, obj_slapstar);
					instance_create(x, y, obj_baddiegibs);
					instance_create(x, y, obj_baddiegibs);
					if other.hp <= 0
					{
						with other
							boss_destroy(lastplayerid);
					}
				}
			}
			else if (image_index > image_number - 1)
				sprite_index = spr_idle;
		}
	}
	else
	{
		var lag = 20;
		with lastplayerid
		{
			sprite_index = spr_idle;
			state = states.fistmatchend;
			x = hitX;
			y = hitY;
			hithsp = other.image_xscale * 8;
			hitvsp = -4;
			hitLag = lag;
		}
		sprite_index = idlespr;
		state = states.fistmatchend;
		x = hitX;
		y = hitY;
		hithsp = -image_xscale * 8;
		hitvsp = -4;
		hitLag = lag;
	}
}
function boss_pepperman_fistmatchend()
{
	state_boss_arenaround();
	var c = false;
	with obj_player
	{
		state_player_arenaround();
		if hsp == 0
			c = true;
	}
	if c && hsp == 0
	{
		state = states.normal;
		with obj_player
			state = states.normal;
	}
}
function boss_pepperman_summonbricks()
{
	instance_create(room_width / 2, -64, obj_peppermanbrick);
	instance_create(room_width / 5, -64, obj_peppermanbrick);
	instance_create(room_width - (room_width / 5), -64, obj_peppermanbrick);
}
