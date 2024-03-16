if room == rm_editor
	exit;
switch state
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
if (state == states.walk && y > ystart && !scr_solid(x, y - 1))
	y--;
if (state == states.walk && y < ystart && !scr_solid(x, y + 1))
	y++;
if state == states.stun
	grav = 0.5;
else
	grav = 0;
if flash == 1 && alarm[2] <= 0
	alarm[2] = 0.15 * room_speed;
if state != states.grabbed
	depth = 0;
if state != states.charge
	scr_scareenemy();
if (sprite_index == spr_ancho_chargestart && floor(image_index) == image_number - 1)
{
	if hitboxcreate == 0 && state == states.charge
	{
		hitboxcreate = true;
		with (instance_create(x, y, obj_forkhitbox))
			ID = other.id;
	}
	sprite_index = spr_ancho_charge;
	movespeed = 10;
}
var player = instance_nearest(x, y, obj_player);
if ragebuffer > 0
	ragebuffer--;
if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 60) && y >= (player.y - 60)) && important == 0)
{
	if (state != states.rage && ragebuffer == 0 && elite && (state == states.walk || state == states.charge))
	{
		state = states.rage;
		sprite_index = spr_ancho_rage1;
		if x != player.x
			image_xscale = -sign(x - player.x);
		ragebuffer = 100;
		image_index = 0;
		image_speed = 0.5;
		flash = true;
		alarm[4] = 5;
		with (instance_create(x, y, obj_forkhitbox))
		{
			sprite_index = spr_bighitbox;
			mask_index = spr_bighitbox;
			ID = other.id;
		}
		create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
	}
	else if x != player.x && state != states.charge && y == ystart && important == 0
	{
		if state == states.walk
		{
			fmod_event_instance_play(chargesnd);
			fmod_event_instance_set_3d_attributes(chargesnd, x, y);
			image_index = 0;
			image_xscale = -sign(x - obj_player.x);
			state = states.charge;
			sprite_index = spr_ancho_chargestart;
		}
	}
}
if (state == states.stun || state == states.walk)
	movespeed = 0;
if state == states.idle && sprite_index == scaredspr
	vsp = 0;
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
