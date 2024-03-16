enum pizzaface_p3_attacks
{
	jump,
	swing,
	punch,
	stomp,
	laugh
}

// functions
function scr_pizzaface_p3_init_attack(wastedhits)
{
	attack_list[wastedhits] = array_create(0);
}
function scr_pizzaface_p3_add_attack(wastedhits, attack, cooldown)
{
	array_push(attack_list[wastedhits], [attack, cooldown]);
}
function scr_pizzaface_p3_init_sounds()
{
	snd_jump = fmod_event_create_instance("event:/sfx/pizzahead/jump");
	snd_bigpunch = fmod_event_create_instance("event:/sfx/pizzahead/bigpunch");
	snd_swinging = fmod_event_create_instance("event:/sfx/pizzahead/swinging");
}
function scr_pizzaface_p3_destroy_sounds()
{
	destroy_sounds([snd_jump, snd_bigpunch, snd_swinging]);
}
function scr_pizzaface_p3_update_sounds()
{
	fmod_event_instance_set_3d_attributes(snd_jump, x, y);
	fmod_event_instance_set_3d_attributes(snd_bigpunch, x, y);
	if sprite_index == spr_pizzahead_swinging
	{
		if (!fmod_event_instance_is_playing(snd_swinging))
			fmod_event_instance_play(snd_swinging);
		fmod_event_instance_set_3d_attributes(snd_swinging, x, y);
	}
	else
		fmod_event_instance_stop(snd_swinging, true);
}
function scr_pizzaface_p3_do_player_attack(player)
{
	with player
	{
		state = states.supergrab;
		substate = states.grab;
		attackcooldown = 0;
		baddieID = other.id;
		image_index = 0;
		randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7, spr_punch]);
		punchcount = 20;
	}
	hsp = 0;
	image_xscale = -player.xscale;
	playerid = player;
	state = states.supergrab;
	substate = states.grabbed;
}
function scr_pizzaface_p3_arenaintro()
{
	with obj_player1
	{
		if (floor(image_index) == image_number - 1 && sprite_index == spr_player_levelcomplete)
			sprite_index = spr_idle;
	}
	switch introstate
	{
		case states.arenaintro:
			hsp = 0;
			vsp = 0;
			obj_player1.hsp = 0;
			if floor(image_index) == image_number - 1
			{
				image_index = image_number - 1;
				introstate = states.idle;
				introbuffer = 80;
				with obj_player1
				{
					if x != other.x
						xscale = sign(other.x - x);
					state = states.actor;
					sprite_index = spr_player_levelcomplete;
					image_index = 0;
				}
			}
			break;
		
		case states.idle:
			image_index = image_number - 1;
			if obj_player1.sprite_index != obj_player1.spr_victory
			{
				if introbuffer > 0
					introbuffer--;
				else if elitehit < maxhp
				{
					elitehit++;
					introbuffer = 10;
				}
				else
				{
					fmod_event_one_shot("event:/sfx/misc/checkpoint");
					sprite_index = spr_pizzahead_phase3_intro2;
					image_index = 0;
					introstate = states.jump;
				}
			}
			break;
		
		case states.jump:
			if (floor(image_index) >= 50)
			{
				if x != obj_player1.x
					image_xscale = sign(obj_player1.x - x);
			}
			if floor(image_index) == image_number - 1
			{
				if sprite_index == spr_pizzahead_phase3_intro2
					image_index = image_number - 1;
				else
					image_index = image_number - 3;
				with obj_player1
				{
					if sprite_index == spr_idle
					{
						sprite_index = spr_gustavo_poweringup;
						image_index = 0;
					}
					if (sprite_index == spr_gustavo_poweringup && floor(image_index) == image_number - 1)
					{
						sprite_index = spr_gustavo_grab;
						other.sprite_index = spr_pizzahead_phase3_intro3;
						other.image_index = 0;
					}
				}
			}
			with obj_player1
			{
				if sprite_index == spr_gustavo_grab
				{
					hsp = xscale * 12;
					if (abs(x - other.x) <= 50)
					{
						with other
							scr_pizzaface_p3_do_player_attack(obj_player1);
					}
				}
			}
			break;
	}
}
function scr_pizzaface_p3_fall()
{
	if grounded && vsp > 0
		state = states.walk;
}
function scr_pizzaface_p3_walk()
{
	if flickertime <= 0 && grounded && vsp > 0
	{
		image_speed = 0.35;
		if laugh <= 0
		{
			var wspeed = walkspeed;
			if vulnerable_buffer > 0
				wspeed = floor(maxwalkspeed / 2.5);
			move = sign(targetplayer.x - x);
			if move != 0
				image_xscale = move;
			walkspeed = Approach(walkspeed, maxwalkspeed, walkaccel);
			if (abs(x - targetplayer.x) < walkdisx1)
			{
				sprite_index = spr_pizzahead_phase3walkback;
				hsp = -move * wspeed;
				if move != 0 && move != -dir
					walkspeed = floor(maxwalkspeed / 2);
			}
			else if (abs(x - targetplayer.x) > walkdisx2)
			{
				sprite_index = spr_pizzahead_phase3walk;
				hsp = move * wspeed;
				if move != 0 && move != dir
					walkspeed = floor(maxwalkspeed / 2);
			}
			else
			{
				if sprite_index != spr_pizzahead_phase3walk && sprite_index != spr_pizzahead_phase3walkback
					sprite_index = spr_pizzahead_phase3walk;
				hsp = 0;
				walkspeed = 0;
			}
		}
		else
		{
			hsp = Approach(hsp, 0, 0.5);
			laugh--;
			move = sign(targetplayer.x - x);
			if move != 0
				image_xscale = move;
			if sprite_index != spr_pizzahead_intro4
			{
				sprite_index = spr_pizzahead_intro4;
				image_index = 52;
			}
			else if floor(image_index) == image_number - 1
				image_index = image_number - 1;
		}
		if cooldown > 0
			cooldown--;
		else
		{
			var arr = attack_list[wastedhits][currentattack];
			var attack = arr[0];
			var cd = arr[1];
			cooldown = cd;
			currentattack++;
			if (currentattack >= array_length(attack_list[wastedhits]))
				currentattack = 0;
			switch attack
			{
				case pizzaface_p3_attacks.laugh:
					laugh = cooldown;
					fmod_event_one_shot("event:/sfx/voice/pizzahead");
					vulnerable_buffer = laugh;
					break;
				
				case pizzaface_p3_attacks.jump:
					laugh = 0;
					vulnerable_buffer = 0;
					state = states.jump;
					fmod_event_instance_play(snd_jump);
					sprite_index = spr_pizzahead_phase3jumpstart;
					image_index = 0;
					image_speed = 0.35;
					hsp = image_xscale * (6 + wastedhits);
					walkspeed = abs(hsp);
					vsp = -(14 - floor(wastedhits * 0.5));
					break;
				
				case pizzaface_p3_attacks.swing:
					state = states.swinging;
					fmod_event_one_shot_3d("event:/sfx/pizzahead/swingstart", x, y);
					sprite_index = spr_pizzahead_swingingstart;
					image_index = 0;
					attackspeed = 0;
					break;
				
				case pizzaface_p3_attacks.punch:
					state = states.punch;
					fmod_event_one_shot_3d("event:/sfx/pizzahead/bigpunchstart", x, y);
					sprite_index = spr_pizzahead_bigpunch;
					image_index = 0;
					instance_destroy(hitboxID);
					hitboxID = -4;
					break;
				
				case pizzaface_p3_attacks.stomp:
					state = states.stomp;
					fmod_event_one_shot_3d("event:/sfx/pizzahead/giantstomp", x, y);
					sprite_index = spr_pizzahead_stomp;
					image_index = 0;
					shot = false;
					break;
			}
		}
	}
	else
	{
		vulnerable_buffer = 0;
		sprite_index = spr_pizzahead_phase3flicker;
		if grounded
			hsp = Approach(hsp, 0, 0.25);
		if grounded && vsp > 0 && flickertime > 0
		{
			hsp = Approach(hsp, 0, 0.5);
			create_particle(x, y + 33, particle.landcloud);
			vsp = -5;
			touchedground = true;
		}
	}
}
function scr_pizzaface_p3_jump()
{
	with obj_player
	{
		if (place_meeting(x, y, other))
		{
			with other
				scr_hurtplayer(other);
		}
	}
	hsp = walkspeed * image_xscale;
	if (place_meeting(x + sign(hsp), y, obj_solid))
		image_xscale *= -1;
	if (sprite_index == spr_pizzahead_phase3jumpstart && floor(image_index) == image_number - 1)
	{
		sprite_index = spr_pizzahead_phase3jump;
		image_speed = 0.1;
	}
	if sprite_index == spr_pizzahead_phase3jump
	{
		if floor(image_index) == image_number - 1
			image_index = image_number - 1;
		image_speed = abs(vsp) / 20;
	}
	if (sprite_index == spr_pizzahead_phase3jumpland && floor(image_index) == image_number - 1)
	{
		walkspeed = maxwalkspeed;
		state = states.walk;
		image_xscale *= -1;
		sprite_index = spr_pizzahead_phase3walk;
	}
	if grounded && vsp > 0 && sprite_index != spr_pizzahead_phase3jumpland && state != states.walk
	{
		sprite_index = spr_pizzahead_phase3jumpland;
		image_index = 0;
		image_speed = 0.35;
	}
}
function scr_pizzaface_p3_stomp()
{
	hsp = 0;
	if (floor(image_index) >= 20 && !shot)
	{
		shot = true;
		fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
		create_particle(x + (119 * image_xscale), y + 35, particle.groundpoundeffect);
		with obj_camera
		{
			shake_mag = 6;
			shake_mag_acc = 5 / room_speed;
		}
		with obj_player
		{
			if (place_meeting(x, y, other))
			{
				with other
					scr_hurtplayer(other);
			}
			else if grounded && vsp > 0
			{
				state = states.slipbanan;
				vsp = -17;
				movespeed = 0;
				xscale = -other.image_xscale;
				sprite_index = spr_rockethitwall;
				image_index = 0;
				state = states.slipbanan;
				instance_create(x, y + 43, obj_bangeffect);
			}
		}
	}
	if floor(image_index) == image_number - 1
		state = states.walk;
}
function scr_pizzaface_p3_punch()
{
	hsp = Approach(hsp, 0, 0.25);
	if (floor(image_index) == 15)
		hsp = image_xscale * 5;
	if (floor(image_index) >= 17 && floor(image_index) < 38 && hitboxID == noone)
	{
		fmod_event_instance_play(snd_bigpunch);
		with (instance_create(x, y, obj_forkhitbox))
		{
			sprite_index = spr_pizzahead_bigpunch;
			image_xscale = other.image_xscale;
			ID = other.id;
			other.hitboxID = id;
		}
	}
	if (floor(image_index) >= 38)
		instance_destroy(hitboxID);
	if floor(image_index) == image_number - 1
		state = states.walk;
}
function scr_pizzaface_p3_swinging()
{
	if sprite_index == spr_pizzahead_swingingstart
	{
		hsp = 0;
		if floor(image_index) == image_number - 1
		{
			hitboxID = instance_create(x, y, obj_forkhitbox);
			hitboxID.ID = id;
			hitboxID.sprite_index = spr_pizzahead_swinging;
			sprite_index = spr_pizzahead_swinging;
		}
	}
	else
	{
		hsp = image_xscale * attackspeed;
		if attackspeed < 10
			attackspeed += 0.5;
		if (place_meeting(x + hsp, y, obj_solid))
			state = states.walk;
	}
}
function scr_pizzaface_p3_throwing()
{
	hsp = 0;
	if (!place_meeting(x, y, obj_pizzaheadgetout))
	{
		if getoutbuffer > 0
			getoutbuffer--;
		else
			state = states.walk;
	}
}
function scr_pizzaface_p3_staggered()
{
	hsp = Approach(hsp, 0, 0.1);
	if cooldown > 0
		cooldown--;
	if (abs(hsp) == 0)
		state = states.walk;
}
function scr_pizzaface_p3_handstandjump()
{
	sprite_index = spr_pizzahead_bigkickstart;
	hsp = image_xscale * (10 + wastedhits);
	if attackcooldown > 0
		attackcooldown--;
	else
		state = states.normal;
}
function scr_pizzaface_p3_supergrab()
{
	hsp = Approach(hsp, 0, 0.5);
	sprite_index = spr_pizzahead_hurt;
	with playerid
	{
		image_speed = 1.2;
		if state == states.supergrab
		{
			switch substate
			{
				case states.grab:
					hsp = 0;
					vsp = 0;
					x = other.x + (other.image_xscale * 12);
					y = other.y;
					if floor(image_index) == image_number - 1
					{
						if punchcount > 0
						{
							other.hsp = -other.image_xscale * 6;
							punchcount--;
							image_index = 0;
							randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7, spr_punch]);
						}
						else if other.elitehit > 1
						{
							sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow4, spr_finishingblow5);
							substate = states.finishingblow;
							shot = false;
						}
						else
						{
							other.state = states.ending;
							state = states.ending;
							other.finale_x = x + ((other.x - x) / 2);
						}
					}
					break;
				
				case states.finishingblow:
					if (floor(image_index) >= 3 && !shot)
					{
						fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y);
						shot = true;
						with other
						{
							hitX = x;
							hitY = y;
							hithsp = -image_xscale * 25;
							hitvsp = -5;
							linethrown = true;
							state = states.hit;
							hitLag = 1;
						}
					}
					break;
			}
		}
	}
}
function scr_pizzaface_p3_finale()
{
	hsp = 0;
	vsp = 0;
	x = -200;
	y = -200;
	obj_player1.x = -200;
	obj_player1.y = -200;
	obj_player1.hsp = 0;
	obj_player1.vsp = 0;
}
