switch (state)
{
	case 1:
		x += movespeed;
		if (x >= 358)
		{
			x = 358;
			movespeed = 0;
		}
		if (boulder_x <= x)
		{
			boulder_index = 1;
			state++;
			vsp = -18;
			sprite_index = spr_player_machfreefall;
		}
		break;
	case 2:
		x += 16;
		y += vsp;
		if (vsp < 20)
			vsp += grav;
		if (y > ystart)
			y = ystart;
		if (x > (room_width + 100))
			state++;
		break;
	case 3:
		fade = Approach(fade, 1, 0.1);
		fmod_event_one_shot("event:/sfx/intro/pepgustavointro");
		if (fade >= 1)
		{
			state++;
			fade = 1.5;
			introbuffer = 430;
			with (instance_create(0, 0, obj_introprop))
			{
				sprite_index = spr_towerintro;
				depth = -6;
			}
			with (instance_create(246, 405, obj_introprop))
			{
				sprite_index = spr_towerintro_peppino;
				depth = -8;
			}
			with (instance_create(136, 416, obj_introprop))
			{
				sprite_index = spr_towerintro_gustavo;
				depth = -7;
			}
			with (instance_create(623, 72, obj_introprop))
			{
				sprite_index = spr_towerintro_pizzaface;
				depth = -7;
			}
		}
		break;
	case 4:
		fade = Approach(fade, 0, 0.05);
		if (introbuffer > 0)
			introbuffer--;
		else if (fade <= 0)
		{
			state++;
			introbuffer = 120;
		}
		break;
	case 5:
		whitefade = Approach(whitefade, 1, 0.1);
		if (introbuffer > 0)
			introbuffer--;
		else if (whitefade >= 1)
			state++;
		break;
	case 6:
		fade = Approach(fade, 1, 0.1);
		if (fade >= 1 && !instance_exists(obj_fadeout))
		{
			with (obj_player)
			{
				targetRoom = tower_entrancehall;
				targetDoor = "A";
				state = states.victory;
				sprite_index = spr_victory;
			}
			with (instance_create_unique(0, 0, obj_fadeout))
				restarttimer = true;
		}
		break;
}
if (movespeed == 0)
	boulder_x -= 20;
