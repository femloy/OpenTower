if room == rm_editor
	exit;
switch state
{
	case states.idle:
		if sprite_index != spr_soldier_idleend
			scr_enemy_idle();
		break;
	case states.turn:
		scr_enemy_turn();
		break;
	case states.walk:
		scr_enemy_walk();
		break;
	case states.land:
		scr_enemy_land();
		break;
	case states.hit:
		scr_enemy_hit();
		break;
	case states.stun:
		scr_enemy_stun();
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
}
if state == states.stun && stunned > 100 && birdcreated == 0
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if state != states.stun
	birdcreated = false;
if flash == 1 && alarm[2] <= 0
	alarm[2] = 0.15 * room_speed;
var player = instance_nearest(x, y, obj_player);
switch state
{
	case states.idle:
		if bush
		{
			var col = collision_line(x, y, player.x, player.y, obj_solid, false, true);
			var col2 = collision_line(x, y, player.x, player.y, obj_slope, false, true);
			var colX = player.x > (x - threshold_x) && player.x < (x + threshold_x);
			var colY = player.y > (y - threshold_y) && player.y < (y + threshold_y);
			if sprite_index != scaredspr && col == noone && col2 == noone && colX && colY
			{
				if x != player.x
					image_xscale = sign(player.x - x);
				bush = false;
				sprite_index = spr_soldier_idleend;
				image_index = 0;
			}
		}
		else if (sprite_index == spr_soldier_idleend && floor(image_index) == image_number - 1)
		{
			state = states.walk;
			sprite_index = spr_soldier_walk;
		}
		break;
	case states.charge:
		hsp = Approach(hsp, 0, 0.5);
		if (sprite_index == spr_soldier_shootstart && floor(image_index) == image_number - 1)
			sprite_index = spr_soldier_shoot;
		if sprite_index != spr_soldier_shootstart
		{
			if bullet_count > 0
			{
				if can_fire
				{
					can_fire = false;
					alarm[5] = fire_max;
					bullet_count--;
					sprite_index = spr_soldier_shoot;
					image_index = 0;
					hsp -= (image_xscale * recoil_spd);
					with (instance_create(x, y, obj_enemybullet))
					{
						fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y);
						image_xscale = other.image_xscale;
					}
				}
			}
			else if floor(image_index) == image_number - 1
			{
				sprite_index = walkspr;
				attack_cooldown = attack_max;
				state = states.walk;
			}
		}
		break;
	case states.walk:
		if attack_cooldown > 0
			attack_cooldown--;
		else
		{
			col = collision_line(x, y, player.x, player.y, obj_solid, false, true);
			col2 = collision_line(x, y, player.x, player.y, obj_slope, false, true);
			colX = player.x > (x - threshold_x) && player.x < (x + threshold_x);
			colY = player.y > (y - threshold_y) && player.y < (y + threshold_y);
			if sprite_index != scaredspr && col == noone && col2 == noone && colX && colY
			{
				if x != player.x
					image_xscale = sign(player.x - x);
				sprite_index = spr_soldier_shootstart;
				image_index = 0;
				state = states.charge;
				bullet_count = bullet_max;
				can_fire = true;
			}
		}
		break;
}
if elite
{
	if state == states.walk
	{
		if ((player.x > (x - 200) && player.x < (x + 200)) && (y <= (player.y + 60) && y >= (player.y - 60)))
		{
			if state != states.rage && ragebuffer == 0
			{
				hitboxcreate = false;
				state = states.rage;
				sprite_index = spr_soldier_knife;
				if x != player.x
					image_xscale = -sign(x - player.x);
				ragebuffer = 100;
				image_index = 0;
				image_speed = 0.5;
				flash = true;
				alarm[4] = 5;
				create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
			}
		}
	}
	if ragebuffer > 0
		ragebuffer--;
}
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
