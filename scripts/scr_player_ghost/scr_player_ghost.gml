function scr_player_ghostdash_sprites(min_mag = 2.5)
{
	var _h = abs(hsp) > 0;
	var mag = magnitude(hsp, vsp);
	trace(mag);
	if mag >= min_mag
	{
		var pad = 22;
		if (ghostangle < (45 - pad) || ghostangle > (315 + pad))
			sprite_index = spr_ghostdashright;
		else if (ghostangle >= (45 - pad) && ghostangle <= (45 + pad))
			sprite_index = spr_ghostdashupright;
		else if (ghostangle < (135 - pad) && ghostangle > (45 + pad))
			sprite_index = spr_ghostdashup;
		else if (ghostangle <= (135 + pad) && ghostangle >= (135 - pad))
			sprite_index = spr_ghostdashupright;
		else if (ghostangle > (135 + pad) && ghostangle < (225 - pad))
			sprite_index = spr_ghostdashright;
		else if (ghostangle <= (225 + pad) && ghostangle >= (225 - pad))
			sprite_index = spr_ghostdashdownright;
		else if (ghostangle > (225 + pad) && ghostangle < (315 - pad))
			sprite_index = spr_ghostdashdown;
		else if (ghostangle <= (315 + pad) && ghostangle >= (315 - pad))
			sprite_index = spr_ghostdashdownright;
	}
	else
		sprite_index = spr_ghostidle;
}

