// clone vars that lag behind by a frame
prevhsp = hsp;
prevmove = move;
prevmovespeed = movespeed;
previcemovespeed = icemovespeed;
prevxscale = xscale;

// input buffers and coyote time
if key_slap2
	input_buffer_shoot = 10;
if key_slap2
	input_buffer_slap = 12;
if key_jump
	input_buffer_jump = 15;
if key_down2
	input_buffer_down = 15;
if key_attack2
	input_buffer_mach = 15;
if key_taunt_p2
	input_taunt_p2 = 5;

if grounded && vsp > 0
	coyote_time = 8;
if vsp < 0
	coyote_time = 0;
can_jump = (grounded && vsp > 0) || (coyote_time && vsp > 0);

var prevmask = mask_index;
if state != states.grab
	swingdingthrow = false;

// reset noise walljumps
if character == "P" && !ispeppino && !isgustavo
{
	if can_jump && vsp > 0
	{
		noisewalljump = 0;
		noisedoublejump = true;
	}
}

// collision flags
enum colflag
{
	secret = 1,
	sloped = 2,
	grounded = 4
	// 8, 16, 32, 64, 128, 256...
}

collision_flags = 0;
if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
	collision_flags |= colflag.secret;
if (scr_solid_player(x, y + 1))
	collision_flags |= colflag.grounded;
if (place_meeting(x, y + 1, obj_slope))
	collision_flags |= colflag.sloped;

// noise's standing superjump is just here I guess
if (character == "P" && !ispeppino && !skateboarding && ((scr_check_superjump() && key_jump2) || key_superjump) && state != states.mach3 && can_jump && vsp > 0 && (state == states.normal || state == states.mach2))
{
	sprite_index = spr_superjumpprep;
	state = states.Sjumpprep;
	hsp = 0;
	image_index = 0;
}

