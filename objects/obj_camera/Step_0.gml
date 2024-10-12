if room == editor_room
	exit;
player = (obj_player1.spotlight == 1) ? obj_player1 : obj_player2;
if (!instance_exists(obj_pizzaball))
	targetgolf = -4;
if collect_shake > 0
	collect_shake *= 0.5;
if healthshaketime > 0
{
	healthshaketime--;
	healthshake = random_range(-2, 2);
}
if healthshaketime == 0
	healthshake = 0;
if obj_player1.character == "V"
{
	if healthold != global.playerhealth
	{
		playerhealthup = healthold < global.hp;
		healthshaketime = 30;
		healthold = global.playerhealth;
	}
}
else if obj_player1.character == "P"
{
	if healthold != global.hp
	{
		playerhealthup = healthold < global.hp;
		healthshaketime = 30;
		healthold = global.hp;
	}
}
if global.coop == 1
{
	var p1 = player;
	var p2 = (obj_player1.spotlight == 1) ? obj_player2: obj_player1;
	p2pdistance = point_distance(p1.x, 0, p2.x, 0);
	p2pdistancex = (p1.x >= p2.x) ? (-p2pdistance / 5) : (p2pdistance / 5);
}
else
	p2pdistancex = 0;
if (floor(image_index) == 10)
	shoving = false;
if (room == strongcold_endscreen || room == Longintro || room == Mainmenu || room == rm_levelselect || room == rank_room || room == timesuproom || room == Realtitlescreen || room == characterselect || room == hub_loadingscreen || (string_copy(room_get_name(room), 1, 5) == "tower" && !global.panic))
	visible = false;
else
	visible = true;
if ((instance_exists(obj_debugcontroller) && !obj_debugcontroller.showhud) || !global.option_hud)
	visible = false;
if global.combo > 0
{
	comboend = true;
	var ct = global.combotime;
	if ct <= 40
	{
		if alarm[5] == -1
		{
			if ct >= 20
				alarm[5] = 12;
			else
				alarm[5] = 5;
		}
	}
	else
		combobubblevisible = true;
}
else if comboend
{
	comboend = false;
	event_perform(ev_alarm, 4);
}
if shoving == 1 && image_index >= 3 && bang == 0
{
	with (instance_create(x, y, obj_fallingHUDface))
	{
		if ((obj_player1.spotlight == 0 && obj_player1.character == "P") || (obj_player1.spotlight == 1 && obj_player2.character == "P"))
		{
			sprite = spr_pepinoHUDscream;
			hsp = random_range(-1, -5);
		}
		else
		{
			sprite = spr_noiseHUD_panic;
			hsp = random_range(1, 5);
		}
	}
	bang = true;
}
if shoving == 0
	bang = false;
