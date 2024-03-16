if (active && sprite_index != spr_secretportal_open && !instance_exists(obj_jumpscare) && ds_list_find_index(global.saveroom, id) == -1)
{
	if sprite_index != spr_secretportal_close
	{
		sprite_index = spr_secretportal_close;
		image_index = 0;
		fmod_event_one_shot_3d("event:/sfx/misc/secretenter", x, y);
	}
	if !touched
	{
		with obj_camera
			lock = true;
		if secret
			notification_push(notifs.secret_exit, [room]);
		else
			notification_push(notifs.secret_enter, [room, targetRoom]);
		if !secret
		{
			obj_music.secret = true;
			obj_music.secretend = false;
		}
		else
		{
			obj_music.secretend = true;
			obj_music.secret = false;
		}
	}
	playerid = other.id;
	other.ghostpepper = 0;
	other.ghostdash = false;
	other.x = x;
	other.y = y - 30;
	other.vsp = 0;
	other.hsp = 0;
	other.cutscene = true;
	other.brick = true;
	with obj_brickcomeback
	{
		create_particle(x, y, particle.genericpoofeffect);
		instance_destroy();
	}
	if !touched
	{
		other.superchargedeffectid = -4;
		if other.state != states.knightpep && other.state != states.knightpepslopes && other.state != states.knightpepbump && other.state != states.firemouth
		{
			if !other.isgustavo
				other.sprite_index = other.spr_hurt;
			else
				other.sprite_index = spr_player_ratmounthurt;
			other.image_speed = 0.35;
		}
		if other.state == states.knightpepslopes
		{
			other.sprite_index = other.spr_knightpepfall;
			other.state = states.knightpep;
			other.hsp = 0;
			other.vsp = 0;
		}
		other.tauntstoredstate = other.state;
		other.tauntstoredmovespeed = other.movespeed;
		other.tauntstoredhsp = other.hsp;
		other.tauntstoredvsp = other.vsp;
		other.tauntstoredsprite = other.sprite_index;
		other.state = states.secretenter;
	}
	touched = true;
	with obj_heatafterimage
		visible = false;
	instance_destroy(obj_superchargeeffect);
}