// state machine
switch state
{
	case states.normal:	
		scr_player_normal();
		break;
	case states.revolver:
		scr_player_revolver();
		break;
	case states.dynamite:
		scr_player_dynamite();
		break;
	case states.boots:
		scr_player_boots();
		break;
	case states.grabbed:
		scr_player_grabbed();
		break;
	case states.finishingblow:
		scr_player_finishingblow();
		break;
	case states.tumble:
		scr_player_tumble();
		break;
	case states.titlescreen:
		scr_player_titlescreen();
		break;
	case states.ejected:
		scr_player_ejected();
		break;
	case states.firemouth:
		scr_player_firemouth();
		break;
	case states.fireass:
		scr_player_fireass();
		break;
	case states.transition:
		scr_player_transitioncutscene();
		break;
	case states.hookshot:
		scr_playerN_hookshot();
		break;
	case states.slap:
		scr_player_slap();
		break;
	case states.tacklecharge:
		scr_player_tacklecharge();
		break;
	case states.cheesepep:
		scr_player_cheesepep();
		break;
	case states.cheesepepjump:
		scr_player_cheesepepjump();
		break;
	case states.cheesepepfling:
		scr_player_cheesepepfling();
		break;
	case states.cheeseball:
		scr_player_cheeseball();
		break;
	case states.cheeseballclimbwall:
		scr_player_cheeseballclimbwall();
		break;
	case states.cheesepepstickside:
		scr_player_cheesepepstickside();
		break;
	case states.cheesepepstickup:
		scr_player_cheesepepstickup();
		break;
	case states.cheesepepstick:
		scr_player_cheesepepstick();
		break;
	case states.cheesepeplaunch:
		scr_player_cheesepeplaunch();
		break;
	case states.boxxedpep:
		scr_player_boxxedpep();
		break;
	case states.boxxedpepjump:
		scr_player_boxxedpepjump();
		break;
	case states.boxxedpepspin:
		scr_player_boxxedpepspin();
		break;
	case states.bombkick:
		scr_playerN_throwkick();
		break;
	case states.pistolaim:
		scr_player_pistolaim();
		break;
	case states.climbwall:
		scr_player_climbwall();
		break;
	case states.knightpepslopes:
		scr_player_knightpepslopes();
		break;
	case states.portal:
		scr_player_portal();
		break;
	case states.secondjump:
		scr_player_secondjump();
		break;
	case states.chainsawbump:
		scr_player_chainsawbump();
		break;
	case states.handstandjump:
		scr_player_handstandjump();
		break;
	case states.lungeattack:
		scr_player_lungeattack();
		break;
	case states.lungegrab:
		scr_player_lungegrab();
		break;
	case states.dashtumble:
		scr_player_dashtumble();
		break;
	case states.shoulderbash:
		scr_player_shoulderbash();
		break;
	case states.gottreasure:
		scr_player_gottreasure();
		break;
	case states.knightpep:
		scr_player_knightpep();
		break;
	case states.knightpepattack:
		scr_player_knightpepattack();
		break;
	case states.knightpepbump:
		scr_player_knightpepbump();
		break;
	case states.meteorpep:
		scr_player_meteorpep();
		break;
	case states.bombpep:
		scr_player_bombpep();
		break;
	case states.bombpepup:
		scr_player_bombpepup();
		break;
	case states.bombpepside:
		scr_player_bombpepside();
		break;
	case states.bombgrab:
		scr_player_bombgrab();
		break;
	case states.grabbing:
		scr_player_grabbing();
		break;
	case states.chainsawpogo:
		scr_player_chainsawpogo();
		break;
	case states.shotgunjump:
		scr_player_shotgunjump();
		break;
	case states.stunned:
		scr_player_stunned();
		break;
	case states.highjump:
		scr_player_highjump();
		break;
	case states.chainsaw:
		scr_player_chainsaw();
		break;
	case states.hit:
		scr_player_hit();
		break;
	case states.thrown:
		scr_player_thrown();
		break;
	case states.facestomp:
		scr_player_facestomp();
		break;
	case states.timesup:
		scr_player_timesup();
		break;
	case states.machroll:
		scr_player_machroll();
		break;
	case states.pistol:
		scr_player_pistol();
		break;
	case states.shotgun:
		scr_player_shotgun();
		break;
	case states.shotguncrouch:
		scr_player_shotguncrouch();
		break;
	case states.shotguncrouchjump:
		scr_player_shotguncrouchjump();
		break;
	case states.shotgunshoot:
		scr_player_shotgunshoot();
		break;
	case states.shotgunfreefall:
		scr_player_shotgunfreefall();
		break;
	case states.shotgundash:
		scr_player_shotgundash();
		break;
	case states.machfreefall:
		scr_player_machfreefall();
		break;
	case states.throwing:
		scr_player_throwing();
		break;
	case states.superslam:
		scr_player_superslam();
		break;
	case states.slam:
		scr_player_slam();
		break;
	case states.skateboard:
		scr_player_skateboard();
		break;
	case states.grind:
		scr_player_grind();
		break;
	case states.grab:
		scr_player_grab();
		break;
	case states.punch:
		scr_player_punch();
		break;
	case states.backkick:
		scr_player_backkick();
		break;
	case states.uppunch:
		scr_player_uppunch();
		break;
	case states.shoulder:
		scr_player_shoulder();
		break;
	case states.backbreaker:
		scr_player_backbreaker();
		break;
	case states.graffiti:
		scr_player_graffiti();
		break;
	case states.bossdefeat:
		scr_player_bossdefeat();
		break;
	case states.bossintro:
		scr_player_bossintro();
		break;
	case states.smirk:
		scr_player_smirk();
		break;
	case states.pizzathrow:
		scr_player_pizzathrow();
		break;
	case states.dead:
		scr_player_gameover();
		break;
	case states.Sjumpland:
		scr_player_Sjumpland();
		break;
	case states.freefallprep:
		scr_player_freefallprep();
		break;
	case states.runonball:
		scr_player_runonball();
		break;
	case states.boulder:
		scr_player_boulder();
		break;
	case states.keyget:
		scr_player_keyget();
		break;
	case states.tackle:
		scr_player_tackle();
		break;
	case states.slipnslide:
		scr_player_slipnslide();
		break;
	case states.ladder:
		scr_player_ladder();
		break;
	case states.jump:
		scr_player_jump();
		break;
	case states.victory:
		scr_player_victory();
		break;
	case states.comingoutdoor:
		scr_player_comingoutdoor();
		break;
	case states.Sjump:
		scr_player_Sjump();
		break;
	case states.Sjumpprep:
		scr_player_Sjumpprep();
		break;
	case states.crouch:
		scr_player_crouch();
		break;
	case states.crouchjump:
		scr_player_crouchjump();
		break;
	case states.crouchslide:
		scr_player_crouchslide();
		break;
	case states.mach1:
		scr_player_mach1();
		break;
	case states.mach2:
		scr_player_mach2();
		break;
	case states.mach3:
		scr_player_mach3();
		break;
	case states.machslide:
		scr_player_machslide();
		break;
	case states.bump:
		scr_player_bump();
		break;
	case states.hurt:
		scr_player_hurt();
		break;
	case states.freefall:
		scr_player_freefall();
		break;
	case states.freefallland:
		scr_player_freefallland();
		break;
	case states.hang:
		scr_player_hang();
		break;
	case states.door:
		scr_player_door();
		break;
	case states.barrel:
		scr_player_barrel();
		break;
	case states.barreljump:
		scr_player_barreljump();
		break;
	case states.barrelslide:
		scr_player_barrelslide();
		break;
	case states.barrelclimbwall:
		scr_player_barrelclimbwall();
		break;
	case states.current:
		scr_player_current();
		break;
	case states.taxi:
		scr_player_taxi();
		break;
	case states.policetaxi:
		scr_player_taxi();
		break;
	case states.pogo:
		scr_player_pogo();
		break;
	case states.rideweenie:
		scr_player_rideweenie();
		break;
	case states.motorcycle:
		scr_player_motorcycle();
		break;
	case states.faceplant:
		scr_player_faceplant();
		break;
	case states.ghost:
		scr_player_ghost();
		break;
	case states.ghostpossess:
		scr_player_ghostpossess();
		break;
	case states.mort:
		scr_player_mort();
		break;
	case states.mortjump:
		scr_player_mortjump();
		break;
	case states.mortattack:
		scr_player_mortattack();
		break;
	case states.morthook:
		scr_player_morthook();
		break;
	case states.hook:
		scr_player_hook();
		break;
	case states.arenaintro:
		scr_player_arenaintro();
		break;
	case states.actor:
		scr_player_actor();
		break;
	case states.parry:
		scr_player_parry();
		break;
	case states.golf:
		scr_player_golf();
		break;
	case states.tube:
		scr_player_tube();
		break;
	case states.pummel:
		scr_player_pummel();
		break;
	case states.slipbanan:
		scr_player_slipbanan();
		break;
	case states.bombdelete:
		scr_player_bombdelete();
		break;
	case states.rocket:
		scr_player_rocket();
		break;
	case states.rocketslide:
		scr_player_rocketslide();
		break;
	case states.gotoplayer:
		scr_player_gotoplayer();
		break;
	case states.trickjump:
		scr_player_trickjump();
		break;
	case states.ridecow:
		scr_player_ridecow();
		break;
	case states.ratmount:
		scr_player_ratmount();
		break;
	case states.ratmounthurt:
		scr_player_ratmounthurt();
		break;
	case states.ratmountjump:
		scr_player_ratmountjump();
		break;
	case states.ratmountattack:
		scr_player_ratmountattack();
		break;
	case states.ratmountspit:
		scr_player_ratmountspit();
		break;
	case states.ratmountclimbwall:
		scr_player_ratmountclimbwall();
		break;
	case states.ratmountgroundpound:
		scr_player_ratmountgroundpound();
		break;
	case states.ratmountbounce:
		scr_player_ratmountbounce();
		break;
	case states.noisecrusher:
		scr_player_noisecrusher();
		break;
	case states.ratmountballoon:
		scr_player_ratmountballoon();
		break;
	case states.ratmountgrind:
		scr_player_ratmountgrind();
		break;
	case states.ratmounttumble:
		scr_player_ratmounttumble();
		break;
	case states.ratmountpunch:
		scr_player_ratmountpunch();
		break;
	case states.ratmounttrickjump:
		scr_player_ratmounttrickjump();
		break;
	case states.ratmountskid:
		scr_player_ratmountskid();
		break;
	case states.blockstance:
		scr_player_blockstance();
		break;
	case states.balloon:
		scr_player_balloon();
		break;
	case states.debugstate:
		scr_player_debugstate();
		break;
	case states.trashjump:
		scr_player_trashjump();
		break;
	case states.trashroll:
		scr_player_trashroll();
		break;
	case states.stringfling:
		scr_player_stringfling();
		break;
	case states.stringjump:
		scr_player_stringjump();
		break;
	case states.stringfall:
		scr_player_stringfall();
		break;
	case states.noisejetpack:
		scr_player_noisejetpack();
		break;
	case states.spiderweb:
		scr_player_spiderweb();
		break;
	case states.animatronic:
		scr_player_animatronic();
		break;
	case states.playersuperattack:
		scr_player_playersuperattack();
		break;
	case states.jetpackjump:
		scr_player_jetpackjump();
		break;
	case states.bee:
		scr_player_bee();
		break;
	case states.ratmountcrouch:
		scr_player_ratmountcrouch();
		break;
	case states.ratmountladder:
		scr_player_ratmountladder();
		break;
	case states.antigrav:
		scr_player_antigrav();
		break;
	case states.estampede:
		scr_player_estampede();
		break;
	case states.backtohub:
		scr_player_backtohub();
		break;
	case states.animation:
		scr_player_animation();
		break;
	case states.supergrab:
		scr_player_supergrab();
		break;
	case states.machcancelstart:
		scr_playerN_machcancelstart();
		break;
	case states.machcancel:
		scr_playerN_machcancel();
		break;
	case states.fightball:
		scr_player_fightball();
		break;
}
if (instance_exists(obj_swapmodeeffect))
	exit;
