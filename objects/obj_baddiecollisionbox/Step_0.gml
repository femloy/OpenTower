if (!instance_exists(baddieID) && room != custom_lvl_room)
{
	instance_destroy();
	exit;
}
if (instance_exists(baddieID))
{
	x = baddieID.x;
	y = baddieID.y;
	image_xscale = baddieID.image_xscale;
}
if (instance_exists(baddieID) && place_meeting(x, y, obj_player) && obj_player.cutscene == 0)
{
	if baddieID.state != states.grabbed && !baddieID.invincible && baddieID.state != states.ghostpossess
	{
		with obj_player
		{
			var _obj_player = id;
			var _playerindex = (object_index == obj_player1) ? 1 : 2;
			if (instance_exists(other.baddieID) && y < other.baddieID.y && other.baddieID.stompbuffer <= 0 && attacking == 0 && !global.kungfu && sprite_index != spr_player_mach2jump && ((state == states.boots && vsp > 0) || state == states.jump || (isgustavo && ratmount_movespeed < 12 && state == states.ratmountjump) || state == states.mach1 || state == states.grab) && vsp > 0 && sprite_index != spr_stompprep && !other.baddieID.invincible && other.baddieID.stompable)
			{
				fmod_event_one_shot_3d("event:/sfx/enemies/stomp", x, y);
				image_index = 0;
				other.baddieID.stompbuffer = 15;
				if other.baddieID.object_index != obj_tank
				{
					if x != other.baddieID.x
						other.baddieID.image_xscale = -sign(other.baddieID.x - x);
					other.baddieID.hsp = xscale * 5;
					if other.baddieID.vsp >= 0 && other.baddieID.grounded
						other.baddieID.vsp = -5;
					other.baddieID.state = states.stun;
					if other.baddieID.stunned < 100
						other.baddieID.stunned = 100;
					other.baddieID.xscale = 1.4;
					other.baddieID.yscale = 0.6;
				}
				if other.baddieID.object_index == obj_pizzaball
				{
					with other.baddieID
						global.golfhit++;
				}
				if (key_jump2 || input_buffer_jump > 0)
				{
					instance_create(x, y + 50, obj_stompeffect);
					stompAnim = true;
					vsp = -14;
					if state == states.jump
					{
						jumpstop = true;
						sprite_index = spr_stompprep;
					}
				}
				else
				{
					instance_create(x, y + 50, obj_stompeffect);
					stompAnim = true;
					vsp = -9;
					if state == states.jump
					{
						jumpstop = true;
						sprite_index = spr_stompprep;
					}
				}
				if isgustavo
				{
					jumpAnim = true;
					jumpstop = true;
					instance_destroy(other.baddieID);
					if brick
						sprite_index = spr_player_ratmountmushroombounce;
					else
						sprite_index = spr_lonegustavo_jumpstart;
					state = states.ratmountjump;
					image_index = 0;
				}
			}
			if (instance_exists(other.baddieID) && other.baddieID.invtime == 0 && ((other.baddieID.object_index != obj_bigcheese && other.baddieID.object_index != obj_pepbat) || state != states.tumble) && ((state == states.handstandjump && global.attackstyle == 1) || instakillmove == 1) && other.baddieID.state != states.grabbed && !other.baddieID.invincible && other.baddieID.instantkillable)
				Instakill();
			else if (instance_exists(other.baddieID) && state == states.handstandjump && global.attackstyle == 0 && other.baddieID.invtime <= 0 && !other.baddieID.invincible)
			{
				swingdingthrow = false;
				image_index = 0;
				if !key_up
				{
					if movespeed <= 10
						sprite_index = spr_haulingstart;
					else
						sprite_index = spr_swingding;
					if !grounded
						vsp = -6;
					swingdingendcooldown = 0;
					state = states.grab;
					baddiegrabbedID = other.baddieID;
					grabbingenemy = true;
					heavy = other.baddieID.heavy;
					other.baddieID.state = states.grabbed;
					other.baddieID.grabbedby = _playerindex;
					with other.baddieID
					{
						if (object_index == obj_pepperman || object_index == obj_noiseboss || object_index == obj_vigilanteboss || object_index == obj_pizzafaceboss || object_index == obj_fakepepboss || object_index == obj_pizzafaceboss_p3)
							scr_boss_grabbed();
					}
				}
				else if key_up
				{
					baddiegrabbedID = other.baddieID;
					grabbingenemy = true;
					other.baddieID.state = states.grabbed;
					other.baddieID.grabbedby = _playerindex;
					sprite_index = spr_piledriver;
					vsp = -14;
					state = states.superslam;
					image_index = 0;
					image_speed = 0.35;
				}
			}
			else if state == states.handstandjump && global.attackstyle == 3 && !other.baddieID.invincible
			{
				var _ms = movespeed;
				movespeed = 0;
				baddiegrabbedID = other.baddieID;
				grabbingenemy = true;
				var _prevstate = other.baddieID.state;
				other.baddieID.state = states.grabbed;
				other.baddieID.grabbedby = _playerindex;
				heavy = other.baddieID.heavy;
				if global.pummeltest
				{
					if image_index > 6
					{
						if key_up
						{
							state = states.finishingblow;
							sprite_index = spr_uppercutfinishingblow;
							image_index = 4;
							movespeed = 0;
						}
						else if key_down
						{
							sprite_index = spr_piledriver;
							vsp = -5;
							state = states.superslam;
							image_index = 4;
							image_speed = 0.35;
						}
						else
						{
							state = states.finishingblow;
							sprite_index = spr_player_lungehit;
							image_index = 0;
						}
					}
					else
					{
						other.baddieID.state = _prevstate;
						grabbingenemy = false;
						movespeed = _ms;
					}
				}
				else
				{
					image_index = 0;
					if key_up
					{
						state = states.finishingblow;
						sprite_index = spr_uppercutfinishingblow;
						image_index = 4;
						movespeed = 0;
					}
					else if key_down
					{
						sprite_index = spr_piledriver;
						vsp = -5;
						state = states.superslam;
						image_index = 4;
						image_speed = 0.35;
					}
					else
					{
						state = states.finishingblow;
						sprite_index = spr_player_lungehit;
						image_index = 0;
					}
				}
			}
			if (place_meeting(x, y + 1, other) && state == states.pogo && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_playerN_pogobounce && !other.baddieID.invincible)
			{
				switch pogochargeactive
				{
					case 0:
						pogospeedprev = false;
						other.baddieID.vsp = -3;
						fmod_event_one_shot_3d("event:/sfx/enemies/stomp", x, y);
						other.baddieID.state = states.stun;
						if other.baddieID.stunned < 100
							other.baddieID.stunned = 100;
						sprite_index = spr_playerN_pogobounce;
						break;
					case 1:
						pogospeedprev = false;
						scr_throwenemy();
						sprite_index = spr_playerN_pogobouncemach;
						break;
				}
				instance_create(x, y + 50, obj_stompeffect);
				image_index = 0;
				movespeed = 0;
				vsp = 0;
			}
			var pepp_grab = false;
			if (character == "M" && instance_exists(other.baddieID) && (state == states.normal || state == states.jump) && pepperman_grabID == noone && sprite_index != spr_pepperman_throw && other.baddieID.state == states.stun && other.baddieID.stuntouchbuffer == 0 && !other.baddieID.thrown && !other.baddieID.invincible)
			{
				other.baddieID.pepperman_grab = true;
				pepperman_grabID = other.baddieID.id;
				other.baddieID.state = states.grabbed;
				other.baddieID.grabbedby = _playerindex;
				pepp_grab = true;
			}
			if (instance_exists(other.baddieID) && other.baddieID.object_index != obj_bigcheese && state != states.chainsaw && (state == states.tumble || state == states.mach2 || state == states.machslide || sprite_index == spr_player_ratmountattack || sprite_index == spr_lonegustavo_dash) && other.baddieID.state != states.punch && other.baddieID.state != states.hit && !pepp_grab && other.baddieID.thrown == 0 && other.baddieID.stuntouchbuffer <= 0 && other.baddieID.state != states.grabbed && other.baddieID.state != states.chainsawbump && other.baddieID.state != states.chainsaw && !other.baddieID.invincible)
			{
				var lag = 0;
				other.baddieID.stuntouchbuffer = 15;
				with other.baddieID
				{
					fmod_event_one_shot_3d("event:/sfx/pep/mach2bump", x, y);
					xscale = 0.8;
					yscale = 1.3;
					instance_create(x, y, obj_bangeffect);
					state = states.hit;
					image_xscale = -other.xscale;
					hithsp = other.xscale * 12;
					hitvsp = (other.y - 180 - y) / 60;
					hitLag = lag;
					hitX = x;
					hitY = y;
					invtime = lag + 5;
					mach2 = true;
				}
				tauntstoredstate = state;
				tauntstoredsprite = sprite_index;
				tauntstoredmovespeed = movespeed;
				tauntstoredvsp = vsp;
				state = states.chainsaw;
				hitLag = lag;
				global.combotimepause = 15;
				hitX = x;
				hitY = y;
				repeat 2
				{
					with (create_debris(x, y, spr_slapstar))
						vsp = irandom_range(-6, -11);
				}
			}
			if (character != "M" && instance_exists(other.baddieID) && state == states.grabbing && !other.baddieID.invincible)
			{
				if (instance_exists(other.baddieID) && y < (other.baddieID.y - 50) && attacking == 0 && state != states.handstandjump && other.baddieID.state != states.grabbed && sprite_index != spr_player_mach2jump && (state == states.jump || state == states.mach1 || (state == states.grab && sprite_index != spr_swingding)) && vsp > 0 && (other.baddieID.vsp >= 0 || other.baddieID.object_index == obj_farmerbaddie || other.baddieID.object_index == obj_farmerbaddie2 || other.baddieID.object_index == obj_farmerbaddie3) && sprite_index != spr_stompprep && !other.baddieID.invincible)
				{
					fmod_event_one_shot_3d("event:/sfx/enemies/stomp", x, y);
					if x != other.baddieID.x
						other.baddieID.image_xscale = -sign(other.baddieID.x - x);
					image_index = 0;
					other.baddieID.state = states.stun;
					if other.baddieID.stunned < 100
						other.baddieID.stunned = 100;
					if key_jump2
					{
						instance_create(x, y + 50, obj_stompeffect);
						stompAnim = true;
						other.baddieID.image_index = 0;
						vsp = -14;
						if state != states.grab
							sprite_index = spr_stompprep;
					}
					else
					{
						instance_create(x, y + 50, obj_stompeffect);
						stompAnim = true;
						other.baddieID.image_index = 0;
						vsp = -9;
						if state != states.grab
							sprite_index = spr_stompprep;
					}
				}
				if (other.baddieID.thrown == 0 && (character == "P" || character == "N") && !other.baddieID.invincible)
				{
					movespeed = 0;
					image_index = 0;
					sprite_index = spr_haulingstart;
					heavy = other.baddieID.heavy;
					state = states.grab;
					other.baddieID.state = states.grabbed;
					other.baddieID.grabbedby = _playerindex;
				}
			}
		}
	}
}