function scr_player_ghost()
{
	visible = true
	image_speed = 0.35
	ghosttimer++
	move_h = (key_right_axis + key_left_axis)
	move_v = (key_up_axis + key_down_axis)
	if move_h == 0
		move_h = (key_right + key_left)
	if move_v == 0
		move_v = (key_down - key_up)
	image_alpha = 1
	visible = true
	alarm[5] = -1
	alarm[6] = -1
	
	if !ispeppino
	{
		if hsp != 0
			xscale = sign(hsp)
		if !ghostdash
		{
			var maxspeed = 6
			var accel = 1
			movespeed = Approach(movespeed, (move_h * maxspeed), accel)
			hsp = movespeed
			vsp = Approach(vsp, (move_v * maxspeed), accel)
			if move_v < 0
				sprite_index = spr_ghostjump
			else
				sprite_index = spr_ghostidle
			if ghostdashcooldown > 0
				ghostdashcooldown--
			if key_slap2 && ghostdashcooldown <= 0 && ghostpepper > 0
			{
				ghostdashbuffer = 20
				ghostdash = true
				ghostdashend = false
				ghostbumpbuffer = 0
				movespeed = magnitude(abs(hsp), abs(vsp))
				scr_fmod_soundeffect(snd_ghostdash, x, y)
			}
			if !ispeppino
			{
				var g = point_direction(0, 0, move_h, move_v)
				if (move_h != 0 || move_v != 0)
					ghostangle = g
			}
			new_angle = ghostangle
		}
		else
		{
			maxspeed = 0
			accel = 0.8
			var velaccel = 0.8
			var deccel = 0.5
			ghostdashcooldown = 4
			if !ghostdashend
			{
				if ghostdashbuffer > 0
					ghostdashbuffer--
				else
					ghostdashend = true
				if ghostpepper == 1
					maxspeed = 18
				if ghostpepper == 2
					maxspeed = 22
				if ghostpepper >= 3
					maxspeed = 26
				movespeed = Approach(movespeed, maxspeed, accel)
			}
			else
			{
				movespeed = Approach(movespeed, 0, deccel)
				if (movespeed <= 2 || (movespeed <= 6 && (move_h != 0 || move_v != 0)))
				{
					ghostdash = false
					movespeed = hsp
				}
			}
			if (move_h != 0 || move_v != 0)
				new_angle = point_direction(0, 0, move_h, move_v)
			var angle = ghostangle
			if (abs(angle_difference(new_angle, ghostangle)) <= 90)
				ghostangle = angle_rotate(ghostangle, new_angle, 1.5)
			else
			{
				ghostdash = false
				movespeed = hsp
				ghostdashbuffer = 0
				ghostdashend = true
				fmod_event_instance_stop(snd_ghostdash, true)
			}
			var dx = lengthdir_x(movespeed, angle)
			var dy = lengthdir_y(movespeed, angle)
			hsp = Approach(hsp, dx, velaccel)
			vsp = Approach(vsp, dy, velaccel)
			if (scr_solid_player((x + sign(hsp)), (y + sign(vsp))) && (!(place_meeting((x + sign(hsp)), (y + sign(vsp)), obj_destructibles))) && (ghostpepper < 3 || (!(place_meeting((x + sign(hsp)), (y + sign(vsp)), obj_metalblock)))) && (!(place_meeting((x + sign(hsp)), (y + sign(vsp)), obj_slope))))
			{
				ghostbumpbuffer++
				if ghostbumpbuffer >= 20
				{
					ghostdash = false
					movespeed = 0
					ghostdashbuffer = 0
					ghostdashend = true
					fmod_event_instance_stop(snd_ghostdash, true)
				}
			}
			else
				ghostbumpbuffer = 0
			if ghosteffect > 0
				ghosteffect--
			else if ghostpepper >= 3
			{
				instance_create((x + random_range(-25, 25)), (y + random_range(-25, 25)), obj_cloudeffect)
				ghosteffect = 5
			}
			if punch_afterimage > 0
				punch_afterimage--
			else if movespeed >= 10
			{
				punch_afterimage = 10
				with (instance_create((x + random_range(-10, 10)), (y + random_range(-10, 10)), obj_explosioneffect))
				{
					sprite_index = spr_shineeffect
					image_speed = 0.35
				}
			}
			scr_player_ghostdash_sprites(!ghostdashend ? 0 : 2.5)
		}
		exit;
	}
	
	if sprite_index != spr_ghostend
	{
		maxspeed = 6
		var hspaccel = 0.4
		var vspaccel = 0.4
		if move_h == 0
			hspaccel = 0.4
		if move_v == 0
			vspaccel = 0.4
		if !ispeppino
		{
			if ghostdashbuffer > 0
			{
				ghostdashcooldown = 15
				ghostdashbuffer--
			}
			if key_slap2 && ghostdashcooldown <= 0
			{
				ghostdashbuffer = 20
				ghostdashstart = true
				ghostdashmovespeed = 0
				repeat 2
				{
					with (create_debris((x + random_range(-32, 32)), (y + random_range(-32, 32)), spr_flashdots, true))
					{
						hsp = random_range(-5, 5)
						vsp = random_range(-10, 10)
						image_speed = 0.4
					}
				}
			}
			ghostdash = (ghostpepper > 0 && ghostdashbuffer > 0)
		}
		if ghostdash
		{
			sprite_index = spr_ghostdash
			if ispeppino
			{
				if ghostpepper == 1
					maxspeed = 8
				if ghostpepper == 2
					maxspeed = 10
				if ghostpepper >= 3
					maxspeed = 12
			}
			else
			{
				if ghostpepper == 1
					maxspeed = 18
				if ghostpepper == 2
					maxspeed = 22
				if ghostpepper >= 3
					maxspeed = 26
				maxspeed -= ghostdashmovespeed
				ghostdashmovespeed += 0.1
				if maxspeed < 6
				{
					maxspeed = 6
					ghostdash = false
				}
			}
			hspaccel = 0.4
			vspaccel = 0.4
		}
		if ((ghostdash && ghostpepper >= 3) && ghosteffect == 0)
		{
			instance_create((x + random_range(-25, 25)), (y + random_range(-25, 25)), obj_cloudeffect)
			ghosteffect = 5
		}
		if ghosteffect > 0
			ghosteffect--
		if hsp != 0
			xscale = sign(hsp)
		if !ghostdash
		{
			if !ispeppino
			{
				hspaccel = 1
				vspaccel = 1
			}
			movespeed = Approach(movespeed, (move_h * maxspeed), hspaccel)
			hsp = movespeed
			vsp = Approach(vsp, (move_v * maxspeed), vspaccel)
			if move_v < 0
				sprite_index = spr_ghostjump
			else
				sprite_index = spr_ghostidle
			if !ispeppino
			{
				g = point_direction(0, 0, move_h, move_v)
				if (move_h != 0 || move_v != 0)
					ghostangle = g
			}
		}
		else
		{
			var m = maxspeed
			if (move_h != 0 || move_v != 0)
				ghostangle = point_direction(0, 0, move_h, move_v)
			else if ispeppino
				m = 0
			dx = lengthdir_x(m, ghostangle)
			dy = lengthdir_y(m, ghostangle)
			if (frac(move_h) > 0)
				dx = (move_h * m)
			if (frac(move_v) > 0)
				dy = (move_v * m)
			movespeed = Approach(movespeed, dx, hspaccel)
			hsp = movespeed
			vsp = Approach(vsp, dy, vspaccel)
			if !ispeppino && ghostdashstart
			{
				ghostdashstart = false
				movespeed = dx
				vsp = dy
			}
			if m != 0
			{
				scr_player_ghostdash_sprites()
				ghostbump = Approach(ghostbump, 1, 0.1)
				if (ispeppino && scr_solid_player((x + sign(hsp)), y) && (!(place_meeting((x + sign(hsp)), (y + sign(vsp)), obj_slope))))
					movespeed = 0
				if ghostbump < 0
				{
					hsp = (dx * ghostbump)
					vsp = (dy * ghostbump)
					sprite_index = spr_player_ghostbump
				}
				else
				{
					var mh = sign(hsp)
					var mv = sign(vsp)
					if (move_h != 0 || move_v != 0)
					{
						mh = move_h
						mv = move_v
					}
				}
			}
			else
				sprite_index = spr_ghostidle
		}
		if (place_meeting(x, y, obj_tombstone) && sprite_index != spr_ghostend)
		{
			sprite_index = spr_ghostend
			image_index = 0
			image_alpha = 1
			vsp = 10
			hsp = 0
			grav = 0.5
			movespeed = 0
			with (instance_place(x, y, obj_tombstone))
			{
				other.x = x
				other.y = y
			}
		}
	}
	if (sprite_index == spr_ghostend && floor(image_index) == image_number - 1)
		state = states.normal
	if place_meeting(x, y, obj_ghosttransparency)
		image_alpha = 0.5
	else
		image_alpha = 1
}

function scr_player_ghostpossess()
{
	visible = false;
	hsp = 0;
	if (!instance_exists(possessID))
	{
		visible = true;
		state = states.ghost;
		sprite_index = spr_ghostidle;
	}
}
