function boss_mrstick_decide_attack()
{
	if (attack_cooldown <= 0)
	{
		targetstunned = 0;
		attack_cooldown = attack_max[phase - 1];
		state = attack_pool[irandom(array_length(attack_pool) - 1)];
		switch (state)
		{
			case states.shield:
				movespeed = 0;
				hsp = 0;
				shield_buffer = shield_max;
				image_index = 0;
				sprite_index = spr_mrstick_shield;
				break;
			case states.helicopterhat:
				sprite_index = spr_mrstick_helicopterhat;
				image_index = 0;
				vsp = -14;
				image_xscale = (x > (room_width / 2)) ? -1 : 1;
				hsp = 0;
				target_x = (x > (room_width / 2)) ? (room_width / 7) : (room_width - (room_width / 7));
				movespeed = 0;
				helicopterstate = 0;
				break;
			case states.panicjump:
				sprite_index = spr_mrstick_jump;
				vsp = -11;
				image_xscale = (x > (room_width / 2)) ? -1 : 1;
				movespeed = 10;
				target_x = (x > (room_width / 2)) ? (room_width / 7) : (room_width - (room_width / 7));
				break;
			case states.jump:
				image_xscale = (x > (room_width / 2)) ? 1 : -1;
				movespeed = 12;
				vsp = -11;
				warped = false;
				break;
			case states.smokebombstart:
				image_xscale = (x > (room_width / 2)) ? -1 : 1;
				sprite_index = spr_mrstick_idle;
				image_index = 0;
				break;
			case states.springshoes:
				sprite_index = spr_mrstick_jump;
				vsp = -20;
				image_xscale = (x > (room_width / 2)) ? -1 : 1;
				movespeed = 4;
				break;
			case states.cardboard:
				with (instance_create(x, y, obj_mrstickcardboard))
				{
					image_index = other.image_index;
					image_xscale = other.image_xscale;
					depth = other.depth;
				}
				var sprw = abs(sprite_width);
				target_x = (x > (room_width / 2)) ? -sprw : (room_width + sprw);
				cardboard_buffer = cardboard_max;
				x = -400;
				y = -400;
				break;
		}
	}
}
function boss_mrstick_normal()
{
	image_speed = 0.35;
	var dx = abs(targetplayer.x - x);
	move = 0;
	if (dx < 400)
		move = -sign(targetplayer.x - x);
	if (place_meeting(x + -(image_xscale * 48), y, obj_solid))
		move = 0;
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
	if (hsp != 0)
		sprite_index = walkspr;
	else
		sprite_index = idlespr;
	if (attack_cooldown > 0)
		attack_cooldown--;
	if (dx < 325)
	{
		if (x < (room_width / 7) || x > (room_width - (room_width / 7)))
		{
			do_mockery_buffer = do_mockery_max;
			boss_mrstick_decide_attack();
		}
	}
	else if (do_mockery_buffer > 0)
		do_mockery_buffer--;
	else
	{
		do_mockery_buffer = do_mockery_max;
		mockery_buffer = mockery_max;
		state = states.mockery;
		sprite_index = spr_mrstick_tauntanim;
	}
}
function boss_mrstick_shield()
{
	if (shield_buffer > 0)
		shield_buffer--;
	else
		state = states.normal;
}
function boss_mrstick_helicopterhat()
{
	x = Approach(x, target_x, movespeed);
	switch (helicopterstate)
	{
		case 0:
			if (vsp >= 0)
			{
				vsp = 0;
				helicopterstate = 1;
				helicoptery = y;
			}
			break;
		case 1:
			vsp = 0;
			y = Wave(helicoptery - 32, helicoptery + 32, 1, 0);
			if (movespeed < helicopterspeed)
				movespeed += 0.5;
			if (floor(x) == floor(target_x))
			{
				helicopterstate = 2;
				movespeed = 0;
			}
			break;
		case 2:
			image_xscale = (x > (room_width / 2)) ? -1 : 1;
			vsp = 5;
			if (grounded)
				state = states.normal;
			break;
	}
}
function boss_mrstick_panicjump()
{
	image_speed = 0.35;
	hsp = image_xscale * movespeed;
	if (sprite_index == spr_mrstick_jump && image_index > (image_number - 1))
	{
		image_index = 0;
		sprite_index = spr_mrstick_fall;
	}
	if (x > (target_x - 16) && x < (target_x + 16))
		state = states.normal;
	if (grounded)
	{
		if (movespeed < panicjumpspeed)
			movespeed += 0.5;
		sprite_index = spr_mrstick_run;
	}
}
function boss_mrstick_jump()
{
	hsp = image_xscale * movespeed;
	if (sprite_index == spr_mrstick_jump && image_index > (image_number - 1))
	{
		image_index = 0;
		sprite_index = spr_mrstick_fall;
	}
	if (!warped)
	{
		var sprw = abs(sprite_width);
		image_xscale = (x > (room_width / 2)) ? 1 : -1;
		if (x > (room_width + sprw))
		{
			if (y > (room_height + sprite_height))
				y = room_height / 4;
			x = -sprw;
			warped = true;
		}
		else if (x < -sprw)
		{
			if (y > (room_height + sprite_height))
				y = room_height / 4;
			x = room_width + sprw;
			warped = true;
		}
		else if (y > (room_height + sprite_height))
		{
			x = (image_xscale == 1) ? -sprw : (room_width + sprw);
			y = room_height / 4;
		}
	}
	else
	{
		if (y > (room_height + sprite_height))
			y = room_height / 4;
		if (scr_solid(x, y + vsp) && !scr_solid(x, y))
			state = states.normal;
	}
	if (vsp < 20)
		vsp += grav;
}
function boss_mrstick_smokebombstart()
{
	hsp = 0;
	if (image_index > (image_number - 1))
	{
		movespeed = 12;
		sprite_index = spr_mrstick_run;
		image_index = 0;
		target_x = (x > (room_width / 2)) ? (room_width / 7) : (room_width - (room_width / 7));
		state = states.smokebombcrawl;
		with (instance_create(x, y, obj_chainsawpuff))
		{
			image_speed = 0.1;
			image_alpha = 1;
			vspeed = 0;
			image_xscale = 8;
			image_yscale = 8;
			depth = other.depth - 10;
		}
	}
}
function boss_mrstick_smokebombcrawl()
{
	hsp = image_xscale * movespeed;
	if (x > (target_x - 16) && x < (target_x + 16))
	{
		state = states.normal;
		movespeed = 6;
	}
}
function boss_mrstick_springshoes()
{
	hsp = image_xscale * movespeed;
	if (sprite_index == spr_mrstick_jump && image_index > (image_number - 1))
	{
		image_index = 0;
		sprite_index = spr_mrstick_fall;
	}
	var tx = room_width / 2;
	if (movespeed > 0 && x > (tx - 16) && x < (tx + 16))
		movespeed -= 0.5;
	if (grounded)
	{
		hsp = 0;
		movespeed = 0;
		state = states.stun;
		stunned = 100;
		sprite_index = spr_mrstick_hurt;
		with (obj_camera)
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
	}
}
function boss_mrstick_cardboard()
{
	x = -400;
	y = -400;
	vsp = 0;
	hsp = 0;
	if (cardboard_buffer > 0 && instance_exists(obj_mrstickcardboard))
		cardboard_buffer--;
	else
	{
		instance_destroy(obj_mrstickcardboard);
		cardboard_buffer = 0;
		state = states.cardboardend;
		movespeed = 8;
		x = target_x;
		image_xscale = (x < (room_width / 2)) ? 1 : -1;
		y = room_height / 3;
	}
}
function boss_mrstick_cardboardend()
{
	hsp = image_xscale * movespeed;
	if (scr_solid(x, y + vsp) && !scr_solid(x, y))
	{
		state = states.normal;
		instance_destroy(obj_spike);
	}
	if (vsp < 20)
		vsp += grav;
}
function boss_mrstick_mockery()
{
	hsp = 0;
	targetstunned = 0;
	if (mockery_buffer > 0)
		mockery_buffer--;
	else
		state = states.normal;
}