if state != states.backbreaker
	swap_taunt = false;
if (sprite_index == spr_playerN_phase3intro2 || sprite_index == spr_playerN_phase3intro3 || instance_exists(obj_pizzaface_thunderdark))
{
	if (!ispeppino || global.swapmode)
	{
		supernoisetimer += 20;
		supernoisefade = Wave(0, 0.8, supernoisefademax, 0.1, supernoisetimer);
		if ispeppino && !obj_swapmodefollow.visible
		{
			with obj_explosioneffect
			{
				if sprite_index == spr_supernoise_effect
					instance_destroy();
			}
		}
		if supernoisefx > 0
			supernoisefx--;
		else
		{
			supernoisefx = 10;
			var xx = x;
			var yy = y;
			if ispeppino
			{
				xx = obj_swapmodefollow.x;
				yy = obj_swapmodefollow.y;
			}
			if (!ispeppino || (obj_swapmodefollow.visible && obj_swapmodefollow.image_alpha > 0))
			{
				with (instance_create(xx + irandom_range(-30, 30), yy + irandom_range(0, 15), obj_explosioneffect))
				{
					sprite_index = spr_supernoise_effect;
					xoffset = x - xx;
					yoffset = y - yy;
					playerid = other.id;
					if other.ispeppino
						playerid = obj_swapmodefollow.id;
					image_speed = 0.35;
					depth = choose(-6, -12);
				}
			}
		}
	}
}
if (!ispeppino && state != states.chainsaw && prevstate == states.machcancel && sprite_index != spr_playerN_divebomb && sprite_index != spr_playerN_divebombfall && sprite_index != spr_playerN_divebombland && (prevsprite == spr_playerN_divebomb || prevsprite == spr_playerN_divebombfall || prevsprite == spr_playerN_divebombland))
	notification_push(notifs.cancel_noisedrill, []);
if (!ispeppino && ignore_grind && !place_meeting(x, y + vsp, obj_grindrail) && !place_meeting(x, y, obj_grindrail))
	ignore_grind = false;
if ghostdashcooldown > 0
	ghostdashcooldown--;
if state != states.machcancel && state != states.mach3
	noisemachcancelbuffer = 0;
if noisemachcancelbuffer > 0
	noisemachcancelbuffer--;
if state != states.chainsaw
{
	if !bodyslam_notif
	{
		if state == states.freefall
		{
			bodyslam_notif = true;
			notification_push(notifs.bodyslam_start, [room]);
		}
	}
	else if state != states.freefall
	{
		bodyslam_notif = false;
		notification_push(notifs.bodyslam_end, [room]);
	}
}
if state != states.crouchjump && state != states.crouch
	uncrouch = 0;
else if state == states.crouch && uncrouch > 0
	uncrouch--;
if (state == states.Sjump || (state == states.chainsaw && tauntstoredstate == states.Sjump))
	sjumptimer++;
else if sjumptimer > 0
{
	notification_push(notifs.superjump_timer, [sjumptimer, room]);
	sjumptimer = 0;
}
if invtime > 0
	invtime--;
if sprite_index == spr_noise_phasetrans1P && image_index > 24
{
	if !noisebossscream
	{
		fmod_event_one_shot_3d("event:/sfx/pep/screamboss", x, y);
		fmod_event_one_shot_3d("event:/sfx/voice/noisescream", obj_noiseboss.x, obj_noiseboss.y);
		noisebossscream = true;
	}
}
else if sprite_index != spr_noise_phasetrans1P
	noisebossscream = false;
