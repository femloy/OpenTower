function scr_noise_init_sounds()
{
	snd_spin = fmod_event_create_instance("event:/sfx/noise/spin");
	snd_skatestart = fmod_event_create_instance("event:/sfx/noise/skatestart");
	snd_skateloop = fmod_event_create_instance("event:/sfx/noise/skateloop");
	snd_jetpackloop = fmod_event_create_instance("event:/sfx/noise/jetpackloop");
	snd_jetpackspin = fmod_event_create_instance("event:/sfx/noise/jetpackspin");
	snd_groundpound = fmod_event_create_instance("event:/sfx/pep/groundpound");
	snd_balloon = fmod_event_create_instance("event:/sfx/noise/balloon");
	snd_droptrap = fmod_event_create_instance("event:/sfx/noise/droptrap");
	fightball_snd_buffer = 0;
}
function scr_noise_destroy_sounds()
{
	destroy_sounds([snd_spin, snd_skatestart, snd_skateloop, snd_jetpackloop, snd_jetpackspin, snd_groundpound, snd_balloon, snd_droptrap]);
}
function scr_noise_update_sounds()
{
	if (state == states.pizzahead_spinningkick)
	{
		if (!fmod_event_instance_is_playing(snd_spin))
			fmod_event_instance_play(snd_spin);
		fmod_event_instance_set_3d_attributes(snd_spin, x, y);
	}
	else
		fmod_event_instance_stop(snd_spin, true);
	if (state == states.mach2 && grounded && vsp > 0)
	{
		fmod_event_instance_stop(snd_skatestart, true);
		if (!fmod_event_instance_is_playing(snd_skateloop))
			fmod_event_instance_play(snd_skateloop);
		fmod_event_instance_set_3d_attributes(snd_skateloop, x, y);
	}
	else
		fmod_event_instance_stop(snd_skateloop, true);
	if (state == states.jetpack)
	{
		if (!fmod_event_instance_is_playing(snd_jetpackloop))
			fmod_event_instance_play(snd_jetpackloop);
		fmod_event_instance_set_3d_attributes(snd_jetpackloop, x, y);
	}
	else
		fmod_event_instance_stop(snd_jetpackloop, true);
	if (state == states.bounce)
	{
		if (!fmod_event_instance_is_playing(snd_jetpackspin))
			fmod_event_instance_play(snd_jetpackspin);
		fmod_event_instance_set_3d_attributes(snd_jetpackspin, x, y);
	}
	else
		fmod_event_instance_stop(snd_jetpackspin, true);
	if (state == states.drop)
	{
		if (!fmod_event_instance_is_playing(snd_balloon))
			fmod_event_instance_play(snd_balloon);
		fmod_event_instance_set_3d_attributes(snd_balloon, x, y);
	}
	else
		fmod_event_instance_stop(snd_balloon, true);
	if (state == states.droptrap)
	{
		if (!fmod_event_instance_is_playing(snd_droptrap))
			fmod_event_instance_play(snd_droptrap);
		fmod_event_instance_set_3d_attributes(snd_droptrap, x, y);
	}
	else
		fmod_event_instance_stop(snd_droptrap, true);
	if (sprite_index == spr_playerN_fightball)
	{
		if (fightball_snd_buffer > 0)
			fightball_snd_buffer--;
		else
		{
			fightball_snd_buffer = 15;
			fmod_event_one_shot_3d("event:/sfx/noise/fightball", x, y);
		}
	}
	else
		fightball_snd_buffer = 0;
}
function scr_noise_arenaintro()
{
	image_speed = 0.35;
	if (!skipintro)
	{
		if (!intro)
		{
			sprite_index = spr_noise_intro1;
			image_index = 0;
			intro = true;
			introbuffer = 130;
			with (obj_player1)
			{
				state = states.actor;
				hsp = 0;
				movespeed = 0;
				flash = false;
				x = roomstartx;
				image_speed = 0.35;
				xscale = 1;
				sprite_index = spr_player_gnomecutscene2;
				image_index = 0;
			}
		}
		else
		{
			if (floor(image_index) == (image_number - 1))
			{
				if (sprite_index == spr_noise_intro1)
					image_index = 16;
				else if (sprite_index == spr_noise_intro2)
					image_index = 7;
				else if (sprite_index == spr_noise_intro3)
				{
					sprite_index = spr_playerN_idle;
					introbuffer = 1;
				}
			}
			with (obj_player1)
			{
				if (floor(image_index) == (image_number - 1))
				{
					if (sprite_index == spr_player_gnomecutscene2)
						image_index = image_number - 1;
					else if (sprite_index == spr_player_gnomecutscene3)
						sprite_index = spr_player_gnomecutscene4;
					else if (sprite_index == spr_player_idlefrown)
						sprite_index = spr_idle;
				}
				hsp = 0;
				movespeed = 0;
				flash = false;
				x = roomstartx;
				if (other.sprite_index == spr_noise_intro1 && sprite_index == spr_player_gnomecutscene2 && floor(other.image_index) > 16)
				{
					sprite_index = spr_player_gnomecutscene3;
					image_index = 0;
					fmod_event_one_shot("event:/sfx/pep/screamboss");
				}
				if (other.sprite_index == spr_noise_intro2 && sprite_index != spr_player_idlefrown && sprite_index != spr_idle)
				{
					sprite_index = spr_player_idlefrown;
					image_index = 0;
				}
			}
			if (introbuffer > 0)
				introbuffer--;
			else if (sprite_index == spr_noise_intro1)
			{
				sprite_index = spr_noise_intro2;
				image_index = 0;
				introbuffer = 80;
			}
			else if (sprite_index == spr_noise_intro2)
			{
				sprite_index = spr_noise_intro3;
				image_index = 0;
				introbuffer = 80;
			}
			else if (sprite_index == spr_noise_intro3 || sprite_index == spr_playerN_idle)
			{
				state = states.walk;
				spotlightID.expand = true;
				with (obj_player)
				{
					state = states.normal;
					sprite_index = spr_idle;
				}
			}
		}
	}
	else
		scr_boss_genericintro(spr_playerN_idle);
}
function scr_noise_do_hurt(object)
{
	if (state != states.stun)
	{
		if (x != object.x)
			image_xscale = sign(object.x - x);
		if (abs(hsp) > 7)
			hsp = -image_xscale * abs(hsp);
		else
			hsp = -image_xscale * 8;
		state = states.stun;
		thrown = false;
		savedthrown = false;
		stunned = 800;
		vsp = -5;
		inv_timer = 30;
		instance_destroy(object);
	}
}
function scr_noise_walk()
{
	if (grounded)
		hsp = Approach(hsp, 0, 0.25);
	if (grounded && vsp > 0 && sprite_index == spr_playerN_hurt && flickertime > 2)
	{
		hsp = Approach(hsp, 0, 0.5);
		create_particle(x, y, particle.landcloud);
		vsp = -5;
		touchedground = true;
	}
	if (x != targetplayer.x && sprite_index != spr_playerN_bombend && (sprite_index == spr_noise_vulnerable1 || sprite_index == spr_noise_vulnerable1loop))
		image_xscale = sign(targetplayer.x - x);
	if (cooldown > 0 && flickertime <= 0 && !ballooncrash)
		cooldown--;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_facehurtup)
	{
		sprite_index = spr_playerN_facehurt;
		image_index = 0;
		if (droptrap)
			sprite_index = spr_playerN_idle;
	}
	if (floor(image_index) == (image_number - 1))
	{
		if (sprite_index == spr_playerN_bombend)
			sprite_index = spr_noise_vulnerablesmile;
		else if (sprite_index == spr_noise_vulnerable1)
			sprite_index = spr_noise_vulnerable1loop;
	}
	if (droptrap && sprite_index == spr_playerN_idle)
		image_index = 0;
	if (flickertime > 0)
		sprite_index = spr_playerN_hurt;
	else if (grounded && sprite_index != spr_playerN_facehurtup && sprite_index != spr_playerN_facehurt && sprite_index != spr_playerN_bombend && sprite_index != spr_noise_vulnerable1 && sprite_index != spr_noise_vulnerable1loop && sprite_index != spr_noise_vulnerable2)
	{
		if (sprite_index != spr_noise_vulnerablesmile)
		{
			sprite_index = spr_noise_vulnerablesmile;
			var idle = irandom(80);
			if (irandom(100) <= 25)
				fmod_event_one_shot_3d("event:/sfx/voice/noisepositive", x, y);
			if (idle >= 10 && idle < 50)
			{
				sprite_index = spr_noise_vulnerable1;
				image_index = 0;
			}
			else if (idle >= 50)
			{
				sprite_index = spr_noise_vulnerable2;
				image_index = 0;
			}
		}
	}
	woosh = false;
	if (!droptrap)
	{
		if (!ballooncrash)
		{
			if (cooldown <= 0 && flickertime <= 0)
			{
				image_index = 0;
				sprite_index = spr_playerN_spin;
				state = states.pizzahead_spinningkick;
			}
		}
		else if (flickertime <= 0)
		{
			hsp = 0;
			ballooncrash = false;
			with (obj_noisey)
			{
				instance_destroy(id, false);
				create_particle(x, y, particle.genericpoofeffect);
			}
			instance_create(0, 0, obj_noiseballooncrash);
			state = states.noiseballooncrash;
			image_xscale = (x > (room_width / 2)) ? -1 : 1;
			sprite_index = spr_noise_phasetrans1;
			image_index = 0;
			with (obj_player1)
			{
				hsp = 0;
				xscale = (x > (room_width / 2)) ? 1 : -1;
				state = states.actor;
				image_speed = 0.35;
				sprite_index = spr_noise_phasetrans1P;
				image_index = 0;
			}
		}
	}
}
function scr_noise_mach2()
{
	image_speed = abs(attackspeed / 8);
	if (image_speed < 0.2)
		image_speed = 0.2;
	hsp = image_xscale * attackspeed;
	if (attackspeed < 17 && grounded)
		attackspeed += 0.25;
	if (sprite_index == spr_playerN_mach1 && attackspeed > 6)
		sprite_index = spr_playerN_mach;
	if (!golf)
	{
		if (machbuffer > 0 && grounded && sprite_index == spr_playerN_mach)
			machbuffer--;
		else if (machbuffer == 0 && grounded && sprite_index == spr_playerN_mach)
		{
			fmod_event_one_shot_3d("event:/sfx/noise/machslide", x, y);
			state = states.machslide;
			sprite_index = spr_playerN_machslidestart;
			image_index = 0;
			attackspeed = 8;
			if (phase == 2)
			{
				sprite_index = spr_playerN_noisebombkick;
				image_index = 4;
				with (instance_create(x + (image_xscale * 20), y, obj_skateboardnoise))
					image_xscale = other.image_xscale;
			}
		}
	}
	if (skateboardjumpcooldown > 0)
		skateboardjumpcooldown--;
	if (skateboardjumpcooldown == 0 && state != states.machslide)
	{
		fmod_event_one_shot_3d("event:/sfx/pep/jump", x, y);
		vsp = -11;
		attackspeed = 8;
		image_index = 0;
		sprite_index = spr_playerN_secondjump1;
		skateboardjumpcooldown = -1;
	}
	if ((sprite_index == spr_playerN_secondjump1 || sprite_index == spr_playerN_secondjump2) && place_meeting(x + hsp, y, obj_solid))
	{
		fmod_event_one_shot_3d("event:/sfx/pep/jump", x, y);
		sprite_index = spr_playerN_walljumpstart;
		image_xscale *= -1;
		vsp = -11;
		attackspeed = 6;
		create_particle(x, y, particle.jumpdust);
	}
	if (sprite_index == spr_playerN_walljumpstart && floor(image_index) == (image_number - 1))
		sprite_index = spr_playerN_walljumpend;
	if (sprite_index == spr_playerN_secondjump1 && floor(image_index) == (image_number - 1))
		sprite_index = spr_playerN_secondjump2;
	if (grounded && vsp > 0 && (sprite_index == spr_playerN_secondjump1 || sprite_index == spr_playerN_secondjump2 || sprite_index == spr_playerN_walljumpend))
		sprite_index = spr_playerN_mach;
	var tx = targetplayer.x;
	var ix = sign(tx - x);
	if (ix != image_xscale && grounded && sprite_index == spr_playerN_mach && state != states.machslide)
	{
		if (!golf)
		{
			fmod_event_one_shot_3d("event:/sfx/noise/skateturn", x, y);
			state = states.machslide;
			sprite_index = spr_playerN_machslideboost;
			image_index = 0;
			image_speed = 0.35;
			attackspeed = 10;
			skateboardcount++;
			if (skateboardcount >= 2)
				machbuffer = 0;
		}
	}
	var gx = 130;
	if (golf && x < gx)
	{
		hsp = 0;
		state = states.golf;
		x = gx;
		sprite_index = spr_playerN_golfidle;
		image_index = 0;
		image_xscale = 1;
		with (instance_create_unique(736, 416, obj_baddiespawner))
		{
			image_xscale = -1;
			content = obj_noisebigbomb;
		}
	}
}
function scr_noise_machslide()
{
	hsp = image_xscale * attackspeed;
	if (attackspeed > 0)
		attackspeed -= 0.2;
	if (machbuffer > 0)
		machbuffer--;
	if (floor(image_index) == (image_number - 1))
	{
		if (sprite_index == spr_playerN_machslideboost)
			image_index = image_number - 1;
		else if (sprite_index == spr_playerN_machslidestart)
			sprite_index = spr_playerN_machslideend;
		else if (sprite_index == spr_playerN_machslideend || sprite_index == spr_playerN_noisebombkick)
		{
			state = states.walk;
			hsp = 0;
		}
	}
	if (sprite_index == spr_playerN_machslideboost && attackspeed <= 0)
	{
		state = states.mach2;
		attackspeed = 8;
		if (phase == 2)
			cooldown = 80;
		else
			cooldown = 100;
		sprite_index = spr_playerN_mach;
		image_index = 0;
		image_xscale *= -1;
	}
}
function scr_noise_spin()
{
	if (image_index > 2)
		hsp = image_xscale * 2;
	if (floor(image_index) == (image_number - 4) && sprite_index == spr_playerN_spin)
	{
		if (skateboardhit <= 1)
			array_push(avaiblemoves, "skateboard");
		if (jetpackhit <= 1)
			array_push(avaiblemoves, "jetpack");
		if (pogohit <= 1)
			array_push(avaiblemoves, "pogo");
		if (hotairhit <= 1)
			array_push(avaiblemoves, "hotair");
		if (array_length(avaiblemoves) <= 0)
			array_push(avaiblemoves, choose("skateboard", "jetpack", "pogo", "hotair"));
		var el = avaiblemoves[irandom_range(0, array_length(avaiblemoves) - 1)];
		if (el == "skateboard")
		{
			if (x != targetplayer.x)
				image_xscale = sign(targetplayer.x - x);
			skateboardcount = 0;
			state = states.mach2;
			sprite_index = spr_playerN_mach1;
			image_index = 0;
			attackspeed = 0;
			machbuffer = 240;
			golf = false;
			lastattack = 0;
			if (skateboardhit == 1 || phase == 2)
				skateboardjumpcooldown = 60;
		}
		else if (el == "jetpack")
		{
			fmod_event_one_shot_3d("event:/sfx/pep/jump", x, y);
			if (x != targetplayer.x)
				image_xscale = sign(targetplayer.x - x);
			state = states.jump;
			sprite_index = spr_playerN_jump;
			image_index = 0;
			vsp = -11;
			lastattack = 1;
			if (phase == 1)
			{
				if (jetpackhit == 1)
					jetpackbounce = 2;
			}
			else if (jetpackhit == 0)
				jetpackbounce = 2;
			else if (jetpackhit == 1)
				jetpackbounce = 4;
		}
		else if (el == "pogo")
		{
			fmod_event_one_shot_3d("event:/sfx/noise/pogo", x, y);
			state = states.pogo;
			sprite_index = spr_playerN_pogobounce;
			image_index = 0;
			bounced = false;
			attackspeed = 2;
			machbuffer = 240;
			lastattack = 2;
			if (pogohit == 1 || phase == 2)
				pogobomb = true;
		}
		else if (el == "hotair")
		{
			buttslamcooldown = 200;
			fmod_event_one_shot_3d("event:/sfx/pep/jump", x, y);
			state = states.dropstart;
			sprite_index = spr_playerN_doublejump;
			image_index = 0;
			vsp = -30;
			hsp = 0;
			lastattack = 3;
			if (hotairhit == 1 || phase == 2)
				dropcooldown = 60;
			else
				dropcooldown = 120;
			jetpack_y = 0;
		}
	}
}
function scr_noise_jump()
{
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_jump)
		sprite_index = spr_playerN_fall;
	hsp = 0;
	if (vsp >= 0)
	{
		fmod_event_one_shot_3d("event:/sfx/noise/jetpackstart", x, y);
		state = states.jetpackstart;
		sprite_index = spr_playerN_jetpackstart;
		image_index = 0;
	}
}
function scr_noise_jetpackstart()
{
	hsp = 0;
	vsp = 0;
	if (floor(image_index) == (image_number - 1))
	{
		state = states.jetpack;
		sprite_index = spr_playerN_jetpackboost;
		attackspeed = 14;
		var tx = targetplayer.x;
		var ty = targetplayer.y;
		if (ty < (y - 50))
		{
			tx = targetplayer.x;
			if (x == tx)
				tx += (image_xscale * 32);
			ty = y - 50;
		}
		jetpackdir = point_direction(x, y, tx, ty);
	}
}
function scr_noise_jetpack()
{
	hsp = lengthdir_x(attackspeed, jetpackdir);
	vsp = lengthdir_y(attackspeed, jetpackdir);
	if (vsp < 0)
		hsp = image_xscale * attackspeed;
	if (hsp != 0)
		image_xscale = sign(hsp);
	if (attackspeed < 15)
		attackspeed += 0.5;
	if (place_meeting(x, y + 1, obj_solid))
	{
		sprite_index = spr_playerN_jetpackslide;
		if (abs(hsp) <= 5)
			hsp = image_xscale * 6;
	}
	else
		sprite_index = spr_playerN_jetpackboost;
	if (place_meeting(x + sign(hsp), y, obj_solid))
	{
		state = states.bounce;
		vsp = -17;
		instance_create(x + (image_xscale * 20), y, obj_bangeffect);
		sprite_index = spr_playerN_noisebombspinjump;
		scr_fmod_soundeffect(snd_groundpound, x, y);
	}
}
function scr_noise_bounce()
{
	image_speed = 0.35;
	hsp = image_xscale * 10;
	if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_destructibles))
	{
		instance_create(x + (image_xscale * 20), y, obj_bangeffect);
		image_xscale *= -1;
		vsp = -10;
		scr_fmod_soundeffect(snd_groundpound, x, y);
	}
	if (jetpackbounce > 0 && grounded && vsp > 0)
	{
		scr_fmod_soundeffect(snd_groundpound, x, y);
		vsp = -8;
		jetpackbounce--;
		instance_create(x, y + 20, obj_bangeffect);
	}
	if ((grounded && vsp > 0) && jetpackbounce == 0)
	{
		if (phase == 2)
			cooldown = 80;
		else
			cooldown = 100;
		state = states.walk;
		hsp = image_xscale * 5;
		if (phase == 2)
		{
			instance_create(x, y, obj_canonexplosion);
			hsp = 0;
			sprite_index = spr_playerN_bombend;
			image_index = 0;
		}
	}
}
function scr_noise_pogo()
{
	if (!bounced)
		hsp = 0;
	else
		hsp = image_xscale * attackspeed;
	var ix = sign(targetplayer.x - x);
	if (floor(image_index) >= 4 && sprite_index == spr_playerN_pogobounce && !bounced)
	{
		vsp = -12;
		bounced = true;
		if (ix != image_xscale && ix != 0 && attackspeed <= 10)
		{
			image_xscale = ix;
			attackspeed = 10;
		}
		if (attackspeed < 16)
			attackspeed += 2;
	}
	if (machbuffer > 0)
		machbuffer--;
	if (ix != image_xscale && bounced)
	{
		if (attackspeed > 8)
			attackspeed -= 0.1;
	}
	if (pogobomb == 1 && ((image_xscale > 0 && targetplayer.x > (x - 20)) || (image_xscale < 0 && targetplayer.x < (x + 20)) || vsp > 0) && attackspeed > 10)
	{
		with (instance_create(x, y, obj_noisebombboss))
		{
			vsp = -11;
			if (x != other.targetplayer.x)
				image_xscale = -sign(x - other.targetplayer.x);
		}
		pogobomb = false;
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_pogobounce)
		sprite_index = spr_playerN_pogofall;
	if (grounded && vsp > 0 && bounced)
	{
		if (machbuffer > 0)
		{
			fmod_event_one_shot_3d("event:/sfx/noise/pogo", x, y);
			bounced = false;
			sprite_index = spr_playerN_pogobounce;
			image_index = 0;
			hsp = 0;
		}
		else
		{
			if (phase == 2)
				cooldown = 80;
			else
				cooldown = 100;
			state = states.walk;
			if (phase == 2)
			{
				fmod_event_one_shot_3d("event:/sfx/noise/noisecrusher", x, y);
				state = states.noisecrusher;
				vsp = -17;
				sprite_index = spr_noise_crusherjump;
				create_particle(x, y, particle.genericpoofeffect);
				image_index = 0;
				create_particle(x, y, particle.highjumpcloud2);
			}
		}
	}
	if (place_meeting(x + sign(hsp), y, obj_solid))
	{
		instance_create(x + (image_xscale * 20), y, obj_bangeffect);
		image_xscale *= -1;
		if (attackspeed > 8)
			attackspeed -= 1;
	}
}
function scr_noise_dropstart()
{
	hsp = 0;
	if ((floor(image_index) div 10) == 0 && cloudbuffer == 0)
	{
		create_particle(x + irandom_range(-12, 12), y + 43, particle.cloudeffect);
		cloudbuffer = 5;
	}
	if (cloudbuffer > 0)
		cloudbuffer--;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_jump)
		sprite_index = spr_playerN_fall;
	if (place_meeting(x, y, obj_solid) || vsp >= 0 || place_meeting(x, y - 1, obj_solid))
		y -= 30;
	if (y < -50)
	{
		sprite_index = spr_noisehotair;
		state = states.drop;
		jetpack_ystart = 90;
		jetpack_ydir = 1;
	}
}
function scr_noise_drop()
{
	image_speed = 0.35;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_doublejump)
		sprite_index = spr_playerN_doublejumpfall;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_noisehotairdrop)
		sprite_index = spr_noisehotair;
	var ix = sign(targetplayer.x - x);
	hsp = Approach(hsp, ix * 7, 0.4);
	vsp = 0;
	y = Approach(y, jetpack_ystart + jetpack_y, 3);
	var jy = jetpack_ydir * 16;
	jetpack_y = Approach(jetpack_y, jy, 0.5);
	if (jetpack_y == jy)
		jetpack_ydir *= -1;
	if (buttslamcooldown > 0)
		buttslamcooldown--;
	else
	{
		buttslamcooldown = 200;
		vsp = -7;
		hsp = 0;
		sprite_index = spr_playerN_bodyslamstart;
		state = states.freefall;
		image_index = 0;
		with (instance_create(x, y, obj_noisehotairempty))
			image_xscale = other.image_xscale;
	}
	if (dropcooldown > 0)
		dropcooldown--;
	else if (dropcooldown == 0 && state != states.freefall)
	{
		dropcooldown = -1;
		sprite_index = spr_noisehotairdrop;
		image_index = 0;
	}
	if (sprite_index == spr_noisehotairdrop && dropcooldown <= -1 && image_index > 3)
	{
		if (phase == 2 || hotairhit == 1)
			dropcooldown = 80;
		else
			dropcooldown = 120;
		with (instance_create(x, y, obj_noisebombboss))
		{
			fmod_event_one_shot_3d("event:/sfx/vigilante/throw", x, y);
			if (object_index == obj_noisey)
			{
				state = states.stun;
				stunned = 50;
				important = true;
			}
			if (x != other.targetplayer.x)
				image_xscale = -sign(x - other.targetplayer.x);
		}
	}
}
function scr_noise_droptrap()
{
	droptrap = false;
	hsp = 0;
	if (floor(image_index) == (image_number - 1))
	{
		instance_create(x, y, obj_canonexplosion);
		did_droptrap = true;
		buttslamcooldown = 200;
		vsp = 0;
		hsp = 0;
		sprite_index = spr_playerN_bodyslamstart;
		state = states.freefall;
		image_index = 0;
		x = obj_player1.x;
		y = 0;
		create_particle(x, y, particle.genericpoofeffect);
	}
}
function scr_noise_freefall()
{
	image_speed = 0.35;
	hsp = 0;
	if (sprite_index == spr_playerN_bodyslamstart && floor(image_index) == (image_number - 1))
	{
		sprite_index = spr_playerN_bodyslam;
		image_index = 0;
		vsp = 14;
	}
	if ((grounded && vsp > 0) && sprite_index != spr_playerN_bodyslamland)
	{
		with (obj_camera)
		{
			shake_mag = 3;
			shake_mag_acc = 5 / room_speed;
		}
		create_particle(x, y, particle.groundpoundeffect);
		sprite_index = spr_playerN_bodyslamland;
		image_index = 0;
		buttslamlandcooldown = 20;
	}
	if (buttslamlandcooldown > 0)
		buttslamlandcooldown--;
	else if (buttslamlandcooldown <= 0 && grounded)
	{
		if (phase == 2)
			cooldown = 80;
		else
			cooldown = 100;
		state = states.walk;
		image_index = 0;
		sprite_index = spr_playerN_facehurtup;
		hsp = 0;
		if (phase == 2)
		{
			if (!did_droptrap)
				droptrap = true;
			else
				did_droptrap = false;
		}
	}
}
function scr_noise_golf()
{
	hsp = 0;
	if (floor(image_index) == (image_number - 1))
	{
		if (sprite_index == spr_playerN_golfswing)
			sprite_index = spr_playerN_golfidle;
	}
	if (sprite_index != spr_playerN_golfswing)
	{
		with (obj_player)
		{
			if (place_meeting(x, y, other))
			{
				other.sprite_index = spr_playerN_golfswing;
				other.image_index = 0;
				flash = false;
				scr_hurtplayer(id);
			}
		}
	}
}
function scr_noise_noisecrusher()
{
	hsp = 0;
	if (sprite_index == spr_playerN_bodyslamstart)
		vsp = 0;
	if (vsp > 2)
		vsp += 0.5;
	if (vsp > 0 && sprite_index == spr_noise_crusherjump)
		sprite_index = spr_noise_crusherfall;
	if (sprite_index == spr_noise_crusherland && floor(image_index) == (image_number - 1))
	{
		create_particle(x, y, particle.genericpoofeffect);
		state = states.walk;
	}
	if (grounded && vsp > 0 && sprite_index != spr_noise_crusherland)
	{
		sprite_index = spr_noise_crusherland;
		image_index = 0;
		fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
		with (instance_create(x + (image_xscale * 40), y, obj_noisecrushertrail))
			image_xscale = other.image_xscale;
		with (instance_create(x - (image_xscale * 40), y, obj_noisecrushertrail))
			image_xscale = -other.image_xscale;
		with (obj_camera)
		{
			shake_mag = 5;
			shake_mag_acc = 3 / room_speed;
		}
	}
}
function scr_noise_noiseballooncrash()
{
	hsp = 0;
	with (obj_player1)
	{
		if (x != other.x)
			xscale = -sign(other.x - x);
		image_speed = 0.35;
	}
	image_speed = 0.35;
	if (floor(image_index) == (image_number - 1))
	{
		state = states.walk;
		with (obj_player1)
			state = states.normal;
		repeat (2)
		{
			with (create_debris(x + random_range(-64, 64), y + random_range(-64, 64), spr_flashdots, true))
			{
				hsp = random_range(-5, 5);
				vsp = random_range(-10, 10);
				image_speed = 0.4;
			}
		}
		create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
	}
}
function scr_noise_fightball()
{
	switch (substate)
	{
		case states.fightball:
			hsp = image_xscale * 10;
			with (obj_player1)
			{
				hsp = other.hsp;
				xscale = other.image_xscale;
			}
			if (grounded && !instance_exists(obj_jumpdust))
			{
				with (instance_create(x, y, obj_jumpdust))
					image_xscale = other.image_xscale;
			}
			if (place_meeting(x + sign(hsp), y, obj_solid))
			{
				instance_create(x + (image_xscale * 20), y, obj_bangeffect);
				image_xscale *= -1;
				fightballcount++;
				if (fightballcount >= 2)
					substate = states.walk;
			}
			break;
		case states.walk:
			with (obj_player1)
			{
				hsp = other.hsp;
				xscale = other.image_xscale;
			}
			hsp = 0;
			x = Approach(x, room_width / 2, 10);
			with (obj_player1)
			{
				x = other.x;
				hsp = 0;
			}
			if (x == (room_width / 2))
			{
				fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
				obj_player1.xscale = 1;
				obj_player1.sprite_index = obj_player1.spr_bump;
				obj_player1.hsp = -obj_player1.xscale * 5;
				introbuffer = 50;
				image_xscale = -1;
				sprite_index = spr_playerN_bump;
				hsp = -image_xscale * 5;
				substate = states.bump;
			}
			break;
		case states.bump:
			hsp = Approach(hsp, 0, 0.2);
			with (obj_player1)
				hsp = Approach(hsp, 0, 0.2);
			if (introbuffer > 0)
				introbuffer--;
			else
			{
				elitehit--;
				state = states.walk;
			}
			break;
	}
}
function scr_noise_finale()
{
	with (obj_player1)
	{
		if (sprite_index == spr_player_gnomecutscene2 && floor(image_index) == (image_number - 1))
			image_index = image_number - 1;
		if (sprite_index == spr_player_gnomecutscene3 && floor(image_index) == (image_number - 1))
			sprite_index = spr_player_gnomecutscene4;
	}
	switch (substate)
	{
		case states.fightball:
			hsp = image_xscale * 10;
			with (obj_player1)
			{
				hsp = other.hsp;
				xscale = other.image_xscale;
			}
			if (grounded && !instance_exists(obj_jumpdust))
			{
				with (instance_create(x, y, obj_jumpdust))
					image_xscale = other.image_xscale;
			}
			if (place_meeting(x + sign(hsp), y, obj_solid))
			{
				instance_create(x + (image_xscale * 20), y, obj_bangeffect);
				image_xscale *= -1;
				fightballcount++;
				if (fightballcount >= 4)
					substate = states.walk;
			}
			break;
		case states.walk:
			with (obj_player1)
			{
				hsp = other.hsp;
				xscale = other.image_xscale;
			}
			hsp = 0;
			x = Approach(x, room_width / 2, 10);
			with (obj_player1)
			{
				x = other.x;
				hsp = 0;
			}
			if (x == (room_width / 2))
			{
				fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
				var s = 8;
				obj_player1.xscale = 1;
				obj_player1.sprite_index = obj_player1.spr_bump;
				obj_player1.hsp = -obj_player1.xscale * s;
				image_xscale = -1;
				sprite_index = spr_playerN_bump;
				hsp = -image_xscale * s;
				substate = states.bump;
			}
			break;
		case states.bump:
			hsp = Approach(hsp, 0, 0.2);
			with (obj_player1)
				hsp = Approach(hsp, 0, 0.2);
			if (hsp == 0 && !instance_exists(obj_noisebosscrate))
				instance_create(x, -100, obj_noisebosscrate);
			if (instance_exists(obj_noisebosscrate) && obj_noisebosscrate.y >= (y - 10))
			{
				repeat (3)
					create_debris(obj_noisebosscrate.x, obj_noisebosscrate.y, spr_wooddebris);
				sprite_index = spr_playerN_minigunstart;
				fmod_event_one_shot_3d("event:/sfx/pep/shotgunload", x, y);
				fmod_event_one_shot_3d("event:/sfx/misc/breakblock", x, y);
				image_index = 0;
				substate = states.shotgun;
				with (obj_player1)
				{
					sprite_index = spr_player_gnomecutscene2;
					image_index = 0;
				}
				instance_destroy(obj_noisebosscrate);
			}
			break;
		case states.shotgun:
			if (floor(image_index) == (image_number - 1))
			{
				sprite_index = spr_playerN_minigunidle;
				substate = states.shotgunshoot;
				with (obj_player1)
				{
					sprite_index = spr_player_gnomecutscene3;
					image_index = 0;
					fmod_event_one_shot("event:/sfx/pep/screamboss");
				}
				layer_set_visible(layer_get_id("Assets_2"), true);
				instance_create(room_width + 100, y, obj_noisettefinale);
			}
			break;
		case states.shotgunshoot:
			with (obj_player1)
			{
				if (floor(image_index) == (image_number - 1))
					sprite_index = spr_player_gnomecutscene4;
			}
			if (obj_noisettefinale.x <= x)
			{
				create_debris(x, y, spr_minigunfall);
				substate = states.finale;
				sprite_index = spr_playerN_bump;
				with (obj_player1)
					sprite_index = spr_idle;
			}
			break;
		case states.finale:
			x = obj_noisettefinale.x + 20;
			if (x < (room_width / 5) && sprite_index != spr_playerN_bossintro)
			{
				fmod_event_one_shot("event:/sfx/voice/noisescream");
				sprite_index = spr_playerN_bossintro;
				image_index = 0;
				image_xscale = 1;
			}
			if (sprite_index == spr_playerN_bossintro && floor(image_index) >= 9)
				image_index = 7;
			with (obj_player1)
			{
				if (distance_to_object(other) > 50)
					xscale = sign(other.x - x);
			}
			break;
	}
}
function scr_noise_phase1hurt()
{
	sprite_index = spr_playerN_hurt;
	image_index = 0.35;
	scr_boss_phase1hurt(function()
	{
		layer_set_visible("Backgrounds_scroll", false);
		with (instance_create(0, 0, obj_introprop))
		{
			depth = layer_get_depth("Backgrounds_scroll");
			sprite_index = bg_noisebossBG3;
			image_speed = 1;
		}
		var ix = obj_player1.xscale;
		with (obj_player1)
		{
			hsp = 0;
			vsp = 0;
			state = states.actor;
			xscale = ix;
			image_speed = 0.35;
			sprite_index = spr_player_fightball;
			image_index = 0;
		}
		with (obj_noiseboss)
		{
			repeat (2)
			{
				with (create_debris(x + random_range(-64, 64), y + random_range(-64, 64), spr_flashdots, true))
				{
					hsp = random_range(-5, 5);
					vsp = random_range(-10, 10);
					image_speed = 0.4;
				}
			}
			x = obj_player1.x;
			y = obj_player1.y;
			hsp = 0;
			vsp = 0;
			state = states.fightball;
			fightballcount = 0;
			image_xscale = ix;
			image_speed = 0.35;
			sprite_index = spr_playerN_fightball;
			image_index = 0;
			substate = states.fightball;
		}
	});
}
