enum noisedis // noise_behaviour
{
	none,
	close,
	far,
	anywhere
}

// functions
function boss_noise_decide_attack()
{
	if (attack_cooldown > 0)
		attack_cooldown--;
	else if (attack_cooldown == 0)
	{
		current_attack = get_attack();
		var c = attack_type[current_attack];
		current_behaviour = c[angry];
		attack_cooldown = -1;
	}
}
function get_attack()
{
	var chance = irandom(100) > 40;
	var c = noisedis.none;
	if (chance)
		c = attack_pool[phase - 1][irandom(array_length(attack_pool[phase - 1]) - 1)];
	else
	{
		var minphase = !angry ? 0 : 6;
		var p = irandom(phase - 2);
		p = clamp(p, minphase, max_phase - 1);
		c = attack_pool[p][irandom(array_length(attack_pool[p]) - 1)];
	}
	return c;
}
function boss_noise_do_attack()
{
	targetstunned = 0;
	state = current_attack;
	attack_cooldown = attack_max[phase - 1];
	current_behaviour = noisedis.none;
	image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
	if (!angry)
		noise_do_attack_normal();
	else
		noise_do_attack_angry();
}
function noise_do_attack_normal()
{
	switch (state)
	{
		case states.handstandjump:
			slide = irandom(100) > 50;
			movespeed = 15;
			sprite_index = spr_playerN_spin;
			image_index = 0;
			break;
		
		case states.jump:
			slidejump = 1;
			movespeed = 6;
			vsp = -11;
			sprite_index = spr_playerN_jump;
			image_index = 0;
			break;
		
		case states.skateboard:
			skateboard_turns = 0;
			movespeed = 0;
			sprite_index = spr_playerN_mach1;
			image_index = 0;
			break;
		
		case states.skateboardturn:
			state = states.skateboard;
			skateboard_turns = 1;
			movespeed = 0;
			sprite_index = spr_playerN_mach1;
			image_index = 0;
			break;
		
		case states.bombkick:
			state = states.throwing;
			sprite_index = spr_playerN_noisebombkick;
			image_index = 0;
			break;
		
		case states.throwing:
			sprite_index = spr_playerN_noisebombthrow;
			image_index = 0;
			with (instance_create(x, y, obj_noisebossbomb))
			{
				movespeed = 6;
				image_xscale = other.image_xscale;
			}
			break;
		
		case states.bombpogo:
			state = states.pogo;
			bombpogo = true;
			pogospeed = 0;
			pogospeedprev = false;
			pogochargeactive = false;
			pogo_buffer = pogo_max + (room_speed * irandom(pogo_random));
			break;
		
		case states.pogo:
			bombpogo = false;
			pogospeed = 0;
			pogospeedprev = false;
			pogochargeactive = false;
			pogo_buffer = pogo_max + (room_speed * irandom(pogo_random));
			break;
		
		case states.jetpackcancel:
			state = states.jetpackstart;
			jetpackcancel = true;
			sprite_index = spr_playerN_jetpackstart;
			image_index = 0;
			movespeed = 0;
			break;
		
		case states.jetpackstart:
			jetpackcancel = false;
			sprite_index = spr_playerN_jetpackstart;
			image_index = 0;
			movespeed = 0;
			break;
		
		case states.jetpackspin:
			movespeed = 10;
			state = states.jetpackspin;
			vsp = -15;
			sprite_index = spr_playerN_noisebombspinjump;
			image_index = 0;
			particle_set_scale(particle.jumpdust, image_xscale, 1);
			create_particle(x, y, particle.jumpdust, 0);
			break;
	}
}
function noise_do_attack_angry()
{
	switch (state)
	{
		case states.handstandjump:
			spinskateboard = false;
			slide = irandom(100) > 50;
			movespeed = 15;
			spin_count = 1;
			spin_buffer = spin_max;
			sprite_index = spr_playerN_spin;
			image_index = 0;
			break;
		case states.jump:
			spinskateboard = false;
			slidejump = 1;
			slideskateboard = true;
			spin_count = 0;
			movespeed = 6;
			vsp = -11;
			sprite_index = spr_playerN_jump;
			image_index = 0;
			break;
		case states.skateboardturn:
			state = states.handstandjump;
			slide = false;
			skateboard_turns = 1;
			spinskateboard = true;
			movespeed = 15;
			spin_count = 0;
			spin_buffer = spin_max;
			sprite_index = spr_playerN_spin;
			image_index = 0;
			break;
		case states.skateboard:
			state = states.handstandjump;
			slide = false;
			spinskateboard = true;
			skateboard_turns = 0;
			movespeed = 15;
			spin_count = 0;
			spin_buffer = spin_max;
			sprite_index = spr_playerN_spin;
			image_index = 0;
			break;
		case states.bombkick:
			bombcount = 1;
			state = states.throwing;
			sprite_index = spr_playerN_noisebombkick;
			image_index = 0;
			break;
		case states.throwing:
			bombcount = 1;
			sprite_index = spr_playerN_noisebombthrow;
			image_index = 0;
			with (instance_create(x, y, obj_noisebossbomb))
			{
				movespeed = 6;
				image_xscale = other.image_xscale;
			}
			break;
		case states.bombpogo:
			state = states.pogo;
			bombpogo = true;
			pogospeed = 0;
			pogospeedprev = false;
			pogochargeactive = false;
			pogo_buffer = pogo_max + (room_speed * irandom(pogo_random));
			break;
		case states.pogo:
			bombpogo = false;
			pogospeed = 0;
			pogospeedprev = false;
			pogochargeactive = false;
			pogo_buffer = pogo_max + (room_speed * irandom(pogo_random));
			break;
		case states.jetpackcancel:
			jumpcount = 1;
			state = states.jetpackstart;
			jetpackcancel = true;
			sprite_index = spr_playerN_jetpackstart;
			image_index = 0;
			movespeed = 0;
			break;
		case states.jetpackstart:
			jetpackcancel = false;
			sprite_index = spr_playerN_jetpackstart;
			image_index = 0;
			movespeed = 0;
			break;
		case states.jetpackspin:
			jumpcount = 1;
			movespeed = 10;
			state = states.jetpackspin;
			vsp = -15;
			sprite_index = spr_playerN_noisebombspinjump;
			image_index = 0;
			particle_set_scale(particle.jumpdust, image_xscale, 1);
			create_particle(x, y, particle.jumpdust, 0);
			break;
	}
}
function noise_behaviour_none()
{
	move = 0;
	if (distance_to_object(targetplayer) < 300)
		move = -sign(targetplayer.x - x);
	if (distance_to_object(targetplayer) > 332)
		move = sign(targetplayer.x - x);
	hsp = move * movespeed;
	if (x != targetplayer.x)
		image_xscale = sign(targetplayer.x - x);
	var targetspeed = (move == image_xscale) ? (normal_spd - 2) : normal_spd;
	if (move != 0)
	{
		if (movespeed < targetspeed)
			movespeed += 0.25;
		else if (movespeed > targetspeed)
			movespeed -= 0.5;
		if (movespeed < 3)
			image_speed = 0.35;
		else if (movespeed > 3 && movespeed < 6)
			image_speed = 0.45;
		else
			image_speed = 0.6;
	}
	else if (movespeed > 0)
		movespeed -= 0.1;
	else if (movespeed <= 0)
		movespeed = 0;
	sprite_index = (hsp != 0) ? walkspr : idlespr;
	image_xscale = (hsp != 0) ? sign(hsp) : image_xscale;
	if (!grounded)
		sprite_index = fallspr;
	boss_decide_taunt(220);
}
function noise_behaviour_close()
{
	var dx = abs(targetplayer.x - x);
	move = (dx > 80) ? sign(targetplayer.x - x) : 0;
	hsp = move * movespeed;
	if (move != 0)
	{
		if (movespeed < normal_spd)
			movespeed += 0.5;
		if (movespeed < 3)
			image_speed = 0.35;
		else if (movespeed > 3 && movespeed < 6)
			image_speed = 0.45;
		else
			image_speed = 0.6;
	}
	else if (movespeed > 0)
		movespeed -= 0.1;
	else if (movespeed <= 0)
		movespeed = 0;
	sprite_index = (hsp != 0) ? walkspr : idlespr;
	image_xscale = (hsp != 0) ? sign(hsp) : image_xscale;
	if (!grounded)
		sprite_index = fallspr;
	boss_decide_taunt(220);
	if (state != states.backbreaker)
	{
		if (dx < 192 && attack_cooldown == -1)
			boss_noise_do_attack();
	}
}
function noise_behaviour_anywhere()
{
	image_speed = 0.35;
	sprite_index = idlespr;
	boss_decide_taunt(220);
	if (state != states.backbreaker)
		boss_noise_do_attack();
}
function noise_behaviour_far()
{
	var dx = abs(targetplayer.x - x);
	image_speed = 0.35;
	sprite_index = idlespr;
	if (dx < 200)
	{
		var i = 0;
		while (current_behaviour == noisedis.far)
		{
			attack_cooldown = 0;
			boss_noise_decide_attack();
			i++;
			if (i > 20)
				break;
		}
	}
	else
		boss_noise_do_attack();
}
function boss_noise_normal()
{
	boss_noise_decide_attack();
	switch (current_behaviour)
	{
		case noisedis.none:
			noise_behaviour_none();
			break;
		case noisedis.close:
			noise_behaviour_close();
			break;
		case noisedis.anywhere:
			noise_behaviour_anywhere();
			break;
		case noisedis.far:
			noise_behaviour_far();
			break;
	}
}
function boss_noise_handstandjump()
{
	image_speed = 0.35;
	hsp = image_xscale * movespeed;
	if (!spinskateboard && slidejump == 0 && movespeed > 0)
		movespeed -= 0.35;
	if (image_index > (image_number - 1))
	{
		state = states.normal;
		movespeed = 0;
		if (slidejump == 1)
		{
			movespeed = 6;
			state = states.jump;
			slidejump = 2;
			sprite_index = spr_playerN_fall;
		}
	}
	if (slide && movespeed < 10 && spin_count <= 0)
	{
		state = states.crouchslide;
		sprite_index = spr_playerN_crouchslip;
		image_index = 0;
		movespeed = 15;
	}
	if (spin_count > 0 || spinskateboard)
	{
		if (spin_buffer > 0)
			spin_buffer--;
		else if (spinskateboard)
		{
			state = states.skateboard;
			sprite_index = spr_playerN_mach3;
			image_index = 0;
			movespeed = 16;
			spinskateboard = false;
		}
		else
		{
			spin_count--;
			state = states.handstandjump;
			movespeed = 15;
			sprite_index = spr_playerN_spin;
			image_index = 0;
		}
	}
	if (place_meeting(x + sign(hsp), y, obj_solid))
	{
		state = states.bump;
		hsp = -image_xscale * 6;
		vsp = -4;
		sprite_index = bumpspr;
		image_index = 0;
	}
}
function boss_noise_crouchslide()
{
	image_speed = 0.35;
	hsp = image_xscale * movespeed;
	if (movespeed > 0)
		movespeed -= 0.35;
	else
	{
		movespeed = 0;
		state = states.normal;
		if (slideskateboard)
		{
			state = states.skateboard;
			skateboard_turns = 1;
			movespeed = 0;
			sprite_index = spr_playerN_mach1;
			image_index = 0;
		}
	}
	if (slideskateboard && place_meeting(x + (sign(hsp) * 116), y, obj_solid))
	{
		state = states.skateboardturn;
		skateboard_turns = 1;
		movespeed = 12;
		sprite_index = spr_playerN_machslideboost;
		image_index = 0;
	}
	if (place_meeting(x + sign(hsp), y, obj_solid))
	{
		state = states.bump;
		hsp = -image_xscale * 6;
		vsp = -4;
		sprite_index = bumpspr;
		image_index = 0;
	}
}
function boss_noise_jump()
{
	image_speed = 0.35;
	hsp = image_xscale * movespeed;
	if (sprite_index == spr_playerN_jump && image_index > (image_number - 1))
	{
		sprite_index = spr_playerN_fall;
		image_index = 0;
	}
	if (slidejump == 1 && vsp >= 0)
	{
		state = states.handstandjump;
		slide = false;
		sprite_index = spr_playerN_spin;
		image_index = 0;
		movespeed = 10;
	}
	if (grounded)
	{
		state = states.normal;
		if (slidejump == 2)
		{
			slidejump = 0;
			movespeed = 15;
			state = states.crouchslide;
			image_index = 0;
			sprite_index = spr_playerN_crouchslip;
		}
	}
}
function boss_noise_skateboard()
{
	image_speed = 0.35;
	hsp = image_xscale * movespeed;
	if (movespeed < 18)
		movespeed += 0.5;
	if (skateboard_turns > 0 && place_meeting(x + (sign(hsp) * 116), y, obj_solid))
	{
		state = states.skateboardturn;
		movespeed = 12;
		sprite_index = spr_playerN_machslideboost;
		image_index = 0;
	}
	if (place_meeting(x + sign(hsp), y, obj_solid))
	{
		state = states.bump;
		hsp = -image_xscale * 6;
		vsp = -4;
		sprite_index = bumpspr;
		image_index = 0;
		with (obj_camera)
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
	}
	if (sprite_index == spr_playerN_mach1 && image_index > (image_number - 1))
		sprite_index = spr_playerN_mach;
}
function boss_noise_skateboardturn()
{
	hsp = image_xscale * movespeed;
	if (movespeed > 0)
		movespeed -= 0.4;
	else
		movespeed = 0;
	image_speed = 0.35;
	if (image_index > (image_number - 1))
	{
		if (sprite_index == spr_playerN_machslideboost)
		{
			sprite_index = !angry ? spr_playerN_mach1 : spr_playerN_mach3;
			state = states.skateboard;
			skateboard_turns--;
			movespeed = !angry ? 12 : 15;
			image_xscale *= -1;
		}
	}
}
function boss_noise_throwing()
{
	image_speed = 0.35;
	hsp = image_xscale * movespeed;
	if (movespeed > 0)
		movespeed -= 0.5;
	if (sprite_index == spr_playerN_noisebombkick && floor(image_index) == 4 && !bombkick)
	{
		bombkick = true;
		with (instance_create(x + 20, y, obj_noisebossbomb))
		{
			movespeed = 10;
			kick = true;
			sprite_index = spr_playerN_noisebombslide;
			image_xscale = other.image_xscale;
		}
	}
	if (image_index > (image_number - 1))
	{
		state = states.normal;
		bombkick = false;
		if (bombcount > 0)
		{
			bombcount--;
			state = states.throwing;
			if (sprite_index == spr_playerN_noisebombkick)
			{
				sprite_index = spr_playerN_noisebombthrow;
				image_index = 0;
				with (instance_create(x, y, obj_noisebossbomb))
				{
					movespeed = 6;
					image_xscale = other.image_xscale;
				}
			}
			else
			{
				sprite_index = spr_playerN_noisebombkick;
				image_index = 0;
			}
		}
	}
}
function boss_noise_pogo()
{
	image_speed = 0.35;
	hsp = image_xscale * movespeed;
	var maxpogo = !bombpogo ? 24 : 15;
	if (movespeed < 6 && !grounded)
		movespeed += 0.5;
	if (place_meeting(x + sign(hsp), y, obj_solid))
		image_xscale *= -1;
	if (grounded && sprite_index != spr_playerN_pogobounce && sprite_index != spr_playerN_pogobouncemach)
	{
		image_index = 0;
		vsp = 0;
		movespeed = 0;
		pogospeedprev = false;
		sprite_index = pogomach ? spr_playerN_pogobouncemach : spr_playerN_pogobounce;
		create_particle(x, y, particle.landcloud, 0);
	}
	if (!pogospeedprev && (sprite_index == spr_playerN_pogobounce || sprite_index == spr_playerN_pogobouncemach) && floor(image_index) == 4)
	{
		vsp = bombpogo ? -12 : -6;
		if (pogospeed < maxpogo)
			pogospeed += !angry ? 4 : 8;
		movespeed = pogospeed;
		pogospeedprev = true;
	}
	if (image_index > (image_number - 1) && (sprite_index == spr_playerN_pogobounce || sprite_index == spr_playerN_pogobouncemach || sprite_index == spr_playerN_pogofallmach || sprite_index == spr_playerN_pogofall))
		sprite_index = pogochargeactive ? spr_playerN_pogofallmach : spr_playerN_pogofall;
	if (pogospeed > 12 && !pogochargeactive)
		pogochargeactive = true;
	if (pogospeed > maxpogo)
		pogospeed = maxpogo;
	if (bombpogo && vsp < 5 && !grounded)
	{
		var dx = abs(targetplayer.x - x);
		var tx = 64;
		if (dx < tx && !bombpogoinst)
		{
			with (instance_create(x, y, obj_noisebossbomb))
			{
				movespeed = 0;
				drop = true;
				image_xscale = other.image_xscale;
			}
			bombpogoinst = true;
		}
		else if (dx > tx)
			bombpogoinst = false;
	}
	if (pogo_buffer > 0)
		pogo_buffer--;
	else if (grounded)
	{
		movespeed = normal_spd;
		state = states.normal;
	}
}
function boss_noise_jetpackstart()
{
	image_speed = 0.5;
	hsp = 0;
	vsp = 0;
	if (image_index > (image_number - 1))
	{
		state = states.jetpack;
		movespeed = !angry ? 15 : 20;
		sprite_index = !angry ? spr_playerN_jetpackboost : spr_playerN_crazyrun;
	}
}
function boss_noise_jetpack()
{
	image_speed = 0.5;
	var maxjetpack = 15;
	hsp = image_xscale * movespeed;
	if (movespeed > maxjetpack)
		movespeed -= 0.1;
	vsp = 0;
	var tx = (y != targetplayer.y) ? sign(targetplayer.y - y) : 0;
	if (tx != 0)
		vsp = 3 * tx;
	if (place_meeting(x + sign(hsp), y, obj_solid))
	{
		state = states.bump;
		hsp = -image_xscale * 6;
		vsp = -4;
		sprite_index = bumpspr;
		image_index = 0;
		with (obj_camera)
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
	}
	if (jetpackcancel)
	{
		var dx = abs(targetplayer.x - x);
		if (dx < 200)
		{
			state = states.jetpackspin;
			vsp = -15;
			sprite_index = spr_playerN_noisebombspinjump;
			image_index = 0;
			particle_set_scale(particle.jumpdust, image_xscale, 1);
			create_particle(x, y, particle.jumpdust, 0);
		}
	}
}
function boss_noise_jetpackspin()
{
	image_speed = 0.35;
	move = 0;
	var dx = abs(targetplayer.x - x);
	if (dx > 16)
		move = sign(targetplayer.x - x);
	hsp = move * movespeed;
	if (move != 0)
	{
		if (movespeed < normal_spd)
			movespeed += 0.1;
	}
	else if (movespeed > 0)
		movespeed -= 0.1;
	else
		movespeed = 0;
	if (hsp != 0)
		image_xscale = sign(hsp);
	if (grounded)
	{
		state = states.normal;
		jetpackcancel = false;
		if (jumpcount > 0)
		{
			jumpcount--;
			movespeed = 10;
			state = states.jetpackspin;
			vsp = -15;
			sprite_index = spr_playerN_noisebombspinjump;
			image_index = 0;
			particle_set_scale(particle.jumpdust, image_xscale, 1);
			create_particle(x, y, particle.jumpdust, 0);
		}
	}
}