if !ispeppino
{
	if (room == boss_pepperman || room == boss_vigilante || room == boss_noise || room == boss_fakepep || room == boss_pizzaface)
		global.pistol = true;
	else
		global.pistol = false;
}
if (global.pistol && ispeppino && state != states.animation && state != states.grab && state != states.superslam && state != states.actor && state != states.hurt && state != states.bump && state != states.machslide && state != states.Sjumpprep && state != states.Sjump && state != states.tumble && !instance_exists(obj_vigilante_duelintro))
{
	if ((key_slap && !key_slap2) || pistolchargeshooting)
		pistolcharge += 0.5;
	else
	{
		pistolcharge = 0.5;
		pistolchargeshot = 1;
	}
	if pistolcharge > 0
	{
		var ixa = [6, 14, 22, 30, 38];
		var _sound = false;
		for (var i = 0; i < array_length(ixa); i++)
		{
			if (floor(pistolcharge) == ixa[i])
				_sound = true;
		}
		if _sound && !pistolchargesound
		{
			pistolchargesound = true;
			fmod_event_one_shot_3d("event:/sfx/pep/revolvercharge", x, y);
		}
		else if !_sound
			pistolchargesound = false;
	}
	if (floor(pistolcharge) >= (sprite_get_number(spr_revolvercharge) - 1))
		pistolcharge = sprite_get_number(spr_revolvercharge) - 1;
	if (floor(pistolcharge) >= (sprite_get_number(spr_revolvercharge) - 16) && !pistolchargeshooting)
	{
		pistolchargeshooting = true;
		pistolchargeshot = 1;
	}
	if pistolchargeshot > 0 && pistolchargeshooting
	{
		if state != states.backbreaker && state != states.chainsaw
		{
			scr_pistolshoot(states.normal, true);
			pistolchargedelay = 5;
			pistolchargeshot--;
		}
	}
	else if pistolchargeshot <= 0 && pistolchargeshooting
	{
		pistolcharge = 0;
		pistolchargedelay = 5;
		pistolchargeshooting = false;
		pistolchargeshot = 1;
		if key_slap
			pistolcharge = 4;
	}
}
else if (state == states.hurt || state == states.bump || state == states.Sjumpprep || state = states.Sjump || instance_exists(obj_vigilante_duelintro))
{
	pistolcharge = 0;
	pistolcharged = false;
	pistolchargeshooting = false;
	pistolchargeshot = 1;
}
if pistolanim != -4
{
	pistolindex += 0.35;
	if (floor(pistolindex) == (sprite_get_number(pistolanim) - 1))
	{
		pistolanim = -4;
		pistolindex = 0;
	}
}
if pistolcooldown > 0
	pistolcooldown--;
if prevstate != state && state != states.chainsaw
{
	if prevstate == states.trashroll && prevsprite != spr_playercorpsestart && prevsprite != spr_playercorpsesurf
		create_debris(x, y, spr_player_trashlid);
	if (prevstate == states.slipnslide && !ispeppino && instance_exists(obj_surfback))
	{
		with (instance_create(x, y, obj_playernoisedebris))
			sprite_index = spr_surfback;
	}
	if prevstate == states.ghost
		instance_create(x, y, obj_ghostdrapes);
	if (room == tower_3 && state == states.backbreaker && place_meeting(x, y, obj_bossdoor))
	{
		resetdoisecount++;
		if resetdoisecount >= 3
			global.resetdoise = true;
	}
}
if (!place_meeting(x, y + 1, obj_railparent))
{
	if (state == states.mach3 || state == states.mach2 || state == states.tumble)
		railmovespeed = Approach(railmovespeed, 0, 0.1);
	else
		railmovespeed = Approach(railmovespeed, 0, 0.5);
}
if state != states.handstandjump && state != states.tumble
	crouchslipbuffer = 0;
if (state != states.mach3 && (state != states.chainsaw || tauntstoredstate != states.mach3))
	mach4mode = false;
if ratshootbuffer > 0
	ratshootbuffer--;
if state != states.animatronic
{
	animatronic_buffer = 180;
	animatronic_collect_buffer = 0;
}
if state == states.boxxedpep && grounded && vsp > 0
	boxxedpepjump = boxxedpepjumpmax;
if verticalbuffer > 0
	verticalbuffer--;
if superchargecombo_buffer > 0
	superchargecombo_buffer--;
else if superchargecombo_buffer == 0
{
	superchargecombo_buffer = -1;
	global.combotime = 4;
}
if state != states.normal
	breakdance_speed = 0.25;
if holycross > 0
	holycross--;
if (global.noisejetpack && (ispeppino || noisepizzapepper))
{
	if jetpackeffect > 0
		jetpackeffect--;
	else
	{
		jetpackeffect = 100;
		repeat 10
			instance_create(x, y, obj_firemouthflame);
	}
}
if ((state == states.jump || state == states.normal || state == states.machcancel || state == states.mach2 || state == states.mach3 || state == states.trickjump) && global.noisejetpack == true)
{
	if ((!can_jump && key_jump) || (grounded && key_jump && key_up))
	{
		fmod_event_instance_play(pizzapeppersnd);
		scr_fmod_soundeffect(jumpsnd, x, y);
		fmod_event_instance_set_parameter(pizzapeppersnd, "state", 0, true);
		if key_down
			vsp = 0;
		else
			vsp = -11;
		if move != 0
		{
			if state != states.machcancel
			{
				if movespeed < 10
					movespeed = 10;
			}
			else
			{
				if movespeed != 0
					xscale = sign(movespeed);
				movespeed = abs(movespeed);
				if (abs(movespeed) < 10)
					movespeed = 10;
			}
		}
		with (instance_create(x, y, obj_highjumpcloud2))
			sprite_index = spr_player_firemouthjumpdust;
		scr_do_pepperpizzajump();
	}
}
if walljumpbuffer > 0
	walljumpbuffer--;
if grounded && vsp > 0 && state != states.noisejetpack
	jetpackfuel = jetpackmax;
