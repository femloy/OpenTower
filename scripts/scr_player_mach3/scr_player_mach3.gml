function scr_player_mach3()
{
	if sprite_index == spr_fightball
	{
		scr_player_fightball();
		exit;
	}
	switch character
	{
		case "P":										 
			var slopeaccel = 0.1;
			var slopedeccel = 0.2;
			var mach4movespeed = 20;
			var mach3movespeed = 16;
			var accel = 0.025;
			var mach4accel = 0.1;
			var jumpspeed = -11;
			var machrollspeed = 10;
			
			var mach3_spr = spr_mach4;
			if (global.swapmode && key_attack && key_fightball && !instance_exists(obj_swapmodegrab) && !instance_exists(obj_swapdeatheffect) && !instance_exists(obj_noiseanimatroniceffect) && obj_swapmodefollow.animatronic <= 0)
			{
				sprite_index = spr_fightball;
				jump_p2 = false;
				if noisecrusher
					instance_create_unique(x, y, obj_swapgusfightball);
				exit;
			}
			if !ispeppino && grounded && vsp > 0
			{
				if (sprite_index == spr_mach4 && place_meeting(x, y + 1, obj_water))
					sprite_index = spr_playerN_mach3water;
				else if (sprite_index == spr_playerN_mach3water && !place_meeting(x, y + 1, obj_water))
					sprite_index = spr_mach4;
			}
			
			if windingAnim < 2000
				windingAnim++;
			if (place_meeting(x, y + 1, obj_railparent))
			{
				var _railinst = instance_place(x, y + 1, obj_railparent);
				railmovespeed = _railinst.movespeed;
				raildir = _railinst.dir;
			}
			hsp = (xscale * movespeed) + (railmovespeed * raildir);
			if grounded
			{
				if ((scr_slope() && hsp != 0) && movespeed > 10 && movespeed < 18)
					scr_player_addslopemomentum(slopeaccel, slopedeccel);
			}
			if move == xscale && grounded
			{
				if movespeed < mach4movespeed
				{
					if mach4mode == 0
						movespeed += accel;
					else
						movespeed += mach4accel;
				}
			}
			if grounded && sprite_index == spr_playerN_skateboarddoublejump
			{
				sprite_index = mach3_spr;
				fmod_event_one_shot_3d("event:/sfx/playerN/wallbounceland", x, y);
			}
			
			mach2 = 100;
			momemtum = true;
			move = key_right + key_left;
			move2 = key_right2 + key_left2;
			if fightball == 1 && global.coop == 1
			{
				if object_index == obj_player1
				{
					x = obj_player2.x;
					y = obj_player2.y;
				}
				if object_index == obj_player2
				{
					x = obj_player1.x;
					y = obj_player1.y;
				}
			}
			if sprite_index == spr_crazyrun
			{
				if flamecloud_buffer > 0
					flamecloud_buffer--;
				else
				{
					flamecloud_buffer = 10;
					with (instance_create(x, y, obj_dashcloud))
					{
						image_xscale = other.xscale;
						sprite_index = spr_flamecloud;
					}
				}
			}
			crouchslideAnim = true;
			
			if (floor(image_index) == image_number - 1 && sprite_index == spr_playerN_skateboarddoublejump)
				image_index = image_number - 3;
			if sprite_index == spr_playerN_skateboarddoublejump && grounded && vsp > 0
				sprite_index = mach3_spr;
			
			if !key_jump2 && jumpstop == 0 && vsp < 0.5
			{
				vsp /= 20;
				jumpstop = true;
			}
			if grounded && vsp > 0
				jumpstop = false;
			if (input_buffer_jump > 0 && sprite_index != spr_mach3jump && can_jump && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
			{
				input_buffer_jump = 0;
				scr_fmod_soundeffect(jumpsnd, x, y);
				particle_set_scale(particle.jumpdust, xscale, 1);
				create_particle(x, y, particle.jumpdust, 0);
				if sprite_index != spr_fightball
				{
					image_index = 0;
					sprite_index = spr_mach3jump;
				}
				if character == "P"
					vsp = jumpspeed;
				else
					vsp = -13;
			}
			if input_buffer_jump > 0 && !can_jump && key_up && !ispeppino && character == "P" && noisedoublejump
				scr_player_do_noisecrusher();
			if fightball == 0
			{
				if (sprite_index == spr_mach3jump && floor(image_index) == image_number - 1)
					sprite_index = mach3_spr;
				if sprite_index == spr_player_Sjumpcancel && grounded
					sprite_index = mach3_spr;
				if (floor(image_index) == image_number - 1 && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach))
					sprite_index = mach3_spr;
				if sprite_index == spr_mach2jump && grounded && vsp > 0
					sprite_index = mach3_spr;
				if (sprite_index == spr_playerN_sidewayspin && floor(image_index) == image_number - 1)
					sprite_index = spr_playerN_sidewayspinend;
				if (grounded && (sprite_index == spr_playerN_sidewayspin || sprite_index == spr_playerN_sidewayspinend))
					sprite_index = mach3_spr;
				
				if movespeed > mach3movespeed && sprite_index != spr_crazyrun && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_taunt
				{
					mach4mode = true;
					flash = true;
					sprite_index = spr_crazyrun;
				}
				else if movespeed <= mach3movespeed && sprite_index == spr_crazyrun
					sprite_index = mach3_spr;
			}
			if (sprite_index == spr_crazyrun && !instance_exists(crazyruneffectid))
			{
				with (instance_create(x, y, obj_crazyrunothereffect))
				{
					playerid = other.object_index;
					other.crazyruneffectid = id;
				}
			}
			if (sprite_index == mach3_spr || sprite_index == spr_fightball)
				image_speed = 0.4;
			else if sprite_index == spr_crazyrun
				image_speed = 0.75;
			else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach)
				image_speed = 0.4;
			
			if (((!key_attack && fightball == 0 && !launched) && sprite_index != spr_dashpadmach && grounded && vsp > 0 && (character == "P" || character == "N")) || ((character == "S" && (move == 0 || move != xscale) && grounded) && fightball == 0))
			{
				sprite_index = spr_machslidestart;
				if ispeppino
					fmod_event_one_shot_3d("event:/sfx/pep/break", x, y);
				else
					fmod_event_one_shot_3d("event:/sfx/playerN/break", x, y);
				state = states.machslide;
				image_index = 0;
				launched = false;
			}
			if (move == -xscale && grounded && vsp > 0 && !launched && (character == "P" || character == "N") && fightball == 0 && sprite_index != spr_dashpadmach)
			{
				if ispeppino
					fmod_event_one_shot_3d("event:/sfx/pep/machslideboost", x, y);
				else
					fmod_event_one_shot_3d("event:/sfx/playerN/machslide", x, y);
				sprite_index = spr_mach3boost;
				state = states.machslide;
				image_index = 0;
			}
			if (scr_mach_check_dive() && fightball == 0 && (sprite_index != spr_dashpadmach || dropboost))
			{
				particle_set_scale(particle.jumpdust, xscale, 1);
				create_particle(x, y, particle.jumpdust, 0);
				flash = false;
				state = states.tumble;
				image_index = 0;
				vsp = machrollspeed;
				if !grounded
					sprite_index = spr_mach2jump;
				else
					sprite_index = spr_machroll;
				if character == "V"
					sprite_index = spr_playerV_divekickstart;
			}
			if ((!grounded && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock)) || (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock) && place_meeting(x, y + 1, obj_slope)))
			{
				var _climb = true;
				if !ispeppino
					_climb = ledge_bump(40, abs(hsp) + 1);
				if _climb
				{
					wallspeed = movespeed;
					grabclimbbuffer = 0;
					if movespeed < 1
						wallspeed = 1;
					else
						movespeed = wallspeed;
					state = states.climbwall;
				}
			}
			if (!grounded && place_meeting(x + sign(hsp), y, obj_climbablewall) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock))
			{
				var _climb = true;
				if !ispeppino
					_climb = ledge_bump(40);
				if _climb
				{
					wallspeed = movespeed;
					grabclimbbuffer = 0;
					state = states.climbwall;
				}
			}
			if input_buffer_slap > 0 && !key_up && shotgunAnim == 0 && !global.pistol && sprite_index != spr_dashpadmach
			{
				input_buffer_slap = 0;
				sprite_index = spr_suplexdash;
				suplexmove = true;
				fmod_event_instance_play(suplexdashsnd);
				particle_set_scale(particle.jumpdust, xscale, 1);
				create_particle(x, y, particle.jumpdust, 0);
				state = states.handstandjump;
				if movespeed < 5
					movespeed = 5;
				image_index = 0;
			}
			else if (input_buffer_slap > 0 && key_up && shotgunAnim == 0 && sprite_index != spr_dashpadmach && (!global.pistol || !ispeppino))
			{
				input_buffer_slap = 0;
				state = states.punch;
				image_index = 0;
				sprite_index = spr_breakdanceuppercut;
				fmod_event_instance_play(snd_uppercut);
				if ispeppino
					vsp = -10;
				else
					vsp = -21;
				movespeed = hsp;
				particle_set_scale(particle.highjumpcloud2, xscale, 1);
				create_particle(x, y, particle.highjumpcloud2, 0);
				if !ispeppino
				{
					repeat 4
					{
						with (instance_create(x + irandom_range(-40, 40), y + irandom_range(-40, 40), obj_explosioneffect))
						{
							sprite_index = spr_shineeffect;
							image_speed = 0.35;
						}
					}
				}
			}
			if input_buffer_shoot > 0 && sprite_index != spr_dashpadmach
			{
				if shotgunAnim
					scr_shotgunshoot();
				else if global.pistol
					scr_pistolshoot(states.mach3);
			}
			if ((scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_mach3solid)) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || place_meeting(x + sign(hsp), y, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_climbablewall) && grounded)
			{
				var _bump = true;
				if (ispeppino || noisemachcancelbuffer <= 0)
					_bump = ledge_bump((vsp >= 0) ? 32 : 22);
				if _bump
				{
					with obj_camera
					{
						shake_mag = 20;
						shake_mag_acc = 40 / room_speed;
					}
					with obj_baddie
					{
						if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
						{
							stun = true;
							alarm[0] = 200;
							ministun = false;
							vsp = -5;
							hsp = 0;
						}
					}
					if !fightball
					{
						sprite_index = spr_hitwall;
						fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
						fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
						hsp = 0;
						flash = false;
						state = states.bump;
						hsp = -6 * xscale;
						vsp = -6;
						mach2 = 0;
						image_index = 0;
						instance_create(x + (xscale * 15), y + 10, obj_bumpeffect);
					}
					else
					{
						fightball = false;
						with obj_player
						{
							sprite_index = spr_hitwall;
							instance_create(x + 10, y + 10, obj_bumpeffect);
							fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
							fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
							hsp = 0;
							flash = false;
							state = states.bump;
							hsp = -6 * xscale;
							vsp = -6;
							mach2 = 0;
							image_index = 0;
						}
					}
				}
			}
			break;
	}
	var b = false;
	with obj_hamkuff
	{
		if state == states.blockstance && playerid == other.id
			b = true;
	}
	if (!instance_exists(dashcloudid) && grounded && !place_meeting(x, y + 1, obj_water) && !b)
	{
		with (instance_create(x, y, obj_superdashcloud))
		{
			if other.fightball == 1
				instance_create(obj_player.x, obj_player.y, obj_slapstar);
			image_xscale = other.xscale;
			other.dashcloudid = id;
		}
	}
	if (!instance_exists(dashcloudid) && grounded && place_meeting(x, y + 1, obj_water) && !b)
	{
		with (instance_create(x, y, obj_superdashcloud))
		{
			if other.fightball == 1
				instance_create(obj_player.x, obj_player.y, obj_slapstar);
			image_xscale = other.xscale;
			sprite_index = spr_watereffect;
			other.dashcloudid = id;
		}
	}
	scr_dotaunt();
	if (!instance_exists(chargeeffectid))
	{
		with (instance_create(x, y, obj_chargeeffect))
		{
			playerid = other.object_index;
			other.chargeeffectid = id;
		}
	}
	if (sprite_index == mach3_spr || sprite_index == spr_fightball)
		image_speed = 0.4;
	else if sprite_index == spr_crazyrun
		image_speed = 0.75;
	else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
		image_speed = 0.4;
	else
		image_speed = 0.4;
	if (scr_check_superjump() && fightball == 0 && state == states.mach3 && grounded && vsp > 0 && sprite_index != spr_dashpadmach && !place_meeting(x, y, obj_dashpad))
	{
		sprite_index = spr_superjumpprep;
		state = states.Sjumpprep;
		hsp = 0;
		image_index = 0;
	}
	if global.attackstyle == 2 && key_slap2
	{
		randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7, spr_punch]);
		image_index = 0;
		state = states.lungeattack;
	}
}
