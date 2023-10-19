if (room == rm_editor)
	exit;
image_speed = 0.35;
switch (state)
{
	case states.idle:
		sprite_index = idlespr;
		playerid = instance_nearest(x, y, obj_player);
		hsp = 0;
		vsp = 0;
		var x1 = 370;
		if (bbox_in_camera(view_camera[0], 50))
		{
			if (image_xscale > 0)
				var t = playerid.x > (x - 16) && playerid.x < (x + x1) && playerid.y > (y - 16) && playerid.y < (y + 200);
			else
				t = playerid.x < (x + 16) && playerid.x > (x - x1) && playerid.y > (y - 16) && playerid.y < (y + 200);
			if (cooldown > 0)
				cooldown--;
			else if (t)
			{
				state = states.transition;
				sprite_index = spr_ghoul_attackstart;
				image_index = 0;
				attack_y = y;
			}
		}
		break;
	case states.charge:
		scr_enemy_charge();
		break;
	case states.walk:
		sprite_index = idlespr;
		var d = point_direction(x, y, xstart, ystart);
		x += lengthdir_x(8, d);
		y += lengthdir_y(8, d);
		hsp = 0;
		vsp = 0;
		if (x > (xstart - 10) && x < (xstart + 10) && y > (ystart - 10) && y < (ystart + 10))
		{
			state = states.idle;
			image_xscale = start_xscale;
			cooldown = 100;
			x = xstart;
			y = ystart;
		}
		else
			image_xscale = sign(x - xstart);
		break;
	case states.transition:
		hsp = 0;
		vsp = 0;
		if (floor(image_index) == (image_number - 1))
		{
			fmod_event_one_shot_3d("event:/sfx/enemies/minijohnpunch", x, y);
			state = states.punch;
			attackvsp = 11;
			attack_y = y;
			sprite_index = spr_ghoul_attack;
		}
		break;
	case states.punch:
		attackvsp = Approach(attackvsp, -11, 0.5);
		vsp = attackvsp;
		hsp = image_xscale * 10;
		if (y < attack_y && vsp < 0)
		{
			y = attack_y;
			vsp = 0;
			state = states.idle;
			cooldown = 100;
			image_xscale *= -1;
		}
		break;
	case states.turn:
		break;
	case states.land:
		scr_enemy_land();
		break;
	case states.hit:
		scr_enemy_hit();
		break;
	case states.stun:
		scr_enemy_stun();
		hit = true;
		break;
	case states.pizzagoblinthrow:
		scr_pizzagoblin_throw();
		break;
	case states.grabbed:
		scr_enemy_grabbed();
		break;
	case states.pummel:
		scr_enemy_pummel();
		break;
	case states.staggered:
		scr_enemy_staggered();
		break;
}
if (state == states.stun && stunned > 100 && birdcreated == 0)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != states.stun)
	birdcreated = false;
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state != states.grabbed)
	depth = 0;
if (state != states.stun)
	thrown = false;
if (bombreset > 0)
	bombreset--;
if (grounded && state == states.pizzagoblinthrow && floor(image_index) == 3)
	vsp = -5;
if (boundbox == 0)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index;
		mask_index = other.sprite_index;
		baddieID = other.id;
		other.boundbox = true;
	}
}