if tauntstoredisgustavo
{
	isgustavo = true;
	if state != states.backbreaker && state != states.parry && state != states.graffiti
		tauntstoredisgustavo = false;
}
if (state != states.mach3 && (state != states.machslide || sprite_index != spr_mach3boost))
{
	launch = false;
	launched = false;
	launch_buffer = 0;
}
if launch_buffer > 0
	launch_buffer--;
else
	launched = false;
if state != states.finishingblow
	finishingblow = false;
if dash_doubletap > 0
	dash_doubletap--;
if cow_buffer > 0
	cow_buffer--;
if state == states.lungeattack
	lunge_buffer = 14;
if blur_effect > 0
	blur_effect--;
else if (breakdance_speed >= 0.6 || (state == states.slipbanan && sprite_index == spr_rockethitwall) || mach4mode == true || boxxeddash == true || state == states.ghost || state == states.tumble || state == states.ratmountbounce || state == states.noisecrusher || state == states.ratmountattack || state == states.handstandjump || (state == states.barrelslide || (state == states.grab && sprite_index == spr_swingding && swingdingdash <= 0) || state == states.freefall || state == states.lungeattack || state == states.ratmounttrickjump || state == states.trickjump))
{
	if (visible && (collision_flags & colflag.secret) == 0)
	{
		blur_effect = 2;
		with (create_blur_afterimage(x, y, sprite_index, image_index - 1, xscale))
			playerid = other.id;
	}
}
if state != states.chainsaw && state != states.bump && state != states.boxxedpep && state != states.boxxedpepspin && state != states.boxxedpepjump
{
	boxxed = false;
	boxxeddash = false;
}
if state != states.grab
	grabbingenemy = false;
if state != states.mach2 && state != states.mach3 && state != states.trickjump && state != states.ratmounttumble && state != states.ratmounttrickjump
{
	ramp = false;
	ramp_points = false;
}
if (state != states.door && state != states.chainsaw && state != states.hit && place_meeting(x, y, obj_boxofpizza))
	state = states.crouch;
if shoot_buffer > 0
	shoot_buffer--;
if cheesepep_buffer > 0
	cheesepep_buffer--;
if state != states.cheesepepstickside
	yscale = 1;
if invhurt_buffer > 0
	invhurt_buffer--;
if state == states.hurt
{
	if hurt_buffer > 0
		hurt_buffer--;
	else
	{
		invhurt_buffer = invhurt_max;
		hurt_buffer = -1;
	}
}
else
{
	if hurt_buffer > 0
		invhurt_buffer = invhurt_max;
	hurt_buffer = -1;
}
if ((room == Realtitlescreen && instance_exists(obj_mainmenuselect)) || room == Mainmenu || room == Longintro || room == Endingroom || room == Creditsroom || room == Johnresurrectionroom)
	state = states.titlescreen;
if wallclingcooldown < 10
	wallclingcooldown++;
if boxxedspinbuffer > 0
	boxxedspinbuffer--;
if (supercharged && (collision_flags & colflag.secret) == 0)
{
	if superchargebuffer > 0
		superchargebuffer--;
	else if (state == states.normal || state == states.jump || state == states.mach1 || state == states.noisecrusher || state == states.mach2 || state == states.mach3 || state == states.ratmount || state == states.ratmountjump || state == states.ratmountbounce || state == states.ratmountskid)
	{
		superchargebuffer = 4;
		with (instance_create(x + irandom_range(-25, 25), y + irandom_range(-10, 35), obj_superchargeeffect))
			playerid = other.id;
	}
}
if state != states.Sjump
	sjumpvsp = -12;
if state != states.freefall
	freefallvsp = 20;
if supercharge > 9 && state != states.backbreaker
{
	if !supercharged
	{
		ini_open_from_string(obj_savesystem.ini_str);
		if (ini_read_real("Game", "supertaunt", false) == 0)
			create_transformation_tip(lang_get_value("supertaunttip"));
		ini_close();
		fmod_event_one_shot("event:/sfx/pep/gotsupertaunt");
	}
	supercharged = true;
}
if (!instance_exists(pizzashieldid) && pizzashield == 1)
{
	with (instance_create(x, y, obj_pizzashield))
	{
		playerid = other.object_index;
		other.pizzashieldid = id;
	}
}
if visible == 0 && state == states.comingoutdoor
{
	coopdelay++;
	image_index = 0;
	if coopdelay == 50
	{
		visible = true;
		coopdelay = 0;
	}
}
if global.coop == 1
{
	if ((state == states.punch || state == states.handstandjump) && !(obj_player2.state == states.punch || obj_player2.state == states.handstandjump))
		fightballadvantage = true;
	else if (!(obj_player2.state == states.punch || obj_player2.state == states.handstandjump))
		fightballadvantage = false;
}
if state != states.pogo && state != states.backbreaker
{
	pogospeed = 6;
	pogospeedprev = false;
}
scr_playersounds();
if grounded
	doublejump = false;
if pogochargeactive == 1
{
	if flashflicker == 0
	{
		if pogochargeactive == 1 && sprite_index == spr_playerN_pogofall
			sprite_index = spr_playerN_pogofallmach;
		if pogochargeactive == 1 && sprite_index == spr_playerN_pogobounce
			sprite_index = spr_playerN_pogobouncemach;
	}
	flashflicker = true;
	pogocharge--;
}
else
	flashflicker = false;
if state != states.throwing
	kickbomb = false;
if pogocharge == 0
{
	pogochargeactive = false;
	pogocharge = 100;
}
if flashflicker == 1
{
	flashflickertime++;
	if flashflickertime == 20
	{
		flash = true;
		flashflickertime = 0;
	}
}
if state != states.mach3 && state != states.grabbed
	fightball = false;
if state != states.grabbed && state != states.hurt
{
	if grounded && state != states.grabbing
		suplexmove = false;
}
if state != states.freefall && state != states.superslam && (state != states.chainsaw || (tauntstoredstate != states.freefall && tauntstoredstate != states.superslam)) && (state != states.backbreaker || (tauntstoredstate != states.freefall && tauntstoredstate != states.superslam))
&& !instance_exists(obj_secretportalstart)
	freefallsmash = -14;
