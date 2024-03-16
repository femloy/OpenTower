wastedhits = maxhp - hp;
targetplayer = obj_player1;
image_speed = 0.35;
switch state
{
	case states.fall:
		scr_pizzaface_p2_fall();
		break;
	case states.normal:
		scr_pizzaface_p2_normal();
		break;
	case states.pizzahead_look:
		scr_pizzaface_p2_look();
		break;
	case states.pizzahead_fishing:
		scr_pizzaface_p2_fishing();
		break;
	case states.pizzahead_bombrun:
		boss_pizzahead_bombrun();
		break;
	case states.pizzahead_npcthrow:
		boss_pizzahead_npcthrow();
		break;
	case states.pizzahead_portraitthrow:
		boss_pizzahead_portraitthrow();
		break;
	case states.pizzahead_enguarde:
		boss_pizzahead_enguarde();
		break;
	case states.pizzahead_sexypicture:
		boss_pizzahead_sexypicture();
		break;
	case states.pizzahead_pullinglevel:
		boss_pizzahead_pullinglevel();
		break;
	case states.pizzahead_eat:
		boss_pizzahead_eat();
		break;
	case states.pizzahead_surprisebox:
		boss_pizzahead_surprisebox();
		break;
}
if (place_meeting(x, y, obj_canonexplosion))
{
	if !explosionhit
	{
		explosionhit = true;
		hp--;
	}
}
else
	explosionhit = false;
if (hp <= 0 && !instance_exists(obj_fadeout))
{
	with obj_player
	{
		targetRoom = boss_pizzaface_p3;
		targetDoor = "A";
	}
	instance_create(0, 0, obj_fadeout);
}
scr_collide();
