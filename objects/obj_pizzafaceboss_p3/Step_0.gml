if (room == rm_editor)
	exit;
image_speed = 0.35;
targetplayer = obj_player1.id;
wastedhits = maxhp - elitehit;
switch (state)
{
	case states.arenaintro:
		scr_pizzaface_p3_arenaintro();
		break;
	case states.fall:
		scr_pizzaface_p3_fall();
		break;
	case states.staggered:
		scr_pizzaface_p3_staggered();
		break;
	case states.walk:
		scr_pizzaface_p3_walk();
		break;
	case states.stomp:
		scr_pizzaface_p3_stomp();
		break;
	case states.punch:
		scr_pizzaface_p3_punch();
		break;
	case states.jump:
		scr_pizzaface_p3_jump();
		break;
	case states.throwing:
		scr_pizzaface_p3_throwing();
		break;
	case states.swinging:
		scr_pizzaface_p3_swinging();
		break;
	case states.finale:
		scr_pizzaface_p3_finale();
		break;
	case states.pizzaheadjump:
		scr_boss_pizzaheadjump();
		break;
	case states.hit:
		scr_enemy_hit();
		break;
	case states.stun:
		scr_enemy_stun();
		break;
	case states.grabbed:
		scr_boss_grabbed();
		break;
	case states.pummel:
		scr_enemy_pummel();
		break;
}
if (state != states.pizzaheadjump)
{
	if ((state == states.fall && vsp < 0) || state == states.finale)
	{
		use_collision = false;
		if (state == states.fall)
		{
			x += hsp;
			y += vsp;
			if (vsp < 20)
				vsp += grav;
		}
	}
	else
		use_collision = true;
}
if (prevhp != elitehit)
{
	if (elitehit < prevhp)
	{
		currentattack = 0;
		vulnerable_buffer = 0;
		laugh = 0;
		pizzahead_subhp = pizzahead_maxsubhp;
		global.playerhit++;
		touchedground = false;
		hsp += (-image_xscale * 5);
		flickertime = 11;
		alarm[6] = 5;
		if (global.playerhit >= 3)
		{
			global.playerhit = 0;
			instance_create(obj_player1.x, -15, obj_hppickup);
		}
	}
	prevhp = elitehit;
}
if (state == states.stun)
{
	if (thrown)
		savedthrown = true;
	if (grounded && vsp > 0 && savedthrown)
	{
		stunned = 1;
		idle_timer = 1;
		ammo = 6;
	}
}
else
	savedthrown = false;
if (state == states.stun && stunned > 100 && birdcreated == 0)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if ((state == states.punch || state == states.stomp || state == states.swinging || state == states.jump) && alarm[4] == -1)
	alarm[4] = 5;
invincible = true;
if (vulnerable_buffer > 0 && state == states.walk && flickertime <= 0)
{
	vulnerable_buffer--;
	invincible = false;
}
if (state == states.stun && !savedthrown)
	invincible = false;
if (!invincible && alarm[5] < 0 && !flash)
	alarm[5] = 0.15 * room_speed;
if ((state == states.grabdash || (state == states.mach2 && attackspeed >= 10) || (state == states.throwing && sprite_index == spr_fakepeppino_flailing)) && alarm[4] < 0)
{
	alarm[4] = 10;
	if (state == states.freefall)
		alarm[4] = 5;
}
mask_index = spr_pizzahead_idle;
if (state != states.stun)
	birdcreated = false;
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
scr_pizzaface_p3_update_sounds();