if global.playerhealth <= 0 && state != states.dead
{
	image_index = 0;
	sprite_index = spr_playerV_dead;
	state = states.dead;
}
if (state == states.dead && y > (room_height * 2) && !instance_exists(obj_backtohub_fadeout))
{
	targetDoor = "HUB";
	scr_playerreset();
	if global.coop == 1
	{
		with obj_player2
		{
			scr_playerreset();
			targetDoor = "HUB";
		}
	}
	with obj_player1
	{
		image_index = 0;
		image_blend = c_white;
		visible = true;
	}
	with obj_player
	{
		x = -1000;
		y = -1000;
	}
	instance_create(0, 0, obj_backtohub_fadeout);
	global.leveltorestart = -4;
	global.leveltosave = -4;
	global.startgate = false;
}
if (baddiegrabbedID == obj_null && (state == states.grab || state == states.superslam || state == states.tacklecharge))
	state = states.normal;
if cutscene == 1 && state != states.gotoplayer
	global.heattime = 60;
if anger == 0
	angry = false;
if anger > 0
{
	angry = true;
	anger -= 1;
}
if sprite_index == spr_winding && state != states.normal
	windingAnim = 0;
if state != states.grab
	swingdingbuffer = 0;
if (state == states.antigrav || state == states.rocket || state == states.rocketslide)
	grav = 0;
else if state == states.barrel
	grav = 0.6;
else if (state == states.ghost || state == states.ghostpossess)
	grav = 0;
else if boxxed
	grav = 0.3;
else if sprite_index == spr_jetpackstart2
	grav = 0.4;
else if state == states.boxxedpepspin
	grav = 0.6;
else
	grav = 0.5;
if state == states.barrel && key_jump2 && !jumpstop
	grav = 0.4;
if sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43
	instance_create(x + random_range(-5, 5), y + 46, obj_vomit);
if sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43
{
	with (instance_create(x + random_range(-5, 5), y + 46, obj_vomit))
		sprite_index = spr_vomit2;
}
if (global.combo >= 25 && !instance_exists(angryeffectid) && sprite_index != spr_catched && state == states.normal && character != "V")
{
	with (instance_create(x, y, obj_angrycloud))
	{
		playerid = other.object_index;
		other.angryeffectid = id;
	}
}
if object_index == obj_player1
{
	if global.combotimepause > 0
		global.combotimepause--;
	if (global.combo != global.previouscombo && !is_bossroom())
	{
		if global.combo > global.highest_combo
			global.highest_combo = global.combo;
		global.previouscombo = global.combo;
		if ((global.combo % 5) == 0 && global.combo != 0)
		{
			instance_destroy(obj_combotitle);
			with (instance_create(x, y - 80, obj_combotitle))
			{
				title = floor(global.combo / 5);
				event_perform(ev_step, ev_step_normal);
			}
		}
	}
	if (!(state == states.door || state == states.teleport || state == states.shotgun || state == states.tube || state == states.spaceshuttle || state == states.taxi || state == states.gottreasure || state == states.victory || state == states.gottreasure || state == states.actor || state == states.comingoutdoor || (state == states.knightpep && (sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder)) || instance_exists(obj_fadeout) || (collision_flags & colflag.secret) > 0))
	{
		if room != forest_G1b && global.combotime > 0 && global.combotimepause <= 0
			global.combotime -= 0.15;
	}
	if global.heattime > 0
		global.heattime -= 0.15;
	if global.combotime <= 0 && global.combo >= 1
	{
		if global.combo >= 1
			fmod_event_one_shot("event:/sfx/misc/kashingcombo");
		global.savedcombo = global.combo;
		global.combotime = 0;
		global.combo = 0;
		with obj_camera
		{
			if comboend
			{
				comboend = false;
				event_perform(ev_alarm, 4);
			}
		}
		supercharge = 0;
	}
	if global.heattime <= 0 && global.style > -1 && global.stylelock == 0
		global.style -= 0.05;
}
if (key_jump && !grounded && (state == states.mach2 || state == states.mach3) && (state != (states.climbwall & walljumpbuffer)) <= 0)
	input_buffer_walljump = 24;
if boxxeddashbuffer > 0
	boxxeddashbuffer--;
if coyote_time > 0
	coyote_time--;
if input_buffer_jump > 0
	input_buffer_jump--;
if input_taunt_p2 > 0
	input_taunt_p2--;
if input_buffer_down > 0
	input_buffer_down--;
if input_buffer_mach > 0
	input_buffer_mach--;
if input_buffer_jump_negative > 0
	input_buffer_jump_negative--;
if input_buffer_secondjump < 8
	input_buffer_secondjump++;
if input_buffer_highjump < 8
	input_buffer_highjump++;
if input_attack_buffer > 0
	input_attack_buffer--;
if input_buffer_shoot > 0
	input_buffer_shoot--;
if input_finisher_buffer > 0
	input_finisher_buffer--;
if input_up_buffer > 0
	input_up_buffer--;
if input_down_buffer > 0
	input_down_buffer--;
if input_buffer_walljump > 0
	input_buffer_walljump--;
if input_buffer_slap > 0
	input_buffer_slap--;
if key_particles == 1
	create_particle(x + random_range(-25, 25), y + random_range(-35, 25), particle.keyparticles, 0);
if state != states.ratmount && state != states.ratmountjump && state != states.chainsaw
{
	gustavodash = 0;
	ratmount_movespeed = 8;
}
if inv_frames == 0 && hurted == 0 && state != states.ghost
	image_alpha = 1;
if (state == states.punch || (state == states.jump && sprite_index == spr_playerN_noisebombspinjump) || state == states.tacklecharge || state == states.skateboard || state == states.knightpep || state == states.cheesepep || state == states.knightpepslopes || state == states.knightpepattack || state == states.bombpep || state == states.facestomp || state == states.machfreefall || state == states.facestomp || state == states.mach3 || state == states.freefall || state == states.Sjump)
	attacking = true;
