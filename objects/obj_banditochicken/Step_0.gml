if (room == rm_editor)
	exit;
switch (state)
{
	case states.idle:
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
	case states.charge:
		scr_enemy_charge();
		break;
	case states.pizzaheadjump:
		scr_enemy_pizzaheadjump();
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
var targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1;
if (state == states.walk || state == states.idle)
{
	if ((targetplayer.x > (x - 400) && targetplayer.x < (x + 400)) && (y <= (targetplayer.y + 160) && y >= (targetplayer.y - 160)))
		activated = true;
}
if (!activated && (state == states.walk || state == states.idle))
	sprite_index = spr_banditochicken_sleep;
if ((state == states.walk || state == states.idle) && activated == 1 && sprite_index != spr_banditochicken_wake && sprite_index != spr_banditochicken_scared)
{
	fmod_event_one_shot_3d("event:/sfx/enemies/banditochicken", x, y);
	movespeed = 0;
	if (x != targetplayer.x)
		image_xscale = -sign(x - targetplayer.x);
	image_index = 0;
	sprite_index = spr_banditochicken_wake;
}
if (sprite_index == spr_banditochicken_wake && floor(image_index) == (image_number - 1))
{
	image_xscale *= -1;
	sprite_index = spr_banditochicken_chase;
	state = states.charge;
	movespeed = 8;
	with (instance_create(x, y, obj_jumpdust))
		image_xscale = other.image_xscale;
}
if (state == states.charge && bonebuffer > 0)
	bonebuffer--;
if (grounded && jumping < 40 && state == states.charge)
	jumping++;
if (state == states.charge && grounded && jumping >= 40)
{
	vsp = -11;
	jumping = 0;
	instance_create(x, y, obj_highjumpcloud2);
}
if (bonebuffer == 0)
{
	with (instance_create(x, y - 20, obj_banditochicken_dynamite))
	{
		fmod_event_one_shot_3d("event:/sfx/enemies/projectile", x, y);
		vsp = -10;
		image_xscale = other.image_xscale;
		hsp = 0;
		instance_create(x, y, obj_genericpoofeffect);
		var old_y = y;
		var t = false;
		while (y < room_height)
		{
			if (place_meeting(x, y, obj_solid))
				y++;
			else
			{
				t = true;
				break;
			}
		}
		if (!t)
			y = old_y;
	}
	bonebuffer = 100;
}
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
