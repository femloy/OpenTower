function scr_player_mach3()
{
	switch (character)
	{
		case "P":
			if (windingAnim < 2000)
				windingAnim++;
			if (place_meeting(x, y + 1, obj_railparent))
			{
				var _railinst = instance_place(x, y + 1, obj_railparent);
				railmovespeed = _railinst.movespeed;
				raildir = _railinst.dir;
			}
			hsp = (xscale * movespeed) + (railmovespeed * raildir);
			if (grounded)
			{
				if ((scr_slope() && hsp != 0) && movespeed > 10 && movespeed < 18)
					scr_player_addslopemomentum(0.1, 0.2);
			}
			if (move == xscale && grounded)
			{
				if (movespeed < 20)
				{
					if (mach4mode == 0)
						movespeed += 0.025;
					else
						movespeed += 0.1;
				}
			}
			mach2 = 100;
			momemtum = true;
			move = key_right + key_left;
			move2 = key_right2 + key_left2;
			if (fightball == 1 && global.coop == 1)
			{
				if (object_index == obj_player1)
				{
					x = obj_player2.x;
					y = obj_player2.y;
				}
				if (object_index == obj_player2)
				{
					x = obj_player1.x;
					y = obj_player1.y;
				}
			}
			if (sprite_index == spr_crazyrun)
			{
				if (flamecloud_buffer > 0)
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
			if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
			{
				vsp /= 20;
				jumpstop = true;
			}
			if (grounded && vsp > 0)
				jumpstop = false;
			if (input_buffer_jump > 0 && sprite_index != spr_mach3jump && can_jump && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
			{
				input_buffer_jump = 0;
				scr_fmod_soundeffect(jumpsnd, x, y);
				particle_set_scale(particle.jumpdust, xscale, 1);
				create_particle(x, y, particle.jumpdust, 0);
				if (sprite_index != spr_fightball)
				{
					image_index = 0;
					sprite_index = spr_mach3jump;
				}
				if (character == "P")
					vsp = -11;
				else
					vsp = -13;
			}
			if (fightball == 0)
			{
				if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
					sprite_index = spr_mach4;
				if (sprite_index == spr_player_Sjumpcancel && grounded)
					sprite_index = spr_mach4;
				if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach))
					sprite_index = spr_mach4;
				if (sprite_index == spr_mach2jump && grounded && vsp > 0)
					sprite_index = spr_mach4;
				if (movespeed > 16 && sprite_index != spr_crazyrun && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_taunt)
				{
					mach4mode = true;
					flash = true;
					sprite_index = spr_crazyrun;
				}
				else if (movespeed <= 16 && sprite_index == spr_crazyrun)
					sprite_index = spr_mach4;
			}
			if (sprite_index == spr_crazyrun && !instance_exists(crazyruneffectid))
			{
				with (instance_create(x, y, obj_crazyrunothereffect))
				{
					playerid = other.object_index;
					other.crazyruneffectid = id;
				}
			}
			if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
				image_speed = 0.4;
			else if (sprite_index == spr_crazyrun)
				image_speed = 0.75;
			else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach)
				image_speed = 0.4;
			if (((!key_attack && fightball == 0 && !launched) && sprite_index != spr_dashpadmach && grounded && vsp > 0 && (character == "P" || character == "N")) || ((character == "S" && (move == 0 || move != xscale) && grounded) && fightball == 0))
			{
				sprite_index = spr_machslidestart;
				fmod_event_one_shot_3d("event:/sfx/pep/break", x, y);
				state = states.machslide;
				image_index = 0;
				launched = false;
			}
			if (move == -xscale && grounded && vsp > 0 && !launched && (character == "P" || character == "N") && fightball == 0 && sprite_index != spr_dashpadmach)
			{
				fmod_event_one_shot_3d("event:/sfx/pep/machslideboost", x, y);
				sprite_index = spr_mach3boost;
				state = states.machslide;
				image_index = 0;
			}
			if (key_down && fightball == 0 && sprite_index != spr_dashpadmach)
			{
				particle_set_scale(particle.jumpdust, xscale, 1);
				create_particle(x, y, particle.jumpdust, 0);
				flash = false;
				state = states.tumble;
				image_index = 0;
				vsp = 10;
				if (!grounded)
					sprite_index = spr_player_mach2jump;
				else
					sprite_index = spr_player_machroll;
				if (character == "V")
					sprite_index = spr_playerV_divekickstart;
			}
			if ((!grounded && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock)) || (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock) && place_meeting(x, y + 1, obj_slope)))
			{
				wallspeed = movespeed;
				grabclimbbuffer = 0;
				if (movespeed < 1)
					wallspeed = 1;
				else
					movespeed = wallspeed;
				state = states.climbwall;
			}
			if (!grounded && place_meeting(x + sign(hsp), y, obj_climbablewall) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock))
			{
				wallspeed = movespeed;
				grabclimbbuffer = 0;
				state = states.climbwall;
			}
			if (input_buffer_slap > 0 && !key_up && shotgunAnim == 0 && !global.pistol && sprite_index != spr_dashpadmach)
			{
				input_buffer_slap = 0;
				sprite_index = spr_suplexdash;
				suplexmove = true;
				fmod_event_instance_play(suplexdashsnd);
				particle_set_scale(particle.jumpdust, xscale, 1);
				create_particle(x, y, particle.jumpdust, 0);
				state = states.handstandjump;
				if (movespeed < 5)
					movespeed = 5;
				image_index = 0;
			}
			else if (input_buffer_slap > 0 && key_up && shotgunAnim == 0 && sprite_index != spr_dashpadmach && !global.pistol)
			{
				input_buffer_slap = 0;
				state = states.punch;
				image_index = 0;
				sprite_index = spr_player_breakdanceuppercut;
				fmod_event_instance_play(snd_uppercut);
				vsp = -10;
				movespeed = hsp;
				particle_set_scale(particle.highjumpcloud2, xscale, 1);
				create_particle(x, y, particle.highjumpcloud2, 0);
			}
			if (input_buffer_shoot > 0 && sprite_index != spr_dashpadmach)
			{
				if (shotgunAnim)
					scr_shotgunshoot();
				else if (global.pistol)
					scr_pistolshoot(states.mach3);
			}
			if ((scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_mach3solid)) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || place_meeting(x + sign(hsp), y, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_climbablewall) && grounded)
			{
				var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
				if (_bump)
				{
					with (obj_camera)
					{
						shake_mag = 20;
						shake_mag_acc = 40 / room_speed;
					}
					with (obj_baddie)
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
					if (!fightball)
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
						with (obj_player)
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
							instance_create(x + 10, y + 10, obj_bumpeffect);
						}
					}
				}
			}
			break;
		case "V":
			if (windingAnim < 2000)
				windingAnim++;
			if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
				hsp = xscale * movespeed;
			else if (place_meeting(x, y + 1, obj_railh))
				hsp = (xscale * movespeed) - 5;
			else if (place_meeting(x, y + 1, obj_railh2))
				hsp = (xscale * movespeed) + 5;
			mach2 = 100;
			momemtum = true;
			move = key_right + key_left;
			move2 = key_right2 + key_left2;
			if (fightball == 1 && global.coop == 1)
			{
				if (object_index == obj_player1)
				{
					x = obj_player2.x;
					y = obj_player2.y;
				}
				if (object_index == obj_player2)
				{
					x = obj_player1.x;
					y = obj_player1.y;
				}
			}
			if (movespeed < 24 && grounded)
			{
				if (!instance_exists(crazyruneffectid) && grounded)
				{
					with (instance_create(x, y, obj_crazyruneffect))
					{
						playerid = other.object_index;
						other.crazyruneffectid = id;
					}
					if (sprite_index == spr_crazyrun)
					{
						with (instance_create(x, y, obj_dashcloud))
						{
							image_xscale = other.xscale;
							sprite_index = spr_flamecloud;
						}
					}
				}
			}
			crouchslideAnim = true;
			if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
			{
				vsp /= 20;
				jumpstop = true;
			}
			if (grounded && vsp > 0)
				jumpstop = false;
			if (input_buffer_jump > 0 && can_jump && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
			{
				input_buffer_jump = 0;
				scr_fmod_soundeffect(jumpsnd, x, y);
				if (sprite_index != spr_fightball)
				{
					image_index = 0;
					sprite_index = spr_mach3jump;
				}
				vsp = -11;
			}
			if (fightball == 0)
			{
				if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
					sprite_index = spr_mach4;
				if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach))
					sprite_index = spr_mach4;
				if (sprite_index == spr_mach2jump && grounded && vsp > 0)
					sprite_index = spr_mach4;
				if (abs(hsp) > 20 && sprite_index != spr_crazyrun && sprite_index != spr_taunt && sprite_index != spr_player_Sjumpcancelstart)
				{
					flash = true;
					sprite_index = spr_crazyrun;
				}
				else if (abs(hsp) <= 20 && sprite_index == spr_crazyrun)
					sprite_index = spr_mach4;
			}
			if (sprite_index == spr_crazyrun && !instance_exists(crazyruneffectid))
			{
				with (instance_create(x, y, obj_crazyrunothereffect))
				{
					playerid = other.object_index;
					other.crazyruneffectid = id;
				}
			}
			if (key_jump && !grounded)
			{
				image_index = 0;
				sprite_index = spr_player_Sjumpcancelstart;
			}
			if (grounded && (sprite_index == spr_player_Sjumpcancelstart || sprite_index == spr_taunt))
				sprite_index = spr_mach4;
			if (floor(image_index) == 0 && sprite_index == spr_player_Sjumpcancelstart)
			{
				taunttimer = 20;
				tauntstoredsprite = sprite_index;
				image_index = random_range(0, 11);
				sprite_index = spr_taunt;
				with (instance_create(x, y, obj_taunteffect))
					player = other.id;
			}
			if (sprite_index == spr_taunt)
				taunttimer--;
			else
				tauntimer = 0;
			if (taunttimer <= 0 && sprite_index == spr_taunt)
				tauntstoredsprite = sprite_index;
			if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
				image_speed = 0.4;
			else if (sprite_index == spr_crazyrun)
				image_speed = 0.75;
			else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
				image_speed = 0.4;
			if (((!key_attack && fightball == 0) && grounded && vsp > 0) || ((character == "S" && (move == 0 || move != xscale) && grounded) && fightball == 0))
			{
				sprite_index = spr_machslidestart;
				fmod_event_one_shot_3d("event:/sfx/pep/break", x, y);
				state = states.machslide;
				image_index = 0;
			}
			if (move == -xscale && grounded && vsp > 0 && fightball == 0)
			{
				fmod_event_one_shot_3d("event:/sfx/pep/machslideboost", x, y);
				sprite_index = spr_mach3boost;
				state = states.machslide;
				image_index = 0;
			}
			if (key_down && fightball == 0 && !place_meeting(x, y, obj_dashpad))
			{
				particle_set_scale(particle.jumpdust, xscale, 1);
				create_particle(x, y, particle.jumpdust, 0);
				flash = false;
				state = states.machroll;
				vsp = 10;
			}
			if ((!grounded && place_meeting(x + hsp, y, obj_solid) && (!place_meeting(x + sign(hsp), y, obj_slope || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + hsp, y, obj_mach3solid))) || (grounded && (place_meeting(x + hsp, y - 32, obj_solid) || scr_solid_slope(x + sign(hsp), y - 32)) && place_meeting(x, y + 1, obj_slope) && !place_meeting(x + hsp, y, obj_mach3solid)))
			{
				wallspeed = 10;
				state = states.climbwall;
			}
			if ((scr_solid(x + 1, y) && !place_meeting(x + 1, y, obj_mach3solid) && xscale == 1) && !scr_slope() && (!place_meeting(x + sign(hsp), y, obj_slope) || place_meeting(x + sign(hsp), y, obj_solid)) && (grounded || fightball == 1))
			{
				if (fightball == 0)
				{
					sprite_index = spr_hitwall;
					fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
					fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
					with (obj_camera)
					{
						shake_mag = 20;
						shake_mag_acc = 40 / room_speed;
					}
					hsp = 0;
					image_speed = 0.35;
					with (obj_baddie)
					{
						if (point_in_camera(x, y, view_camera[0]) && shakestun && grounded && vsp > 0)
						{
							stun = true;
							alarm[0] = 200;
							ministun = false;
							vsp = -5;
							hsp = 0;
						}
					}
					flash = false;
					state = states.bump;
					hsp = -2.5;
					vsp = -3;
					mach2 = 0;
					image_index = 0;
					instance_create(x + 10, y + 10, obj_bumpeffect);
				}
				else if (fightball == 1)
				{
					with (obj_player)
					{
						sprite_index = spr_hitwall;
						fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
						fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
						with (obj_camera)
						{
							shake_mag = 20;
							shake_mag_acc = 40 / room_speed;
						}
						hsp = 0;
						image_speed = 0.35;
						with (obj_baddie)
						{
							if (point_in_camera(x, y, view_camera[0]) && shakestun && grounded && vsp > 0)
							{
								stun = true;
								alarm[0] = 200;
								ministun = false;
								vsp = -5;
								hsp = 0;
							}
						}
						flash = false;
						state = states.bump;
						hsp = -2.5;
						vsp = -3;
						mach2 = 0;
						image_index = 0;
						instance_create(x + 10, y + 10, obj_bumpeffect);
					}
					fightball = false;
				}
			}
			if ((scr_solid(x - 1, y) && !place_meeting(x - 1, y, obj_mach3solid) && xscale == -1) && !scr_slope() && (!place_meeting(x + sign(hsp), y, obj_slope) || place_meeting(x + sign(hsp), y, obj_solid)) && (grounded || fightball == 1))
			{
				if (fightball == 0)
				{
					sprite_index = spr_hitwall;
					fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
					fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
					with (obj_camera)
					{
						shake_mag = 20;
						shake_mag_acc = 40 / room_speed;
					}
					hsp = 0;
					image_speed = 0.35;
					with (obj_baddie)
					{
						if (point_in_camera(x, y, view_camera[0]) && shakestun && grounded && vsp > 0)
						{
							stun = true;
							alarm[0] = 200;
							ministun = false;
							vsp = -5;
							hsp = 0;
						}
					}
					flash = false;
					state = states.bump;
					hsp = 2.5;
					vsp = -3;
					mach2 = 0;
					image_index = 0;
					instance_create(x - 10, y + 10, obj_bumpeffect);
				}
				else if (fightball == 1)
				{
					with (obj_player)
					{
						sprite_index = spr_hitwall;
						fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
						fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
						with (obj_camera)
						{
							shake_mag = 20;
							shake_mag_acc = 40 / room_speed;
						}
						hsp = 0;
						image_speed = 0.35;
						with (obj_baddie)
						{
							if (point_in_camera(x, y, view_camera[0]) && shakestun && grounded && vsp > 0)
							{
								stun = true;
								alarm[0] = 200;
								ministun = false;
								vsp = -5;
								hsp = 0;
							}
						}
						flash = false;
						state = states.bump;
						hsp = -2.5;
						vsp = -3;
						mach2 = 0;
						image_index = 0;
						instance_create(x + 10, y + 10, obj_bumpeffect);
					}
					fightball = false;
				}
			}
			if (key_slap2 && character == "V")
			{
				vsp = -5;
				state = states.revolver;
				image_index = 0;
				sprite_index = spr_playerV_airrevolver;
				image_index = 0;
				with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
				{
					is_solid = false;
					image_xscale = other.xscale;
				}
				fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
			}
			if (key_shoot2 && character == "V" && !instance_exists(dynamite_inst))
			{
				vsp = -5;
				state = states.dynamite;
				image_index = 0;
				sprite_index = spr_playerV_dynamitethrow;
				with (instance_create(x, y, obj_dynamite))
				{
					image_xscale = other.xscale;
					playerid = other.id;
					other.dynamite_inst = id;
					movespeed = other.movespeed + 4;
					vsp = -6;
				}
			}
			break;
		case "N":
			hsp = xscale * movespeed;
			move = key_right + key_left;
			if (fightball == 0)
				vsp = 0;
			if (key_up && fightball == 0)
				vsp = -3;
			if (key_down && fightball == 0)
				vsp = 3;
			if (abs(hsp) < 24 && move == xscale)
			{
				if (!instance_exists(crazyruneffectid) && grounded)
				{
					with (instance_create(x, y, obj_crazyruneffect))
					{
						playerid = other.object_index;
						other.crazyruneffectid = id;
					}
					if (sprite_index == spr_crazyrun)
					{
						if (flamecloud_buffer > 0)
							flamecloud_buffer--;
						else
						{
							flamecloud_buffer = 220 + irandom_range(1, 180);
							with (instance_create(x, y, obj_dashcloud))
							{
								image_xscale = other.xscale;
								sprite_index = spr_flamecloud;
							}
						}
					}
				}
			}
			if (key_attack2 && character == "N" && fightball == 0)
			{
				sprite_index = spr_playerN_pogostart;
				image_index = 0;
				state = states.pogo;
				pogospeed = movespeed;
			}
			if (fightball == 0)
			{
				if (abs(hsp) > 20 && sprite_index != spr_crazyrun)
				{
					flash = true;
					sprite_index = spr_crazyrun;
				}
				else if (movespeed <= 20 && sprite_index == spr_crazyrun)
					sprite_index = spr_playerN_jetpackboost;
			}
			if (character == "N" && key_jump2 && fightball == 0)
			{
				jumpstop = false;
				vsp = -15;
				state = states.jump;
				sprite_index = spr_playerN_noisebombspinjump;
				image_index = 0;
				particle_set_scale(particle.jumpdust, xscale, 1);
				create_particle(x, y, particle.jumpdust, 0);
			}
			if (key_down && fightball == 0 && !place_meeting(x, y, obj_dashpad) && grounded)
			{
				with (instance_create(x, y, obj_jumpdust))
					image_xscale = other.xscale;
				flash = false;
				sprite_index = spr_playerN_jetpackslide;
				state = states.machroll;
			}
			if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && fightball == 1)
			{
				vsp /= 20;
				jumpstop = true;
			}
			if (grounded && vsp > 0 && fightball == 1)
				jumpstop = false;
			if (input_buffer_jump > 0 && can_jump && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1) && fightball == 1)
			{
				input_buffer_jump = 0;
				scr_fmod_soundeffect(jumpsnd, x, y);
				if (sprite_index != spr_fightball)
				{
					image_index = 0;
					sprite_index = spr_mach3jump;
				}
				vsp = -11;
			}
			if ((scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_mach3solid)) && (!place_meeting(x + sign(hsp), y, obj_slope) || place_meeting(x + sign(hsp), y, obj_solid)) && (!place_meeting(x + sign(hsp), y, obj_metalblock) && character != "V") && (!place_meeting(x + sign(hsp), y, obj_destructibles) && character != "V") && !place_meeting(x + sign(hsp), y, obj_hungrypillar))
			{
				pizzapepper = 0;
				sprite_index = spr_hitwall;
				fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
				fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
				with (obj_camera)
				{
					shake_mag = 20;
					shake_mag_acc = 40 / room_speed;
				}
				hsp = 0;
				image_speed = 0.35;
				with (obj_baddie)
				{
					if (point_in_camera(x, y, view_camera[0]) && shakestun && grounded && vsp > 0)
					{
						stun = true;
						alarm[0] = 200;
						ministun = false;
						vsp = -5;
						hsp = 0;
					}
				}
				flash = false;
				state = states.bump;
				hsp = 2.5;
				vsp = -3;
				mach2 = 0;
				image_index = 0;
				instance_create(x - 10, y + 10, obj_bumpeffect);
			}
			break;
	}
	var b = false;
	with (obj_hamkuff)
	{
		if (state == states.blockstance && playerid == other.id)
			b = true;
	}
	if (!instance_exists(dashcloudid) && grounded && !place_meeting(x, y + 1, obj_water) && !b)
	{
		with (instance_create(x, y, obj_superdashcloud))
		{
			if (other.fightball == 1)
				instance_create(obj_player.x, obj_player.y, obj_slapstar);
			image_xscale = other.xscale;
			other.dashcloudid = id;
		}
	}
	if (!instance_exists(dashcloudid) && grounded && place_meeting(x, y + 1, obj_water) && !b)
	{
		with (instance_create(x, y, obj_superdashcloud))
		{
			if (other.fightball == 1)
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
	if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
		image_speed = 0.4;
	else if (sprite_index == spr_crazyrun)
		image_speed = 0.75;
	else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
		image_speed = 0.4;
	else
		image_speed = 0.4;
	if (scr_check_superjump() && fightball == 0 && state == states.mach3 && character == "P" && grounded && vsp > 0 && sprite_index != spr_dashpadmach && !place_meeting(x, y, obj_dashpad))
	{
		sprite_index = spr_superjumpprep;
		state = states.Sjumpprep;
		hsp = 0;
		image_index = 0;
	}
	if (global.attackstyle == 2 && key_slap2)
	{
		randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7, spr_punch]);
		image_index = 0;
		state = states.lungeattack;
	}
}