else
	attacking = false;
if (state == states.throwing || state == states.backkick || state == states.shoulder || state == states.uppunch)
	grabbing = true;
else
	grabbing = false;
if ((state == states.ratmountbounce && vsp >= 0) || (state == states.noisecrusher && vsp >= 0) || sprite_index == spr_player_Sjumpcancel || sprite_index == spr_swingding || sprite_index == spr_tumble || state == states.boxxedpepspin || state == states.trashroll || state == states.trashjump || state == states.shotgundash || (state == states.shotgunfreefall && (sprite_index == spr_shotgunjump2 || sprite_index == spr_shotgunjump3)) || state == states.Sjump || state == states.rocket || state == states.rocketslide || state == states.chainsawbump || (state == states.punch && ((sprite_index != spr_breakdanceuppercut && sprite_index != spr_breakdanceuppercutend) || vsp < 0)) || state == states.faceplant || state == states.rideweenie || state == states.mach3 || (state == states.jump && sprite_index == spr_playerN_noisebombspinjump) || state == states.freefall || state == states.fireass || state == states.jetpackjump || (state == states.firemouth && sprite_index != spr_firemouthintro) || state == states.hookshot || state == states.jetpackjump || state == states.skateboard || state == states.mach4 || state == states.Sjump || state == states.machfreefall || state == states.tacklecharge || (state == states.superslam && sprite_index == spr_piledriver) || state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes || state == states.trickjump || state == states.cheesepep || state == states.cheeseball || state == states.ratmounttumble || state == states.ratmountgroundpound || (global.noisejetpack == true && (ispeppino || noisepizzapepper)) || state == states.ratmountpunch || state == states.machcancel || state == states.antigrav || holycross > 0 || state == states.barrelslide || state == states.barrelclimbwall || ratmount_movespeed >= 12 || state == states.fightball || (!ispeppino && state == states.slipnslide && instance_exists(obj_surfback)) || ghostdash == true || state == states.slipbanan || state == states.shoulderbash || (state == states.machslide && (sprite_index == spr_mach3boost || sprite_index == spr_player_machslideboost3fall)))
	instakillmove = true;
else
	instakillmove = false;
if ((global.noisejetpack || holycross > 0) && (state == states.actor || state == states.chainsaw || state == states.backbreaker || state == states.gotoplayer || state == states.animation || state == states.arenaintro || state == states.teleport || state == states.Sjumpland))
	instakillmove = false;
if (state == states.chainsaw || state == states.backbreaker)
	instakillmove = false;
if ((state == states.ratmountbounce || state == states.noisecrusher) && vsp < 0)
	stunmove = true;
else
	stunmove = false;
if flash == 1 && alarm[0] <= 0
	alarm[0] = 0.15 * room_speed;
if state != states.ladder
	hooked = false;
if state != states.mach3 && state != states.machslide
	autodash = false;
if ((state != states.jump && state != states.crouchjump && state != states.slap) || vsp < 0)
	fallinganimation = 0;
if state != states.freefallland && state != states.normal && state != states.machslide && state != states.jump
	facehurt = false;
if state != states.normal && state != states.machslide
	machslideAnim = false;
if state != states.normal && state != states.ratmount
{
	idle = 0;
	dashdust = false;
}
if state != states.mach1 && state != states.cheesepepjump && state != states.jump && state != states.hookshot && state != states.handstandjump && state != states.normal && state != states.mach2 && state != states.mach3 && state != states.freefallprep && state != states.knightpep && state != states.shotgun && state != states.knightpepslopes
	momemtum = false;
if state != states.Sjump && state != states.Sjumpprep
	a = 0;
if state != states.facestomp
	facestompAnim = false;
if state != states.freefall && state != states.facestomp && state != states.superslam && state != states.freefallland
	superslam = 0;
if state != states.mach2
	machpunchAnim = false;
if ladderbuffer > 0
	ladderbuffer--;
if state != states.jump
	stompAnim = false;
if (state == states.mach3 || (state == states.ghost && ghostdash && ghostpepper >= 3) || state == states.mach2 || state == states.Sjump || ratmount_movespeed >= 12 || gusdashpadbuffer > 0)
{
	if (macheffect == 0 && !instance_exists(obj_swapgusfightball))
	{
		macheffect = true;
		toomuchalarm1 = 6;
		with (create_mach3effect(x, y, sprite_index, image_index - 1))
		{
			playerid = other.object_index;
			image_xscale = other.xscale;
		}
		if (sprite_index == spr_fightball && instance_exists(obj_swapmodefollow))
		{
			with (create_mach3effect(x, y, obj_swapmodefollow.spr_fightball, image_index - 1))
			{
				playerid = other.object_index;
				image_xscale = other.xscale;
			}
		}
	}
}
if !isgustavo
	gusdashpadbuffer = 0;
if (!(state == states.mach3) && state != states.machcancel && !(state == states.mach2) && ratmount_movespeed < 12 && (state != states.ghost || ghostpepper < 2 || !ghostdash) && gusdashpadbuffer <= 0 && state != states.Sjump)
	macheffect = false;
if toomuchalarm1 > 0
{
	toomuchalarm1 -= 1;
	if (toomuchalarm1 <= 0 && !instance_exists(obj_swapgusfightball) && (state == states.mach3 || (state == states.ghost && ghostdash && ghostpepper >= 3) || state == states.mach2 || state == states.Sjump || ratmount_movespeed >= 12 || gusdashpadbuffer > 0))
	{
		with (create_mach3effect(x, y, sprite_index, image_index - 1))
		{
			playerid = other.object_index;
			image_xscale = other.xscale;
		}
		if (sprite_index == spr_fightball && instance_exists(obj_swapmodefollow))
		{
			with (create_mach3effect(x, y, obj_swapmodefollow.spr_fightball, image_index - 1))
			{
				playerid = other.object_index;
				image_xscale = other.xscale;
			}
		}
		toomuchalarm1 = 6;
	}
}
if restartbuffer > 0
	restartbuffer--;
