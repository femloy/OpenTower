function scr_monster_deactivate(stopmusic = true)
{
	with obj_monster
	{
		x = xstart;
		y = ystart;
		xscale = 1;
		yscale = 1;
		if grav < 0
			grav *= -1;
		state = states.robotidle;
		event_perform(ev_other, ev_room_start);
	}
	with obj_objecticontracker
	{
		if sprite_index == spr_monsteralert
			instance_destroy();
	}
	with obj_monstergate
	{
		active = false;
		instance_activate_object(solidID);
		y = ystart;
	}
	with obj_pineapplemonsterzone
		shot = false;
	with obj_camerapatrol
	{
		alarm[5] = -1;
		patrolfound = false;
	}
	with obj_patroller
	{
		alarm[5] = -1;
		patrolfound = false;
	}
	with obj_baddiespawner
		instance_destroy(baddieid, false);
	if instance_exists(obj_ghostcollectibles)
	{
		instance_destroy(obj_patroller)
		instance_destroy(obj_camerapatrol)
	}
	fmod_event_instance_stop(global.snd_alarm, true);
	if stopmusic
		scr_monster_stop_music();
}
function scr_monster_stop_music()
{
	with obj_music
	{
		if (fmod_event_instance_is_playing(kidspartychaseID))
		{
			fmod_event_instance_stop(kidspartychaseID, false);
			if music != -4
			{
				fmod_event_instance_set_paused(music.event, savedmusicpause);
				fmod_event_instance_set_paused(music.event_secret, savedsecretpause);
			}
			fmod_event_instance_set_paused(pillarmusicID, savedpillarpause);
			fmod_event_instance_set_paused(panicmusicID, savedpanicpause);
		}
	}
}
function scr_monster_activate()
{
	if !instance_exists(obj_ghostcollectibles)
		notification_push(notifs.monster_activate, [room, object_index]);
	with obj_monster
	{
		if state == states.robotidle
		{
			state = states.robotintro;
			with (instance_create(x, y, obj_objecticontracker))
			{
				objectID = other.id;
				sprite_index = spr_monsteralert;
				image_speed = 0.18;
			}
		}
	}
	with obj_monstergate
	{
		if !active
		{
			active = true;
			instance_deactivate_object(solidID);
			image_speed = 0.35;
		}
	}
	instance_create_unique(0, 0, obj_kidspartybg);
	with obj_music
	{
		if (!global.panic && !instance_exists(obj_ghostcollectibles) && !fmod_event_instance_is_playing(kidspartychaseID))
		{
			fmod_event_instance_play(kidspartychaseID);
			if music != -4
			{
				savedmusicpause = fmod_event_instance_get_paused(music.event);
				savedsecretpause = fmod_event_instance_get_paused(music.event_secret);
				fmod_event_instance_set_paused(music.event, true);
				fmod_event_instance_set_paused(music.event_secret, true);
			}
			savedpillarpause = fmod_event_instance_get_paused(pillarmusicID);
			savedpanicpause = fmod_event_instance_get_paused(panicmusicID);
			fmod_event_instance_set_paused(pillarmusicID, true);
			fmod_event_instance_set_paused(panicmusicID, true);
		}
	}
}
function get_triangle_points(x, y, angle, length, size)
{
	var x2 = x + lengthdir_x(length, angle - size);
	var y2 = y + lengthdir_y(length, angle - size);
	var x3 = x + lengthdir_x(length, angle + size);
	var y3 = y + lengthdir_y(length, angle + size);
	return [x2, y2, x3, y3];
}
function scr_monster_detect(width, height, player)
{
	var _dir = (image_xscale > 0) ? (player.x > x) : (player.x < x);
	if (_dir && player.x < (x + width) && player.x > (x - width) && player.y < (y + height) && player.y > (y - height))
	{
		var detect = false;
		if (player.y > (y - 200))
		{
			with player
			{
				if (state != states.crouch || (!scr_solid(x, y - 24) && !place_meeting(x, y - 24, obj_platform)))
					detect = true;
			}
		}
		if detect
			return true;
	}
	return false;
}
function scr_puppet_detect()
{
	with obj_player
	{
		if ((object_index != obj_player2 || global.coop) && !place_meeting(x, y, obj_puppetsafezone))
		{
			return id;
		}
	}
	return noone;
}
function scr_puppet_appear(player)
{
	var _xdir = 96;
	var i = 0;
	while (collision_line(player.x, player.y, player.x + (_xdir * player.xscale), player.y, obj_solid, false, true))
	{
		_xdir--;
		i++;
		if i > room_width
		{
			x = player.x;
			break;
		}
	}
	x = player.x + (abs(_xdir) * player.xscale);
	y = player.y;
	state = states.robotchase;
	substate = states.fall;
	playerid = player;
	while (place_meeting(x, y, obj_solid))
	{
		x += (player.x > x) ? 1 : -1;
		i++;
		if i > room_width
		{
			x = player.x;
			break;
		}
	}
	var _col = collision_line(x, y, x, y - room_height, obj_solid, true, false);
	if _col != -4
	{
		while (!place_meeting(x, y - 1, obj_solid))
			y--;
	}
}
function scr_monsterinvestigate(speed, walkspr, idlespr)
{
	targetplayer = instance_nearest(x, y, obj_player);
	image_speed = 0.35;
	switch investigatestate
	{
		case 0:
		case 1:
			sprite_index = walkspr;
			hsp = image_xscale * speed;
			if (place_meeting(x + sign(hsp), y, obj_monstersolid) && (!place_meeting(x + sign(hsp), y, obj_monsterslope) || place_meeting(x + sign(hsp), y - 4, obj_solid)))
			{
				investigatestate++;
				image_xscale *= -1;
			}
			if investigatestate == 1
			{
				if ((image_xscale > 0 && x > (room_width / 2)) || (image_xscale < 0 && x < (room_width / 2)))
				{
					investigatestate = 2;
					waitbuffer = 100;
				}
			}
			break;
		
		case 2:
			sprite_index = idlespr;
			hsp = 0;
			if waitbuffer > 0
				waitbuffer--;
			else
			{
				state = states.robotroaming;
				image_xscale *= -1;
				instance_create(x, y, obj_patroller);
			}
			break;
	}
	if (scr_monster_detect(300, room_height, targetplayer))
		state = states.robotchase;
}
function scr_monster_detect_audio()
{
	if (scr_monster_audio_check())
	{
		if (!point_in_camera(x, y, view_camera[0]))
		{
			state = states.robotinvestigate;
			investigatestate = 0;
		}
		else
		{
			targetplayer = instance_nearest(x, y, obj_player);
			if object_index == obj_blobmonster
			{
				state = states.fall;
				gravdir *= -1;
				chase = false;
			}
			else
				state = states.robotchase;
		}
	}
}
function scr_monster_audio_check()
{
	/*
	if (audio_is_playing(sfx_groundpound) || audio_is_playing(sfx_scream5))
		return true;
	return false;
	*/
}
