switch state
{
	case states.idle:
		if !active
		{
			hsp = 0;
			vsp = 0;
			sprite_index = spr_meatball_idle;
			if (point_in_camera(x, y, view_camera[0]) && (obj_camera.shake_mag >= 10 || obj_player.state == states.freefallland))
			{
				active = true;
				sprite_index = spr_meatball_roll;
			}
		}
		else if grounded
			state = states.walk;
		break;
	case states.turn:
		scr_enemy_turn();
		break;
	case states.walk:
		hsp = image_xscale * b_movespeed;
		if b_movespeed < 6
			b_movespeed += 0.5;
		if (scr_slope())
		{
			var _inst = instance_place(x, y + 1, obj_slope);
			if (sign(_inst.image_xscale) == -sign(image_xscale))
			{
				b_movespeed += 0.15;
				if b_movespeed > 26
					b_movespeed = 26;
			}
		}
		else if b_movespeed > 6
			b_movespeed -= 0.05;
		if (scr_solid(x + sign(hsp), y) && (!scr_slope() || (scr_solid_slope(x + sign(hsp), y - 2) || scr_solid(x + sign(hsp), y - 2))) && !place_meeting(x + sign(hsp), y, obj_destructibles))
			image_xscale *= -1;
		with (instance_place(x + sign(hsp), y, obj_destructibles))
			instance_destroy();
		break;
	case states.land:
		scr_enemy_land();
		break;
	case states.hit:
		scr_enemy_hit();
		break;
	case states.stun:
		if global.attackstyle != 2
		{
			switch hp
			{
				case -1:
					grav = 1.1;
					break;
				case -2:
					grav = 1.3;
					break;
			}
		}
		switch global.stylethreshold
		{
			case 0:
				stunned -= 0.5;
				break;
			case 1:
				stunned -= 0.65;
				break;
			case 2:
				stunned -= 0.8;
				break;
			case 3:
				stunned -= 1;
		}
		if stuntouchbuffer > 0
			stuntouchbuffer--;
		sprite_index = stunfallspr;
		image_speed = 0.35;
		if ((grounded || (grounded && !place_meeting(x, y, obj_platform))) && vsp > 0 && !place_meeting(x + hsp, y, obj_destructibles))
		{
			if thrown == 1 && destroyable
				instance_destroy();
			hsp = 0;
			thrown = false;
		}
		if (hitvsp < 0 && place_meeting(x, y - 1, obj_solid) && !place_meeting(x, y - 1, obj_destructibles))
		{
			if thrown == 1 && destroyable
				instance_destroy();
			thrown = false;
		}
		if (hithsp != 0 && place_meeting(x - image_xscale, y, obj_solid) && !place_meeting(x - image_xscale, y, obj_destructibles))
		{
			particle_set_scale(particle.impact, -image_xscale, 1);
			create_particle(x, y, particle.impact, 0);
			if thrown == 1 && destroyable
				instance_destroy();
			thrown = false;
		}
		if stunned <= 0 && grounded
		{
			vsp = 0;
			image_index = 0;
			sprite_index = walkspr;
			state = states.walk;
		}
		if (place_meeting(x, y + 1, obj_railparent))
		{
			var _railinst = instance_place(x, y + 1, obj_railparent);
			hsp += (_railinst.movespeed * _railinst.dir);
		}
		grav = 0.5;
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
	case states.rage:
		scr_enemy_rage();
		break;
	case states.ghostpossess:
		scr_enemy_ghostpossess();
		break;
}
if state == states.stun && stunned > 100 && birdcreated == 0
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if state != states.stun
	birdcreated = false;
if state == states.stun
{
	if stuntouchbuffer > 0
		stuntouched = true;
	if grounded && stunned > 1 && stuntouchbuffer <= 0
	{
		stunned = 1;
		if !stuntouched
			image_xscale *= -1;
	}
}
else
	stuntouched = false;
if flash == 1 && alarm[2] <= 0
	alarm[2] = 0.15 * room_speed;
angle = 0;
flash = false;
if state != states.grabbed
	depth = 0;
if state != states.stun
	thrown = false;
if boundbox == 0
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index;
		mask_index = other.sprite_index;
		baddieID = other.id;
		other.boundbox = true;
	}
}