if ((y > (room_height + 300) || y < -800) && !place_meeting(x, y, obj_verticalhallway) && restartbuffer <= 0 && !verticalhallway && state != states.dead && state != states.gotoplayer && !global.levelreset && room != boss_pizzaface && room != tower_outside && room != boss_pizzafacefinale && state != states.dead && !instance_exists(obj_backtohub_fadeout) && state != states.backtohub)
{
	if room != Mainmenu && room != tower_outside && room != Realtitlescreen && room != Longintro && room != Endingroom && room != Johnresurrectionroom && room != Creditsroom && room != rank_room
	{
		visible = true;
		with obj_camera
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
		if state == states.ghostpossess
		{
			state = states.ghost;
			sprite_index = spr_ghostidle;
		}
		var s = state;
		notification_push(notifs.fall_outofbounds, [id, s]);
		state = states.actor;
		visible = false;
		hsp = 0;
		vsp = 0;
		fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, room_height - 100);
		with (instance_create(x, y + 540, obj_technicaldifficulty))
		{
			playerid = other.id;
			if !other.ispeppino
				noise = true;
			if !noise
			{
				if !other.isgustavo
					sprite = choose(spr_technicaldifficulty1, spr_technicaldifficulty2, spr_technicaldifficulty3);
				else
					sprite = spr_technicaldifficulty4;
			}
			else
				sprite = choose(spr_technicaldifficulty5, spr_technicaldifficulty6, spr_technicaldifficulty7);
		}
		vsp = 10;
	}
	else
	{
		state = states.titlescreen;
		x = -100;
		y = -100;
	}
}
if character == "S"
{
	if (state == states.crouchjump || state == states.crouch)
		state = states.normal;
}
if character != "M"
{
	if (!scr_solid_player(x, y))
	{
		if (state != states.ratmountcrouch && state != states.boxxedpepjump && state != states.boxxedpepspin && !(state == states.bump && sprite_index == spr_tumbleend) && (state != states.barrelslide && state != states.barrelclimbwall) && sprite_index != spr_player_breakdancesuper && sprite_index != spr_barrelslipnslide && sprite_index != spr_barrelroll && sprite_index != spr_bombpepintro && sprite_index != spr_knightpepthunder && state != states.stunned && state != states.crouch && state != states.shotguncrouch && state != states.shotguncrouchjump && state != states.boxxedpep && (state != states.pistol && sprite_index != spr_player_crouchshoot) && state != states.Sjumpprep && state != states.crouchslide && state != states.chainsaw && state != states.machroll && state != states.hurt && state != states.crouchjump && state != states.cheesepepstickup && state != states.cheesepepstickside && state != states.tumble)
			mask_index = spr_player_mask;
		else
			mask_index = spr_crouchmask;
	}
	else
		mask_index = spr_crouchmask;
}
else
	mask_index = spr_pepperman_mask;
if (state == states.gottreasure || sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder || state == states.keyget || state == states.chainsaw || state == states.door || state == states.ejected || state == states.victory || state == states.comingoutdoor || state == states.dead || state == states.gotoplayer || state == states.policetaxi || state == states.actor || (collision_flags & colflag.secret) > 0)
	cutscene = true;
else
	cutscene = false;
if ((state == states.normal || state == states.ratmount) && obj_player1.spotlight == 1 && !instance_exists(obj_uparrow) && (collision_flags & colflag.grounded) > 0)
{
	if (place_meeting(x, y, obj_uparrowhitbox))
	{
		with (instance_create(x, y, obj_uparrow))
			playerid = other.object_index;
	}
}
if (movespeed > 12 && abs(hsp) > 12 && state == states.mach3 && state != states.slipbanan && !instance_exists(speedlineseffectid) && !cutscene && (collision_flags & colflag.secret) <= 0)
{
	with (instance_create(x, y, obj_speedlines))
	{
		playerid = other.object_index;
		other.speedlineseffectid = id;
	}
}
scr_collide_destructibles();
if state != states.backtohub && state != states.ghostpossess && state != states.gotoplayer && state != states.debugstate && state != states.titlescreen && state != states.tube && state != states.grabbed && state != states.door && state != states.Sjump && state != states.ejected && state != states.comingoutdoor && state != states.boulder && state != states.keyget && state != states.victory && state != states.portal && state != states.timesup && state != states.gottreasure && state != states.dead
	scr_collide_player();
if (state == states.tube || state == states.gotoplayer || state == states.debugstate)
{
	x += hsp;
	y += vsp;
}
if state == states.boulder
	scr_collide_player();
scr_collide_destructibles();
with obj_ratblock
	scr_ratblock_destroy();
if state != states.comingoutdoor
	image_blend = c_white;
prevstate = state;
prevsprite = sprite_index;
if (distance_to_object(obj_spike) < 500)
{
	var dirs = [[0, 1], [0, -1], [1, 0], [-1, 0]];
	for(var i = 0; i < array_length(dirs); i++)
	{
		var b = dirs[i];
		with (instance_place(x + b[0], y + b[1], obj_spike))
		{
			if other.state != states.barrel
			{
				var h = other.hurted;
				scr_hurtplayer(other);
				if fake
					instance_destroy();
				if h != other.hurted && other.hurted
					fmod_event_one_shot_3d("event:/sfx/enemies/pizzardelectricity", x, y);
				break;
			}
			with other
			{
				state = states.bump;
				sprite_index = spr_bump;
				image_index = 0;
				hsp = -6 * xscale;
				vsp = -4;
				fmod_event_one_shot_3d("event:/sfx/knight/lose", x, y);
				repeat 3
					create_debris(x, y, spr_wooddebris);
			}
			break;
		}
	}
}
