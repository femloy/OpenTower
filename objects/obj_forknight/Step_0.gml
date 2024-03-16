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
	case states.ghostpossess:
		scr_enemy_ghostpossess();
		break;
	case states.pizzaheadjump:
		scr_enemy_pizzaheadjump();
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
scr_scareenemy();
if elite && ragecooldown == 0
{
	var player = instance_nearest(x, y, obj_player);
	var check = (image_xscale > 0) ? (player.x > x && player.x < (x + 400)) : (player.x < x && player.x > (x - 400));
	if state == states.walk
	{
		if (check && (y <= (player.y + 60) && y >= (player.y - 60)))
		{
			image_xscale = -sign(x - player.x);
			sprite_index = spr_forknight_ragestart;
			image_index = 0;
			flash = true;
			alarm[4] = 5;
			state = states.rage;
			ragedash = 50;
			create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
		}
	}
}
if ragedash > 0 && state == states.rage
	ragedash--;
if ragedash == 0 && state == states.rage
{
	state = states.walk;
	sprite_index = walkspr;
	ragecooldown = 100;
}
if ragecooldown > 0
	ragecooldown--;
if flash == 1 && alarm[2] <= 0
	alarm[2] = 0.15 * room_speed;
if hitboxcreate == 0 && state == states.walk
{
	hitboxcreate = true;
	with (instance_create(x, y, obj_forkhitbox))
		ID = other.id;
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