if global.seconds <= 0 && global.minutes <= 0 && ded == 0
{
	alarm[1] = -1;
	if (global.miniboss || instance_exists(obj_toppinwarrior))
		alarm[2] = 1;
	else
		alarm[3] = 1;
	ded = true;
}
if global.seconds > 59
{
	global.minutes += 1;
	global.seconds -= 59;
}
if global.timedgatetimer
{
	if global.timedgatetime > 0
		global.timedgatetime--;
	else
	{
		global.timedgatetime = 0;
		global.timedgatetimer = false;
	}
}
if (!instance_exists(obj_ghostcollectibles))
{
	if ((global.panic == true && global.minutes < 1) || player.sprite_index == spr_player_timesup)
	{
		shake_mag = 2;
		shake_mag_acc = 3 / room_speed;
	}
	else if global.panic == true && basement == 0
	{
		shake_mag = 2;
		shake_mag_acc = 3 / room_speed;
	}
}
if shake_mag > 0
{
	shake_mag -= shake_mag_acc;
	if shake_mag < 0
		shake_mag = 0;
}
detachedby = -1;
detach = false;
follow_golf = false;
if (instance_exists(player) && !lock && player.state != states.timesup && player.state != states.dead)
{
	switch state
	{
		case states.normal:
			if (room == boss_pizzaface && instance_exists(obj_player1) && instance_exists(obj_pizzaface_thunderdark) && obj_player1.state != states.supergrab)
			{
				camera_set_view_size(view_camera[0], SCREEN_WIDTH * camzoom, SCREEN_HEIGHT * camzoom);
				camzoom = lerp(camzoom, 1, 0.08);
				if camzoom >= 0.998
					camzoom = 1;
			}
			var target = player;
			var tx = target.x + offset_x;
			var ty = target.y + offset_y;
			if target.state == states.backtohub
				ty = target.backtohubstarty;
			if (target.cutscene || (target.collision_flags & colflag.secret) > 0)
			{
				if player.state == states.actor && room == tower_pizzafacehall
					chargecamera = Approach(chargecamera, 150, 8);
				else
					chargecamera = Approach(chargecamera, 0, 10);
			}
			else if (target.state == states.mach2 || target.state == states.mach3)
			{
				if (target.state == states.mach3 && target.sprite_index == target.spr_fightball && sign(chargecamera) != target.xscale)
					chargecamera = Approach(chargecamera, 0, 10);
				else
				{
					var _targetcharge = target.xscale * ((target.movespeed / 4) * 50);
					var _tspeed = 0.3;
					chargecamera = Approach(chargecamera, _targetcharge, _tspeed);
				}
			}
			else if (target.ratmount_movespeed > 2 && target.key_attack && (target.state == states.ratmount || target.state == states.ratmountjump))
			{
				_targetcharge = target.xscale * ((abs(target.hsp) / 4) * 70);
				_tspeed = 0.3;
				chargecamera = Approach(chargecamera, _targetcharge, _tspeed);
			}
			else if ((abs(target.hsp) >= 16 || (target.state == states.chainsaw && target.tauntstoredmovespeed >= 16)) && player.state != states.climbwall && player.state != states.Sjump && player.state != states.ghost)
			{
				_targetcharge = target.xscale * ((abs(target.hsp) / 4) * 50);
				_tspeed = 2;
				if ((_targetcharge > 0 && chargecamera < 0) || (_targetcharge < 0 && chargecamera > 0))
					_tspeed = 8;
				chargecamera = Approach(chargecamera, _targetcharge, _tspeed);
			}
			else if target.state == states.machslide
				chargecamera = Approach(chargecamera, 0, 10);
			else
				chargecamera = Approach(chargecamera, 0, 6);
			var cam_width = camera_get_view_width(view_camera[0]);
			var cam_height = camera_get_view_height(view_camera[0]);
			if (targetgolf != -4 && !instance_exists(targetgolf))
				targetgolf = -4;
			if targetgolf == noone
			{
				if (!global.coop || room == characterselect || room == rm_levelselect || room == Realtitlescreen)
				{
					var cam_x = (tx - (cam_width / 2)) + chargecamera + p2pdistancex;
					var cam_y = ty - (cam_height / 2) - 50;
					cam_x = clamp(cam_x, 0, room_width - cam_width);
					cam_y = clamp(cam_y, 0, room_height - cam_height);
					camera_zoom(1, 0.035);
				}
				else if obj_player2.state != states.titlescreen
				{
					cam_x = ((obj_player1.x + obj_player2.x) / 2) - (cam_width / 2);
					cam_y = ((obj_player1.y + obj_player2.y) / 2) - (cam_height / 2);
					var disx = abs(obj_player1.x - obj_player2.x) / coop_zoom_width;
					var disy = abs(obj_player1.y - obj_player2.y) / coop_zoom_height;
					var dis = max(disx, disy);
					dis = max(1, dis);
					camera_zoom(dis, 0.035);
				}
			}
			else
			{
				var _px = 0;
				var _py = 0;
				if global.coop
				{
					_px = obj_player2.x;
					_py = obj_player2.y;
				}
				cam_x = ((obj_player1.x + targetgolf.x + _px) / 2) - (cam_width / 2);
				cam_y = ((obj_player1.y + targetgolf.y + _py) / 2) - (cam_height / 2) - 50;
				disx = abs(obj_player1.x - targetgolf.x - _px) / coop_zoom_width;
				disy = abs(obj_player1.y - targetgolf.y - _py) / coop_zoom_height;
				dis = max(disx, disy);
				dis = max(1, dis);
				camera_zoom(dis, 0.035);
			}
			if shake_mag != 0 && global.option_screenshake
			{
				cam_x += irandom_range(-shake_mag, shake_mag);
				cam_y += irandom_range(-shake_mag, shake_mag);
			}
			cx = cam_x + (cam_width / 2);
			cy = cam_y + (cam_height / 2);
			if cam_width > room_width
				cam_x += ((cam_width - room_width) / 2);
			if cam_height > room_height
				cam_y += ((cam_height - room_height) / 2);
			if global.option_screenshake
				cam_y += irandom_range(-shake_mag, shake_mag);
			camera_set_view_pos(view_camera[0], cam_x, cam_y);
			break;
		
		case states.camera_followtarget:
			cam_width = camera_get_view_width(view_camera[0]);
			cam_height = camera_get_view_height(view_camera[0]);
			tx = followtarget.x;
			ty = followtarget.y - 50;
			var dir = point_direction(x, y, followtarget.x, ty);
			cx = Approach(cx, followtarget.x, followspeed);
			cy = Approach(cy, ty, followspeed);
			if (abs(cx - followtarget.x) <= 4 && abs(cy - ty) <= 4)
				state = states.normal;
			cam_x = cx - (cam_width / 2);
			cam_y = cy - (cam_height / 2);
			cam_x = clamp(cam_x, 0, room_width - cam_width);
			cam_y = clamp(cam_y, 0, room_height - cam_height);
			if shake_mag != 0 && global.option_screenshake
			{
				cam_x += irandom_range(-shake_mag, shake_mag);
				cam_y += irandom_range(-shake_mag, shake_mag);
			}
			if cam_width > room_width
				cam_x += ((cam_width - room_width) / 2);
			if cam_height > room_height
				cam_y += ((cam_height - room_height) / 2);
			if global.option_screenshake
				cam_y += irandom_range(-shake_mag, shake_mag);
			camera_set_view_pos(view_camera[0], cam_x, cam_y);
			break;
	}
	offset_x = Approach(offset_x, 0, offset_speed);
	offset_y = Approach(offset_y, 0, offset_speed);
}
