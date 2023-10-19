targetplayer = obj_player1.id;
switch (state)
{
	case states.robotidle:
		hsp = 0;
		sprite_index = spr_introidle;
		image_speed = 0.35;
		if (object_index == obj_blobmonster)
		{
			if (grav < 0)
				grav *= -1;
			ys = 1;
		}
		break;
	case states.robotintro:
		hsp = 0;
		image_speed = 0.35;
		if (sprite_index != spr_intro)
		{
			sprite_index = spr_intro;
			image_index = 0;
		}
		if (floor(image_index) == (image_number - 1))
		{
			state = states.robotchase;
			sprite_index = chasespr;
		}
		break;
	case states.robotroaming:
		targetplayer = instance_nearest(x, y, obj_player);
		image_speed = 0.35;
		sprite_index = walkspr;
		hsp = image_xscale * 4;
		if (place_meeting(x + sign(hsp), y, obj_monstersolid) && (!place_meeting(x + sign(hsp), y, obj_monsterslope) || place_meeting(x + sign(hsp), y - 4, obj_solid)))
			image_xscale *= -1;
		scr_monster_detect_audio();
		if (scr_monster_detect(300, room_height, targetplayer))
			state = states.robotchase;
		break;
	case states.robotchase:
		if (sprite_index != spr_monstercheese_jump)
			sprite_index = chasespr;
		var t = grounded;
		if (object_index == obj_blobmonster)
			t = scr_monster_solid(x, y + (grav * 2));
		if (object_index != obj_hillbillymonster)
		{
			if (x != targetplayer.x && t)
			{
				image_xscale = sign(targetplayer.x - x);
				if (abs(x - targetplayer.x) > 50)
					hsp = image_xscale * 8;
				else
					hsp = Approach(hsp, 0, 0.5);
			}
			if (hsp == 0)
				sprite_index = idlespr;
			if (object_index != obj_blobmonster && place_meeting(x + hsp, y, obj_monstersolid) && !place_meeting(x + hsp, y, obj_monsterslope))
			{
				hsp = 0;
				sprite_index = idlespr;
			}
		}
		else
		{
			move = sign(targetplayer.x - x);
			if (move != 0)
			{
				if (move != image_xscale)
				{
					image_xscale = move;
					movespeed = -4;
				}
			}
			movespeed = Approach(movespeed, 8, 0.1);
			hsp = image_xscale * movespeed;
		}
		if (object_index == obj_blobmonster)
		{
			if (t && sprite_index == spr_monstercheese_jump)
				sprite_index = chasespr;
			if (t && place_meeting(x + sign(hsp), y, obj_monstersolid) && !place_meeting(x + sign(hsp), y, obj_monsterslope))
			{
				grav *= -1;
				state = states.fall;
				hsp = 0;
				sprite_index = spr_monstercheese_jump;
				image_index = 0;
			}
			else if (t && ys < 0 && point_in_camera(x, y, view_camera[0]) && targetplayer.x > (x - 200) && targetplayer.x < (x + 200))
			{
				grav *= -1;
				state = states.fall;
				sprite_index = spr_monstercheese_jump;
				image_index = 0;
			}
		}
		else if (object_index == obj_robotmonster)
		{
			if (!grounded)
				sprite_index = spr_monstershroom_fall;
		}
		if (floor(image_index) == (image_number - 1) && hsp != 0 && !steppy)
		{
			steppy = true;
			if (object_index != obj_blobmonster)
				create_particle(x, y + 43, particle.cloudeffect);
			else
			{
				var _y = 43;
				if (grav < 0)
					_y = -24;
				create_particle(x, y + _y, particle.cloudeffect);
			}
		}
		if (floor(image_index) != (image_number - 1))
			steppy = false;
		break;
	case states.fall:
		image_speed = 0.5;
		if (floor(image_index) == (image_number - 1))
			image_index = image_number - 1;
		if (scr_monster_solid(x, y + (grav * 2)))
		{
			ys *= -1;
			state = states.robotchase;
		}
		break;
	case states.robotseeking:
		targetplayer = instance_nearest(x, y, obj_player);
		hsp = image_xscale * 6;
		if (place_meeting(x + sign(hsp), y, obj_monstersolid) && (!place_meeting(x + sign(hsp), y, obj_monsterslope) || place_meeting(x + sign(hsp), y - 4, obj_solid)))
			state = states.robotroaming;
		if (scr_monster_detect(300, room_height, targetplayer))
			state = states.robotchase;
		break;
	case states.robotinvestigate:
		scr_monsterinvestigate(10, spr_monstershroom_chase, spr_monstershroom_idle);
		break;
}
if (object_index == obj_robotmonster || object_index == obj_hillbillymonster)
{
	if (state == states.robotchase || state == states.robotseeking || state == states.robotinvestigate)
	{
		instance_destroy(instance_place(x + hsp, y, obj_wirewall));
		instance_destroy(instance_place(x + hsp, y, obj_destructibles));
		instance_destroy(instance_place(x + hsp, y, obj_spike));
	}
}
if (sprite_index == spr_monstershroom_chase)
{
	var _sound = floor(image_index) == 2 || floor(image_index) == 7;
	if (_sound && !step_sound)
	{
		step_sound = true;
		fmod_event_one_shot_3d("event:/sfx/monsters/robotstep", x, y);
	}
	else if (!_sound)
		step_sound = false;
}
if (sprite_index == spr_hillbilly_chase)
{
	_sound = floor(image_index) == 3 || floor(image_index) == 9;
	if (_sound && !step_sound)
	{
		step_sound = true;
		fmod_event_one_shot_3d("event:/sfx/monsters/sausagestep", x, y);
	}
	else if (!_sound)
		step_sound = false;
}
if (object_index == obj_blobmonster)
{
	if (sprite_index == spr_monstercheese_chase)
	{
		if (!fmod_event_instance_is_playing(snd))
			fmod_event_instance_play(snd);
		fmod_event_instance_set_3d_attributes(snd, x, y);
	}
	else
		fmod_event_instance_stop(snd, true);
}
scr_monster_collide();
