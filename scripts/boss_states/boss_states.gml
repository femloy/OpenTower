function state_boss_chainsaw()
{
	hsp = 0;
	vsp = 0;
	image_speed = 0;
	x = hitX + irandom_range(-4, 4);
	y = hitY + irandom_range(-4, 4);
	hitLag--;
	if hitLag <= 0
	{
		image_speed = 0.35;
		x = hitX;
		y = hitY;
		state = hitstate;
		hsp = hithsp;
		vsp = hitvsp;
	}
}
function state_boss_walk(cooldown_end_script)
{
	image_speed = 0.35;
	sprite_index = fallspr;
	if grounded
	{
		if object_index != obj_mrstickboss
		{
			var b = ds_map_find_value(player_hurtstates, targetplayer.state);
			if (!is_undefined(b))
				boss_decide_taunt(130);
		}
		if state != states.backbreaker
		{
			if attack_cooldown <= 0
			{
				cooldown_end_script();
				if object_index != obj_mrstickboss
					image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : targetxscale;
			}
			else
				state = states.normal;
		}
	}
}
function state_boss_bump()
{
	movespeed = 0;
	sprite_index = bumpspr;
	image_speed = 0.35;
	if grounded && vsp > 0
		hsp = 0;
	if floor(image_index) == image_number - 1
		state = states.normal;
}
function state_boss_arenaround()
{
	image_speed = 0.35;
	var is_playerside = (targetplayer.x > (room_width / 2)) ? (x > (room_width / 5)) : (x < (room_width - (room_width / 5)));
	if is_playerside
		hsp = (targetplayer.x > (room_width / 2)) ? -normal_spd : normal_spd;
	else if !is_playerside && hsp != 0
	{
		image_xscale = -sign(hsp);
		hsp = 0;
	}
	if hsp != 0 && grounded
	{
		sprite_index = walkspr;
		image_xscale = sign(hsp);
	}
	else if grounded
		sprite_index = idlespr;
	else
		sprite_index = fallspr;
}
function boss_decide_taunt(unknown)
{
	
}
function state_boss_taunt()
{
	image_speed = 0;
	hsp = 0;
	vsp = 0;
	if taunt_buffer > 0 && state == states.backbreaker
	{
		taunt_buffer--;
		if (place_meeting(x, y, obj_player))
		{
			var playerinst = instance_place(x, y, obj_player);
			var s = ds_map_find_value(player_hurtstates, playerinst.state);
			if (!is_undefined(s))
			{
				attack_cooldown = floor(attack_max[phase - 1] / 2);
				image_xscale = -playerinst.xscale;
				sprite_index = parryspr;
				image_index = 0;
				taunt_buffer = 10;
				player_hurt(30, playerinst);
			}
		}
		if (place_meeting(x, y, obj_lungehitbox))
		{
			playerinst = instance_place(x, y, obj_lungehitbox);
			if (instance_exists(playerinst))
			{
				playerinst = playerinst.playerid;
				attack_cooldown = floor(attack_max[phase - 1] / 2);
				image_xscale = -playerinst.xscale;
				sprite_index = parryspr;
				image_index = 0;
				taunt_buffer = 10;
				player_hurt(30, playerinst);
			}
		}
	}
	else
	{
		image_speed = 0.35;
		state = taunt_storedstate;
		hsp = taunt_storedhsp;
	}
}
function state_boss_parry()
{
	image_speed = 0.35;
	hsp = movespeed * -image_xscale;
	if (image_index > image_number - 1)
	{
		state = taunt_storedstate;
		hsp = taunt_storedhsp;
	}
	if movespeed > 0
		movespeed -= 0.5;
	else
		movespeed = 0;
}
function state_player_arenaround()
{
	var _normal_spd = 6;
	var is_bossside = (x < (room_width / 2)) ? (x > (room_width / 5)) : (x < (room_width - (room_width / 5)));
	if is_bossside
		hsp = (x < (room_width / 2)) ? -_normal_spd : _normal_spd;
	else if !is_bossside && hsp != 0
	{
		xscale = -sign(hsp);
		hsp = 0;
	}
	if hsp != 0 && grounded
	{
		image_speed = 0.6;
		sprite_index = spr_move;
		xscale = sign(hsp);
	}
	else
	{
		image_speed = 0.35;
		if grounded
			sprite_index = spr_idle;
		else
			sprite_index = spr_fall;
	}
}
