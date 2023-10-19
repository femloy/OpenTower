if (!instance_exists(bossID) && bossID != -4 && state != states.victory && !fakedeath)
{
	state = states.victory;
	alarm[1] = room_speed * 4;
}
if (player_hp <= 0)
{
	fakedeath = false;
	if (state != states.transition && state != states.dead)
	{
		if (endroundfunc != -4)
			endroundfunc();
		depth = obj_player1.depth + 1;
		state = states.transition;
		with (bossID)
			player_destroy(lastplayerid);
	}
	else if (bossID.state != states.chainsaw && state != states.dead)
	{
		state = states.dead;
		alarm[1] = room_speed * 4;
	}
}
if (instance_exists(bossID))
{
	if (bossID.destroyed && !fakedeath)
	{
		depth = bossID.depth + 1;
		state = states.transition;
	}
}
switch (state)
{
	case states.arenaintro:
		with (obj_player)
		{
			state = states.actor;
			xscale = (x > (room_width / 2)) ? -1 : 1;
			image_blend = make_colour_hsv(0, 0, 255);
		}
		with (par_boss)
		{
			state = states.actor;
			x = xstart;
		}
		if (playerx != 0)
			playerx += 5;
		else if (!flashed)
		{
			flash = true;
			flashed = true;
			alarm[2] = 0.15 * room_speed;
		}
		if (bossx != (room_width - sprite_get_width(bossspr)))
			bossx -= 5;
		if (vsy != 0)
			vsy += 5;
		flamey -= 4;
		if (intro_buffer > 0)
			intro_buffer--;
		else if (use_countdown)
			state = states.arenaround;
		else
		{
			state = states.normal;
			with (obj_player)
			{
				if (object_index != obj_player2 || global.coop)
					state = states.normal;
			}
			with (par_boss)
				state = states.normal;
		}
		break;
	case states.arenaround:
		var round_yto = 437;
		round_y = Approach(round_y, round_yto, 7);
		if (round_y != round_yto)
			round_x = round_xstart + irandom_range(-1, 1);
		if (timer_buffer > 0)
		{
			if (bell_buffer > 0)
			{
				if (bell_index > (sprite_get_number(bell_sprite) - 1))
					bell_index = sprite_get_number(bell_sprite) - 1;
				bell_buffer--;
			}
			else
			{
				bell_sprite = spr_bosstimer_bell;
				round_timer = Approach(round_timer, round_timermax, 60);
			}
			timer_buffer--;
			instance_destroy(obj_noisebossbomb);
			with (obj_player)
			{
				if (state != states.actor && state != states.comingoutdoor && state != states.hit && !instance_exists(obj_fadeout))
				{
					if (state == states.hit || state == states.chainsaw)
					{
						hitLag = 0;
						x = hitX;
						y = hitY;
					}
					movespeed = 0;
					hsp = 0;
					vsp = 0;
					sprite_index = spr_idle;
					image_speed = 0.35;
					xscale = (x > (room_width / 2)) ? -1 : 1;
					image_blend = make_colour_hsv(0, 0, 255);
					state = states.actor;
					visible = true;
					image_alpha = 1;
				}
				if (state == states.actor)
					state_player_arenaround();
			}
			with (par_boss)
			{
				if (state == states.hit || state == states.chainsaw)
				{
					hitLag = 0;
					x = hitX;
					y = hitY;
				}
				if (colliding && state != states.cardboard && state != states.cardboardend)
				{
					state = states.arenaround;
					attack_cooldown = attack_max[phase - 1];
				}
			}
		}
		else
		{
			if (startroundfunc != -4)
				startroundfunc();
			minutes = maxminutes;
			seconds = maxseconds;
			round_timer = round_timermax;
			bell_sprite = spr_bosstimer_bell;
			alarm[0] = 1;
			state = states.normal;
			with (obj_player)
			{
				if (object_index == obj_player1 || global.coop)
					state = states.normal;
			}
			with (par_boss)
				state = states.normal;
		}
		break;
	case states.normal:
		bell_sprite = spr_bosstimer_bell;
		round_y = Approach(round_y, round_ystart, 4);
		if (super >= supermax && obj_player.state != states.playersuperattack)
		{
			var p = false;
			with (obj_player)
			{
				if (!p && key_shoot2 && check_player_coop())
				{
					other.super = 0;
					p = true;
					state = states.playersuperattack;
					superattackstate = states.transition;
					var lag = 60;
					hitX = x;
					hitY = y;
					hitLag = lag;
					bossID = other.bossID;
					other.super_portrait_state = 1;
					with (instance_create(x, y, obj_finishereffect))
						playerid = other.id;
					with (bossID)
					{
						hitX = x;
						hitY = y;
						hitLag = lag;
						state = states.playersuperattack;
						sprite_index = stunfallspr;
					}
				}
			}
		}
		bg_super_y -= 20;
		if (bg_super_y < -540)
			bg_super_y = 0;
		switch (super_portrait_state)
		{
			case 0:
				super_portrait_index = 0;
				super_portrait_x = super_portrait_x_off;
				break;
			case 1:
				super_portrait_index += 0.35;
				super_portrait_x = Approach(super_portrait_x, super_portrait_xstart, 40);
				if (super_portrait_x == super_portrait_xstart)
					super_portrait_state = 2;
				break;
			case 2:
				super_portrait_index += 0.35;
				super_portrait_x += 1;
				if (obj_player.state != states.playersuperattack || obj_player.superattackstate != states.transition)
					super_portrait_state = 0;
				break;
		}
		break;
	case states.transition:
		instance_destroy(obj_baddiespawner);
		instance_destroy(obj_baddie);
		if (player_hp > 0)
		{
			if (!instance_exists(bossID) || bossID.state != states.hit)
			{
				fade -= 0.05;
				fade = clamp(fade, 0, 1);
			}
		}
		else
		{
			var hit = false;
			with (obj_player)
			{
				if (state == states.hit)
					hit = true;
			}
			if (!hit)
			{
				fade -= 0.05;
				fade = clamp(fade, 0, 1);
			}
		}
		break;
	case states.victory:
	case states.dead:
		fade -= 0.05;
		fade = clamp(fade, 0, 1);
		break;
}
bell_index += 0.35;
portrait1_index += 0.35;
portrait2_index += 0.35;
if (state == states.normal && instance_exists(bossID))
{
	if (obj_player1.state == states.hit || obj_player1.state == states.thrown)
		portrait1_sprite = portrait1_hurt;
	else
		portrait1_sprite = portrait1_idle;
	if (bossID.state == states.hit || bossID.state == states.stun)
		portrait2_sprite = portrait2_hurt;
	else
		portrait2_sprite = portrait2_idle;
}
else
{
	portrait1_sprite = portrait1_idle;
	portrait2_sprite = portrait2_idle;
}
