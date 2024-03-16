with obj_player2
	state = states.titlescreen;
switch state
{
	case states.jump:
		if room != boss_pizzafacefinale && vsp < 0
			y += vsp;
		vsp = Approach(vsp, -10, 0.1);
		if floor(image_index) == image_number - 1
		{
			if image_speed < 2
				image_speed += 0.1;
			if room == boss_pizzafacefinale && image_speed < 4
				image_speed += 0.1;
			if room != boss_pizzafacefinale
			{
				if (y < -200 && !instance_exists(obj_fadeout))
				{
					with obj_player
					{
						targetRoom = boss_pizzafacefinale;
						targetDoor = "B";
						instance_create(0, 0, obj_fadeout);
					}
				}
			}
			state = states.hit;
			hitX = x;
			hitY = y;
			hitLag = 5;
			with (instance_create(x, y, obj_explosioneffect))
			{
				image_speed = 0.6;
				depth = -20;
				sprite_index = choose(spr_pizzaface_hiteffect1, spr_pizzaface_hiteffect2, spr_pizzaface_hiteffect3, spr_pizzaface_hiteffect4);
			}
			repeat 2
			{
				with (create_debris(x, y, spr_slapstar))
					vsp = -irandom_range(8, 11);
			}
			repeat 1
			{
				with (create_debris(x, y, spr_baddiegibs))
					vsp = -irandom_range(8, 11);
			}
			instance_create(x + irandom_range(-40, 40), y + irandom_range(-40, 40), obj_parryeffect);
			repeat (4 + irandom(6))
			{
				var _spd = 5 + irandom(6);
				with (create_blur_afterimage(x, y, sprite_index, image_index - 1, image_xscale))
				{
					hsp = choose(-_spd, _spd);
					vsp = choose(-_spd, _spd);
					playerid = obj_player1.id;
				}
			}
			fmod_event_one_shot_3d("event:/sfx/pizzahead/beatdown", x, y);
			if image_xscale > 0
			{
				switch sprite_index
				{
					case spr_pizzahead_beatdown1:
						sprite_index = spr_pizzahead_beatdown2;
						break;
					case spr_pizzahead_beatdown2:
						sprite_index = spr_pizzahead_beatdown3;
						break;
					case spr_pizzahead_beatdown3:
						sprite_index = spr_pizzahead_beatdown4;
						break;
					case spr_pizzahead_beatdown4:
						sprite_index = spr_pizzahead_beatdown5;
						break;
					case spr_pizzahead_beatdown5:
						sprite_index = spr_pizzahead_beatdown6;
						break;
					case spr_pizzahead_beatdown6:
						sprite_index = spr_pizzahead_beatdown7;
						break;
					case spr_pizzahead_beatdown7:
						sprite_index = spr_pizzahead_beatdown8;
						break;
					case spr_pizzahead_beatdown8:
						sprite_index = spr_pizzahead_beatdown9;
						break;
					case spr_pizzahead_beatdown9:
						sprite_index = spr_pizzahead_beatdown10;
						break;
					case spr_pizzahead_beatdown10:
						sprite_index = spr_pizzahead_beatdown11;
						break;
					case spr_pizzahead_beatdown11:
						sprite_index = spr_pizzahead_beatdown12;
						break;
					case spr_pizzahead_beatdown12:
						sprite_index = spr_pizzahead_beatdown13;
						break;
					case spr_pizzahead_beatdown13:
						sprite_index = spr_pizzahead_beatdown14;
						break;
					case spr_pizzahead_beatdown14:
						sprite_index = spr_pizzahead_beatdown15;
						break;
					case spr_pizzahead_beatdown15:
						sprite_index = spr_pizzahead_beatdown14;
						image_xscale = -1;
						break;
				}
			}
			else
			{
				switch sprite_index
				{
					case spr_pizzahead_beatdown14:
						sprite_index = spr_pizzahead_beatdown13;
						break;
					case spr_pizzahead_beatdown13:
						sprite_index = spr_pizzahead_beatdown12;
						break;
					case spr_pizzahead_beatdown12:
						sprite_index = spr_pizzahead_beatdown11;
						break;
					case spr_pizzahead_beatdown11:
						sprite_index = spr_pizzahead_beatdown10;
						break;
					case spr_pizzahead_beatdown10:
						sprite_index = spr_pizzahead_beatdown9;
						break;
					case spr_pizzahead_beatdown9:
						sprite_index = spr_pizzahead_beatdown8;
						break;
					case spr_pizzahead_beatdown8:
						sprite_index = spr_pizzahead_beatdown7;
						break;
					case spr_pizzahead_beatdown7:
						sprite_index = spr_pizzahead_beatdown6;
						break;
					case spr_pizzahead_beatdown6:
						sprite_index = spr_pizzahead_beatdown5;
						break;
					case spr_pizzahead_beatdown5:
						sprite_index = spr_pizzahead_beatdown4;
						break;
					case spr_pizzahead_beatdown4:
						sprite_index = spr_pizzahead_beatdown3;
						break;
					case spr_pizzahead_beatdown3:
						sprite_index = spr_pizzahead_beatdown2;
						break;
					case spr_pizzahead_beatdown2:
						sprite_index = spr_pizzahead_beatdown1;
						break;
					case spr_pizzahead_beatdown1:
						sprite_index = spr_pizzahead_beatdown1;
						image_xscale = 1;
						break;
				}
			}
		}
		if superslam
		{
			if state == states.hit
			{
				x = hitX;
				y = hitY;
			}
			fmod_event_instance_play(snd);
			state = states.superslam;
			sprite_index = spr_pizzahead_piledriverfinal;
			image_index = 0;
			image_speed = 0.35;
		}
		break;
	case states.hit:
		x = hitX + irandom_range(-4, 4);
		y = hitY + irandom_range(-4, 4);
		if hitLag > 0
			hitLag--;
		else
		{
			x = hitX;
			y = hitY;
			state = states.jump;
		}
		break;
	case states.superslam:
		layer_vspeed(beatdown1_lay, Approach(layer_get_vspeed(beatdown1_lay), -8, 0.1));
		layer_vspeed(beatdown2_lay, Approach(layer_get_vspeed(beatdown2_lay), -9, 0.1));
		layer_vspeed(beatdown3_lay, Approach(layer_get_vspeed(beatdown3_lay), -10, 0.1));
		if image_speed < 0.6
			image_speed += 0.01;
		switch (floor(image_index))
		{
			case 0:
				pizzahead_x = 10;
				break;
			case 1:
				pizzahead_x = 5;
				break;
			case 2:
				pizzahead_x = 0;
				break;
			case 3:
				pizzahead_x = -5;
				break;
			case 4:
				pizzahead_x = -10;
				break;
			case 5:
				pizzahead_x = -5;
				break;
			case 6:
				pizzahead_x = 0;
				break;
			case 7:
				pizzahead_x = 5;
				break;
		}
		pizzahead_front = false;
		if (floor(image_index) >= 5 && floor(image_index) <= 7)
			pizzahead_front = true;
		break;
}
