switch (state)
{
	case states.idle:
		scr_enemy_idle();
		break;
	case states.charge:
		scr_enemy_charge();
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
}
if (state == states.stun && stunned > 40 && birdcreated == 0)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != states.stun)
	birdcreated = false;
if (place_meeting(x + hsp, y, obj_iceblock) && state == states.charge)
{
	with (instance_place(x + hsp, y, obj_iceblock))
		instance_destroy();
}
targetplayer = instance_nearest(x, y, obj_player);
if (state == states.walk && attack_cooldown <= 0)
{
	if (x != targetplayer.x && targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y < (y + 50) && targetplayer.y > (y - 50))
	{
		flame_buffer = flame_max;
		state = states.charge;
		image_xscale = sign(targetplayer.x - x);
		sprite_index = spr_peasanto_flameattack;
		image_index = 0;
		vsp = -5;
		hitboxcreate = false;
	}
}
if (state == states.charge)
{
	if (!hitboxcreate)
	{
		hitboxcreate = true;
		with (instance_create(x, y, obj_peasantohitbox))
			ID = other.id;
	}
	if (flame_buffer <= 0)
	{
		state = states.walk;
		sprite_index = walkspr;
		attack_cooldown = attack_max;
	}
	if (hsp != 0 && floor(image_index) == (image_number - 1))
		create_particle(x - (image_xscale * 20), y + 43, particle.cloudeffect, 0);
}
if (flame_buffer > 0)
	flame_buffer--;
if (attack_cooldown > 0)
	attack_cooldown--;
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state != states.grabbed)
	depth = 0;
if (state != states.stun)
	thrown = false;
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
if (sprite_index == idlespr && (hsp != 0 || vsp != 0))
	sprite_index = walkspr;
